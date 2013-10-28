//#include "maxcpp6.h"

#include "vx.shruthi.h"

#include <cstring>
#include <ctime>
#include <iostream>
#include <cstdlib>
#include <map>
#include <fstream>

#ifdef WIN_VERSION

//#define NTDDI_VERSION NTDDI_WINXP 
//#define _WIN32_WINNT _WIN32_WINNT_WINXP
//#define WINVER 0x0502
//#define _WIN32_WINNT 0x0502
//#define WIN32_LEAN_AND_MEAN

#include <Windows.h>
#include <Shlwapi.h>
#include <Shlobj.h>

#include <stdio.h>
#include <stdlib.h>

#define PATH_MAX MAX_PATH 

#if _MSC_VER
#define snprintf _snprintf
#endif

#else // MAC_VERSION
    #include <CoreServices/CoreServices.h>
    #include <sys/types.h>
    #include <sys/stat.h>
#endif

// for using _1 _2 
using namespace std::placeholders;


const float VELOCITY_SCALE_DOWN = 7.f / 127.f;
const float VELOCITY_SCALE_UP = 1.f / VELOCITY_SCALE_DOWN;

//#define WAVETABLE_NSAMPS 129
//#define WAVETABLE_SIZE 129 << 3 // 8 * 129

static const float SEQUENCE_UPDATE_INTERVAL_MS = 500.f;

const size_t kExternalEepromSize = kBankSize * kMaxNumBanks;
const size_t kExternalEepromOffset = kInternalEepromSize;
const size_t kEepromSize = kInternalEepromSize + kExternalEepromSize;

static t_symbol *ps_nrpn = gensym("nrpn");
static t_symbol *ps_empty = gensym("");
static t_symbol *psx_name = gensym("name"); 
static t_symbol *ps_settings = gensym("settings");
static t_symbol *ps_lpf = gensym("lpf");
static t_symbol *ps_ssm = gensym("ssm");
static t_symbol *ps_svf = gensym("svf");
static t_symbol *ps_dsp = gensym("dsp");
static t_symbol *ps_pvk = gensym("pvk");
static t_symbol *ps_4pm = gensym("4pm");
static t_symbol *ps_dly = gensym("dly");
static t_symbol *ps_sequence = gensym("sequence");
static t_symbol *ps_gate = gensym("gate");
static t_symbol *ps_note = gensym("note");
static t_symbol *ps_velocity = gensym("velocity");
static t_symbol *ps_ctrl = gensym("ctrl");
static t_symbol *ps_legato = gensym("legato");
static t_symbol *ps_rotation = gensym("rotation");
static t_symbol *ps_progress = gensym("progress");
static t_symbol *ps_liveGrid = gensym("liveGrid");


uint8_t Patch::CheckBuffer(uint8_t* buffer) {
    for (uint8_t i = 8; i < 24; ++i) {
        if (buffer[i] >= 128) {
            memset(name, '-', 8);
            return 0;
        }
    }
    if (buffer[91] != '!') {
        memset(name, '-', 8);
        return 0;
    }
    return 1;
}


VxShruthi::VxShruthi(t_symbol * sym, long ac, t_atom * av)
:   transfer_(device_),
    num_accessible_banks_(2),
    useEepromCache_(true),
    hasEepromCache_(false),
    progressCounter_(0),
//    slotIndex_(-1)
slotIndex_(0)
{
    
    if(isExpired()){
        setupIO(1, 0); // inlets / outlets
        object_error((t_object *)this, "This copy of Shreditor has expired.");
        return;
    }
    
    
    
    eeprom_ = new uint8_t[kEepromSize];
    settings_ = (SystemSettings *)eeprom_; // settings are stored in first part of eeprom
    
    memset(eeprom_, 0, kEepromSize*sizeof(uint8_t)); // init to zero
    
    // init active indexs to -1
    memset(workingPatchIndex_, -1, NUM_DEVICE_SLOTS*sizeof(int));
    memset(workingSequencerIndex_, -1, NUM_DEVICE_SLOTS*sizeof(int));
    
    setupIO(1, 2); // inlets / outlets

    device_.registerSysexCallback(std::bind(&VxShruthi::acceptSysexData, this, _1, _2, _3));
	device_.registerNrpnCallback(std::bind(&VxShruthi::midiNrpnCallback, this, _1, _2));
    transfer_.registerProgressCallback(std::bind(&VxShruthi::transferProgressReporter, this, _1, _2));
    
    m_clock = clock_new((t_object *)this, (method)onTick);
    clock_fdelay(m_clock, SEQUENCE_UPDATE_INTERVAL_MS);
    
    // after io is setup
    initializeSystemStoragePath();
    

}

VxShruthi::~VxShruthi() {
    
    // is dit handig?
    if(hasEepromCache_) saveDeviceEeprom();
    
    delete[] eeprom_;
    object_free(m_clock);
}

void VxShruthi::testpaths(const char* rootname){

    short rootpath;
    char filename[PATH_MAX];
    if(path_frompathname(rootname, &rootpath, filename)){
        object_error((t_object*)this, "path_frompathname failed");
		return;
    }
    
//    short userdocpath = path_userdocfolder();
//    short defaultpath = path_getdefault();
    //short newpath;
    //if(path_createfolder(root, "TeSTfolder", &newpath)){
    //    
    //    object_error((t_object*)this, "creatfolder TeSTfolder failed");
    //    //return;
    //}else{
    //
    //    DPOST("createfolder ok");
    //}
//    char userdocname[PATH_MAX];
//    char defaultname[PATH_MAX];
//    short outpath;
//    path_getname(userdocpath, userdocname, &outpath);
//    path_getname(defaultpath, defaultname, &outpath);
    
//    DPOST("userdocname %s", userdocname);
//    DPOST("defaultname %s", defaultname);
	short newpath;
	//short rootpath;
    if(path_createfolder(rootpath, "Vauxlab", &newpath)){
        object_error((t_object*)this, "createfolder Vauxlab failed");
        return;
    }

	if(path_createfolder(newpath, "Shreditor", &newpath)){
        object_error((t_object*)this, "createfolder Shreditor failed");
        return;
    }

	if(path_createfolder(newpath, "Eeprom", &newpath)){
        object_error((t_object*)this, "createfolder Eeprom failed");
        return;
    }

}

void VxShruthi::initializeSystemStoragePath(){
    

    #ifdef WIN_VERSION
    
    TCHAR path[MAX_PATH];
	TCHAR conformpath[MAX_PATH];
	if(SUCCEEDED(SHGetFolderPath(NULL, 
								 CSIDL_PROGRAM_FILES_COMMONX86|CSIDL_FLAG_CREATE, 
								 NULL, 
								 0, 
								 path))) 
	{
		if(path_nameconform(path, conformpath, PATH_STYLE_MAX_PLAT, PATH_TYPE_ABSOLUTE)){
			object_error((t_object*)this, "Failed to conform path");
		}
		std::string root = std::string(conformpath, strlen(path)) + std::string("/Vauxlab/Shreditor");
		//root = std::string(path, strlen(path)) + std::string("\\Vauxlab\\Shreditor");
		dataroot_ = root + std::string("/Eeprom");
		presetfile_ = root + std::string("/DevicePresets.json");

	}else{
		DWORD errcode = GetLastError();
		object_error((t_object*)this, "Failed to look up appdata path: %s", path);
		return;
	}
    
    #else // MAC_VERSION
    

    FSRef ref;
    OSType folderType = kApplicationSupportFolderType;
    char path[PATH_MAX];
    
    FSFindFolder( kUserDomain, folderType, kCreateFolder, &ref );
    FSRefMakePath( &ref, (UInt8*)&path, PATH_MAX );
	std::string root = std::string(path, strlen(path)) + std::string("/Vauxlab/Shreditor");
    dataroot_ = root + std::string("/Eeprom");
    presetfile_ = root + std::string("/DevicePresets.json");

	#endif
    

    DPOST("Shreditor userdata location: %s", dataroot_.c_str());
    
    testpaths(path);
    
    // Need defer low to output some data from the constructor,
    // otherwise outputs are not initialized at time of call.
    defer_low(this, (method)VxShruthi::onReady, NULL, 0, NULL);
    
}



void VxShruthi::outputDataroot(){
    atom_setsym(atoms_, gensym("dataroot"));
    atom_setsym(atoms_+1, gensym(dataroot_.c_str()));
    outlet_list(m_outlets[1], ps_empty, 2, atoms_);
    
    atom_setsym(atoms_, gensym("presetfile"));
    atom_setsym(atoms_+1, gensym(presetfile_.c_str()));
    outlet_list(m_outlets[1], ps_empty, 2, atoms_);
    
}

void VxShruthi::onReady(VxShruthi *x, t_symbol* s, short ac, t_atom *av){
    DPOST("onReady...");
    x->outputDataroot();
}

bool VxShruthi::isExpired(){

    time_t now = time(0);
    struct tm local;
    struct tm release;
    struct tm expire;
    double secondsSinceRelease;
    double secondsToExpire;
    local = *localtime(&now);
    
    // year is since 1900
    // mon range 0-11
    // mday range 1-31
    release = local;
    release.tm_hour = 0;   release.tm_min = 0; release.tm_sec = 0;
    release.tm_year = 113; release.tm_mon = 10; release.tm_mday = 28;
    
    expire = local;
    expire.tm_hour = 0;   expire.tm_min = 0; expire.tm_sec = 0;
    expire.tm_year = 113; expire.tm_mon = 11; expire.tm_mday = 1;
    
    secondsSinceRelease = difftime(now, mktime(&release));
    secondsToExpire = difftime(mktime(&expire), now);
    
    post("vx.shruthi version beta 2");
    post("© vauxlab 2013");
    post("author Thijs Koerselman");
    post("expires %s", asctime(&expire));
    
//    DPOST("%.f seconds since release", secondsSinceRelease);
//    DPOST("%.f seconds to expire", secondsToExpire);
    
    if(secondsSinceRelease <= 0)
        return true; // time is reset by user before release time
    
    if(secondsToExpire <= 0)
        return true;
    
    return false;
}


uint16_t VxShruthi::addressable_space_size() {
    return kInternalEepromSize + num_accessible_banks_ * kBankSize;
}

//void VxShruthi::outputProgress(long busy, long progress){
void VxShruthi::outputProgress(long progress){
    
    int total = addressable_space_size();
    int uploaded = ++progressCounter_ * 128;
    int percentage = ((float)uploaded / total) * 100;

    atom_setsym(atoms_, ps_progress);
    atom_setlong(atoms_+1, percentage);
    atom_setlong(atoms_+2, uploaded);
    atom_setlong(atoms_+3, total);
    
    outlet_list(m_outlets[1], ps_empty, 4, atoms_);
    
    if(percentage == 100){
        DPOST("done 100%");
        // switch to self just to output everytying
        switchToDevice(0, slotIndex_+1); // +1 since v start at 1
    }
    
}

void VxShruthi::outputPatchData(){    
    // Convert name directly to symbol. Both should be char
    
    Patch &p = workingPatch_[slotIndex_];
    
    atom_setsym(atoms_, psx_name);
    atom_setsym(atoms_+1, gensym((char*)p.name));
    outlet_list(m_outlets[1], ps_empty, 2, atoms_);
    
    
    
    outputNrpn(0, p.osc[0].shape);
    outputNrpn(1, p.osc[0].parameter);
    outputNrpn(2, p.osc[0].range);
    outputNrpn(3, p.osc[0].option); // modulation operator?
    
    outputNrpn(4, p.osc[1].shape);
    outputNrpn(5, p.osc[1].parameter);
    outputNrpn(6, p.osc[1].range);
    outputNrpn(7, p.osc[1].option); // detune?
    
    outputNrpn(8, p.mix_balance);
    outputNrpn(9, p.mix_sub_osc);
    outputNrpn(10, p.mix_noise);
    outputNrpn(11, p.mix_sub_osc_shape);
    
    outputNrpn(12, p.filter_cutoff);
    outputNrpn(13, p.filter_resonance);
    outputNrpn(14, p.filter_env);
    outputNrpn(15, p.filter_lfo);
    
    outputNrpn(16, p.env[0].attack);
    outputNrpn(17, p.env[0].decay);
    outputNrpn(18, p.env[0].sustain);
    outputNrpn(19, p.env[0].release);
    
    outputNrpn(20, p.env[1].attack);
    outputNrpn(21, p.env[1].decay);
    outputNrpn(22, p.env[1].sustain);
    outputNrpn(23, p.env[1].release);

    outputNrpn(24, p.lfo[0].waveform);
    outputNrpn(25, p.lfo[0].rate);
    outputNrpn(26, p.lfo[0].attack);
    outputNrpn(27, p.lfo[0].retrigger_mode);
    
    outputNrpn(28, p.lfo[1].waveform);
    outputNrpn(29, p.lfo[1].rate);
    outputNrpn(30, p.lfo[1].attack);
    outputNrpn(31, p.lfo[1].retrigger_mode);

    // kModulationMatrixSize 12
    outputNrpn(32, p.modulation_matrix.modulation[0].source);
    outputNrpn(33, p.modulation_matrix.modulation[0].destination);
    outputNrpn(34, p.modulation_matrix.modulation[0].amount);
    outputNrpn(35, p.modulation_matrix.modulation[1].source);
    outputNrpn(36, p.modulation_matrix.modulation[1].destination);
    outputNrpn(37, p.modulation_matrix.modulation[1].amount);
    outputNrpn(38, p.modulation_matrix.modulation[2].source);
    outputNrpn(39, p.modulation_matrix.modulation[2].destination);
    outputNrpn(40, p.modulation_matrix.modulation[2].amount);
    outputNrpn(41, p.modulation_matrix.modulation[3].source);
    outputNrpn(42, p.modulation_matrix.modulation[3].destination);
    outputNrpn(43, p.modulation_matrix.modulation[3].amount);
    outputNrpn(44, p.modulation_matrix.modulation[4].source);
    outputNrpn(45, p.modulation_matrix.modulation[4].destination);
    outputNrpn(46, p.modulation_matrix.modulation[4].amount);
    outputNrpn(47, p.modulation_matrix.modulation[5].source);
    outputNrpn(48, p.modulation_matrix.modulation[5].destination);
    outputNrpn(49, p.modulation_matrix.modulation[5].amount);
    outputNrpn(50, p.modulation_matrix.modulation[6].source);
    outputNrpn(51, p.modulation_matrix.modulation[6].destination);
    outputNrpn(52, p.modulation_matrix.modulation[6].amount);
    outputNrpn(53, p.modulation_matrix.modulation[7].source);
    outputNrpn(54, p.modulation_matrix.modulation[7].destination);
    outputNrpn(55, p.modulation_matrix.modulation[7].amount);
    outputNrpn(56, p.modulation_matrix.modulation[8].source);
    outputNrpn(57, p.modulation_matrix.modulation[8].destination);
    outputNrpn(58, p.modulation_matrix.modulation[8].amount);
    outputNrpn(59, p.modulation_matrix.modulation[9].source);
    outputNrpn(60, p.modulation_matrix.modulation[9].destination);
    outputNrpn(61, p.modulation_matrix.modulation[9].amount);
    outputNrpn(62, p.modulation_matrix.modulation[10].source);
    outputNrpn(63, p.modulation_matrix.modulation[10].destination);
    outputNrpn(64, p.modulation_matrix.modulation[10].amount);
    outputNrpn(65, p.modulation_matrix.modulation[11].source);
    outputNrpn(66, p.modulation_matrix.modulation[11].destination);
    outputNrpn(67, p.modulation_matrix.modulation[11].amount);
    

    outputNrpn(84, p.filter_cutoff_2);
    outputNrpn(85, p.filter_resonance_2);
    outputNrpn(92, p.filter_1_mode_);
    outputNrpn(93, p.filter_2_mode_);
    
    outputNrpn(94, p.ops_[0].operands[0]);
    outputNrpn(95, p.ops_[0].operands[1]);
    outputNrpn(96, p.ops_[0].op);
    outputNrpn(97, p.ops_[1].operands[0]);
    outputNrpn(98, p.ops_[1].operands[1]);
    outputNrpn(99, p.ops_[1].op);
}



void VxShruthi::setSystemSettings(long inlet, t_symbol *s, long ac, t_atom *av){
    
    if(ac != 10){
        object_error((t_object*)this,"setSystemSettings expects 10 arguments, not %i", ac);
        return;
    }
    
    settings_->octave = atom_getlong(av);
    settings_->raga = atom_getlong(av+1);
    settings_->portamento = atom_getlong(av+2);
    settings_->legato = atom_getlong(av+3);
    settings_->master_tuning = atom_getlong(av+4);
    settings_->midi_channel = atom_getlong(av+5);
    settings_->midi_out_mode = atom_getlong(av+6);
    settings_->midi_split_point = atom_getlong(av+7);
    settings_->expansion_filter_board = atom_getlong(av+8);
    settings_->expansion_cv_mode = atom_getlong(av+9);

    transferSystemSettings();
}

void VxShruthi::outputSettingsData(){
     
    t_atom* a = atoms_;
    
    atom_setsym(a++, ps_settings);
    atom_setlong(a++, settings_->octave);
    atom_setlong(a++, settings_->raga);
    atom_setlong(a++, settings_->portamento);
    atom_setlong(a++, settings_->legato);
    atom_setlong(a++, settings_->master_tuning);
    atom_setlong(a++, settings_->midi_channel);
    atom_setlong(a++, settings_->midi_out_mode);
    atom_setlong(a++, settings_->midi_split_point);
    atom_setlong(a++, settings_->expansion_filter_board);
    atom_setlong(a++, settings_->expansion_cv_mode);
    outlet_list(m_outlets[1], ps_empty, 11, atoms_);
}

void VxShruthi::outputNrpn(long index, long value){
//    post("outputNrpn %i, %i", index, value);
    atom_setlong(atoms_, index);
    atom_setlong(atoms_+1, value);
    outlet_list(m_outlets[0],  ps_nrpn, 2, atoms_);
}

void VxShruthi::outputSequencerSettings(){
    
    SequencerSettings &s = workingSequencer_[slotIndex_];
    
    outputNrpn(100, s.seq_mode);
    outputNrpn(101, s.seq_tempo);
    outputNrpn(102, s.seq_groove_template);
    outputNrpn(103, s.seq_groove_amount);
    outputNrpn(104, s.arp_direction);
    outputNrpn(105, s.arp_range);
    outputNrpn(106, s.arp_pattern);
    outputNrpn(107, s.arp_warp);
    // pattern size is not global but extracted from steps
    outputNrpn(109, s.pattern_rotation);
    
}

void VxShruthi::outputSequence(){
    
    SequencerSettings &s = workingSequencer_[slotIndex_];
    atom_setsym(atoms_, ps_sequence);
    t_atom *data = atoms_+2;
    
    // note
    atom_setsym(atoms_+1, ps_note);
    for(int i=0; i<kNumSteps; ++i)
        atom_setlong(data+i, s.steps[i].getNoteValue()); // only first 7 bits
    outlet_list(m_outlets[1], ps_empty, kNumSteps+2, atoms_);
    
    // velocity
    atom_setsym(atoms_+1, ps_velocity);
    for(int i=0; i<kNumSteps; ++i)
        atom_setlong(data+i, s.steps[i].getVelocityValue() * VELOCITY_SCALE_UP);
    outlet_list(m_outlets[1], ps_empty, kNumSteps+2, atoms_);

    // ctrl
    atom_setsym(atoms_+1, ps_ctrl);
    for(int i=0; i<kNumSteps; ++i)
        atom_setlong(data+i, s.steps[i].getControllerValue());
    outlet_list(m_outlets[1], ps_empty, kNumSteps+2, atoms_);
    
    // gate
    atom_setsym(atoms_+1, ps_gate);
    for(int i=0; i<kNumSteps; ++i)
        atom_setlong(data+i, s.steps[i].getGateValue());
    outlet_list(m_outlets[1], ps_empty, kNumSteps+2, atoms_);
    
    // legato / tie
    atom_setsym(atoms_+1, ps_legato);
    for(int i=0; i<kNumSteps; ++i)
        atom_setlong(data+i, s.steps[i].getLegatoValue());
    outlet_list(m_outlets[1], ps_empty, kNumSteps+2, atoms_);
    
    
    // gate legato matrix
    atom_setsym(atoms_, ps_liveGrid);

    for(int i=0; i<16; ++i){
        atom_setlong(atoms_+1, i+1);
        atom_setlong(atoms_+2, 1);
        atom_setlong(atoms_+3, s.steps[i].getLegatoValue());
        outlet_list(m_outlets[1], ps_empty, 4, atoms_);
    }
    
    for(int i=0; i<16; ++i){
        atom_setlong(atoms_+1, i+1);
        atom_setlong(atoms_+2, 2);
        atom_setlong(atoms_+3, s.steps[i].getGateValue());
        outlet_list(m_outlets[1], ps_empty, 4, atoms_);
    }
    
    // pattern size is not global but extracted from steps
    outputNrpn(108, s.pattern_size);
}


    
// transfers
void VxShruthi::transferPatch(long inlet){
    device_.sendSysex((uint8_t*) &workingPatch_[slotIndex_], 0x01, 0, PATCH_SIZE);
}

void VxShruthi::transferSequence(long inlet){
    device_.sendSysex((uint8_t*) workingSequencer_[slotIndex_].steps, 0x02, 0, sizeof(SequenceStep) * kNumSteps);
}

void VxShruthi::transferWavetable(long inlet){
    device_.sendSysex(wavetable_, 0x03, 0, kUserWavetableSize);
}

void VxShruthi::transferSystemSettings(long inlet){
    device_.sendSysex((uint8_t*) settings_, 0x04, 0, SYSTEM_SETTINGS_SIZE);
}

void VxShruthi::transferSequenceStep(long index){
    uint8_t stepIndex = index & 0x0f;
    device_.sendSysex( workingSequencer_[slotIndex_].steps[stepIndex].data_, 0x05, stepIndex, 2);
}

void VxShruthi::transferPatchName(long inlet){
    device_.sendSysex(workingPatch_[slotIndex_].name, 0x06, 0, kPatchNameSize);
}

void VxShruthi::transferSequencerSettings(long inlet){
    device_.sendSysex((uint8_t*) &workingSequencer_[slotIndex_], 0x07, 0, sizeof(SequencerSettings));
}

void VxShruthi::setPatternLength(long inlet, long length){
    uint8_t v = CLAMP(length, 1, 16);
    workingSequencer_[slotIndex_].pattern_size = v;
    device_.sendSysexCommand(0x08, v);
}

void VxShruthi::setPatternRotation(long inlet, long rotation){
    uint8_t v = rotation & 0x0f;
    workingSequencer_[slotIndex_].pattern_rotation = v;
    device_.sendSysexCommand(0x09, v);
}

void VxShruthi::requestRom(long inlet){
    progressCounter_ = 0;
    device_.sendSysexCommand(0x50);
//    useEepromCache_ = true;
    // Ga er maar vanuit dat dit goed gaat. We hebben geen aanduiding wanneer de transfer klaar is namelijk.
    hasEepromCache_ = true;
}
// send out complete eeprom to midi
void VxShruthi::transferRom(long inlet) {
    progressCounter_ = 0;
    transfer_.transferEeprom(eeprom_, addressable_space_size());
//    useEepromCache_ = true;
}

// requests
void VxShruthi::requestNumbers(long inlet){ device_.sendSysexCommand(0x1a); }
void VxShruthi::requestNumBanks(long inlet){ device_.sendSysexCommand(0x1b); }
void VxShruthi::requestPatch(long inlet){ device_.sendSysexCommand(0x11); }
void VxShruthi::requestSequence(long inlet){ device_.sendSysexCommand(0x12); }
void VxShruthi::requestWavetable(long inlet){ device_.sendSysexCommand(0x13); }
void VxShruthi::requestSystemSettings(long inlet){ device_.sendSysexCommand(0x14); }
void VxShruthi::requestSequenceStep(long inlet, long index){ device_.sendSysex(NULL, 0x15, index & 0x0f, 0); }
void VxShruthi::requestPatchName(long inlet){ device_.sendSysexCommand(0x16); }
void VxShruthi::requestSequencerSettings(long inlet){ device_.sendSysexCommand(0x17); }
void VxShruthi::requestRandomizePatch(long inlet){ device_.sendSysexCommand(0x31); }
void VxShruthi::requestRandomizeSequence(long inlet){ device_.sendSysexCommand(0x32); }

void VxShruthi::requestPatchWrite(long slot){
    long first14Bit = slot & 0x3fff;
    uint8_t payload[2];
    payload[0] = first14Bit >> 8; // msb
    payload[1] = first14Bit & 0xff; // lsb
    device_.sendSysex(payload, 0x21, 0, 2);
}

void VxShruthi::requestSequenceWrite(long slot){
    long first14Bit = slot & 0x3fff;
    uint8_t payload[2];
    payload[0] = first14Bit >> 8; // msb
    payload[1] = first14Bit & 0xff; // lsb
    device_.sendSysex(payload, 0x22, 0, 2);
}

void VxShruthi::setSequenceNote(long inlet, long step, long value){
    workingSequencer_[slotIndex_].steps[step & 0x0f].setNoteValue(value);
    transferSequenceStep(step);
}

void VxShruthi::setSequenceController(long inlet, long step, long value){
    workingSequencer_[slotIndex_].steps[step & 0x0f].setControllerValue(value);
    transferSequenceStep(step);
}

void VxShruthi::setSequenceGate(long inlet, long step, long value){
    workingSequencer_[slotIndex_].steps[step & 0x0f].setGateValue(value);
    transferSequenceStep(step);
}

void VxShruthi::setSequenceLegato(long inlet, long step, long value){
    workingSequencer_[slotIndex_].steps[step & 0x0f].setLegatoValue(value);
    transferSequenceStep(step);
}

void VxShruthi::setSequenceVelocity(long inlet, long step, long value){
    workingSequencer_[slotIndex_].steps[step & 0x0f].setVelocityValue(value);
    transferSequenceStep(step);
}

void VxShruthi::setPatchName(long inlet, t_symbol *name){
    int c = 0;
    const char* cname = name->s_name;
    for(c=0; c<kPatchNameSize; ++c){
        workingPatch_[slotIndex_].name[c] = cname[c];
        if(cname[c] == '\0'){
            break;
        }
    }
    
    while(c < kPatchNameSize){
        workingPatch_[slotIndex_].name[c] = ' ';
        ++c;
    }
    
    transferPatchName();
    
    atom_setsym(atoms_, psx_name);
    atom_setsym(atoms_+1, gensym((char*)workingPatch_[slotIndex_].name));
    outlet_list(m_outlets[1], ps_empty, 2, atoms_);
    
//    listPatchNames();
}

void VxShruthi::setSettingsFilter(long inlet, t_symbol *name){
    if(name == ps_lpf)
        settings_->expansion_filter_board = FILTER_BOARD_LPF;
    else if(name == ps_ssm)
        settings_->expansion_filter_board = FILTER_BOARD_SSM;
    else if(name == ps_svf)
        settings_->expansion_filter_board = FILTER_BOARD_SVF;
    else if(name == ps_dsp)
        settings_->expansion_filter_board = FILTER_BOARD_DSP;
    else if(name == ps_pvk)
        settings_->expansion_filter_board = FILTER_BOARD_PVK;
    else if(name == ps_4pm)
        settings_->expansion_filter_board = FILTER_BOARD_4PM;
    else if(name == ps_dly)
        settings_->expansion_filter_board = FILTER_BOARD_DLY;
    else{
        object_error((t_object*)this,"Unknown filter board %s", name->s_name);
        return;
    }
    
    // send changes
    transferSystemSettings();
//    outputSettingsData();
}

void VxShruthi::setSettingsOctave(long inlet, long v){    
    settings_->octave = CLAMP(v, -2, 2);
    transferSystemSettings();
//    outputSettingsData();
}

void VxShruthi::setSettingsRaga(long inlet, long v){
    settings_->raga = CLAMP(v, 0, 31);
    transferSystemSettings();
//    outputSettingsData();
}

void VxShruthi::setSettingsPortamento(long inlet, long v){
    settings_->portamento = CLAMP(v, 0, 63);
    transferSystemSettings();
//    outputSettingsData();
}

void VxShruthi::setSettingsLegato(long inlet, long v){
    settings_->legato = v > 0 ? 1 : 0;
    transferSystemSettings();
//    outputSettingsData();
}

void VxShruthi::setMidiIn(long inlet, t_symbol* portName, long channel){
    device_.setMidiIn(portName, channel);
}

void VxShruthi::setMidiAuxIn(long inlet, t_symbol* portName, long channel){
    device_.setMidiAuxIn(portName, channel);
}

void VxShruthi::setMidiOut(long inlet, t_symbol* portName, long channel){
    device_.setMidiOut(portName, channel);
}

void VxShruthi::enableFilterMsb(long inlet, long v){
    device_.setFilterMsb((v > 0) ? true : false);
}
void VxShruthi::enableEepromCache(long inlet, long v){
    useEepromCache_ = (v > 0) ? true : false;
}

void VxShruthi::liveStep(long inlet, t_symbol* s, long ac, t_atom *av){
    if(ac != 6){
        object_error((t_object*)this,"liveStep expects a list of 6 items");
        return;
    }
    
    uint8_t stepIndex = (atom_getlong(av) - 1) & 0x0f;
    workingSequencer_[slotIndex_].steps[stepIndex].setNoteValue(atom_getlong(av+1));
    // scale 0-127 to 0-7, round up is important here otherwise downspiral on iteration
    workingSequencer_[slotIndex_].steps[stepIndex].setVelocityValue(VELOCITY_SCALE_DOWN * atom_getlong(av+2) + 0.5f); 
    workingSequencer_[slotIndex_].steps[stepIndex].setControllerValue(atom_getlong(av+4));
    
    // schedule transfer to prevent sending lots of data
    sequence_dirty_ = true;
}

void VxShruthi::liveGrid(long inlet, t_symbol* s, long ac, t_atom *av){
    uint8_t listLegato[16] = {}; // init as zero
    uint8_t listGate[16] = {}; // init as zero
    uint8_t stepIndex, row;
    uint8_t nItems = ac / 2;

    for(size_t i=0; i<nItems; ++i){
        stepIndex = (atom_getlong(av + (i*2)) - 1) & 0x0f;
        row = atom_getlong(av + (i*2+1));
        switch(row){
            case 2:
                listGate[stepIndex] = 1;
                break;
            case 1:
                listLegato[stepIndex] = 1;
                break;
            default:
                object_error((t_object*)this,"Invalid row index for liveGrid: %i", row);
                break;
        }
    }
    
    for(size_t i=0; i<16; ++i){
        workingSequencer_[slotIndex_].steps[i].setGateValue(listGate[i]);
        workingSequencer_[slotIndex_].steps[i].setLegatoValue(listLegato[i]);
    }
    
    // schedule transfer to prevent sending lots of data
    sequence_dirty_ = true;
}

void VxShruthi::onTick(VxShruthi *x)
{
    if(x->sequence_dirty_){
        DPOST("updating sequence on device");
        x->transferSequence();
        x->outputSequence();
        x->sequence_dirty_ = false;
    }
    clock_fdelay(x->m_clock, SEQUENCE_UPDATE_INTERVAL_MS);
}

void VxShruthi::storePatch(long inlet, long slot){
    requestPatchWrite(slot);
    storePatchToEeprom(slot);
}

void VxShruthi::storeSequence(long inlet, long slot){
    
    // First we need to use global pattern_length to cut
    // the sequence and clear every step outside length.
    SequencerSettings &seq = workingSequencer_[slotIndex_];

    // Clear all the notes after the cycle mark.
    for (uint8_t i = seq.pattern_size; i < kNumSteps; ++i) {
        seq.steps[i].clear();
    }
    // Output the new pattern with cleared steps
    outputSequence();
    
    
    requestSequenceWrite(slot);
    storeSequenceToEeprom(slot);
}

void VxShruthi::storePatchToEeprom(long slot){
    DPOST("Store patch %i to eeprom cache", slot);
    
    uint8_t *address = getAddress<Patch>(slot);
    
    DPOST("cutoff src %i", workingPatch_[slotIndex_].filter_cutoff);
    DPOST("cutoff dst %i", ((Patch *)address)->filter_cutoff);
    
    DPOST("cpy size %i", StorageConfiguration<Patch>::size);
   
    std::memcpy(address,
                &workingPatch_[slotIndex_],
                StorageConfiguration<Patch>::size);
    
    DPOST("cutoff postdst %i", ((Patch *)address)->filter_cutoff);
}

void VxShruthi::loadPatchFromEeprom(long slot){
    DPOST("Fetch patch %i from eeprom cache", slot);
    uint8_t *address = getAddress<Patch>(slot);
    std::memcpy(&workingPatch_[slotIndex_],
                address,
                StorageConfiguration<Patch>::size);
}
void VxShruthi::storeSequenceToEeprom(long slot){
    DPOST("Store sequence %i to eeprom", slot);
    uint8_t *address = getAddress<SequencerSettings>(slot);
    std::memcpy(address,
                & workingSequencer_[slotIndex_].steps,
                StorageConfiguration<SequencerSettings>::size);
}

void VxShruthi::loadSequenceFromEeprom(long slot){
    DPOST("Fetch sequence %i from eeprom", slot);
    uint8_t *address = getAddress<SequencerSettings>(slot);
    std::memcpy(& workingSequencer_[slotIndex_].steps,
                address,
                StorageConfiguration<SequencerSettings>::size);
}

void VxShruthi::loadPatch(long inlet, long slot){
    
    if(workingPatchIndex_[slotIndex_] == slot){
        DPOST("Slot same as working, using exising data", slot);
        outputPatchData();
        return;
    }
    
    workingPatchIndex_[slotIndex_] = slot; // store current active slot
    
    sendPatchProgramChange(slot);
    
//    if(useEepromCache_ && hasEepromCache_){
        loadPatchFromEeprom(slot);
        outputPatchData();
    
    
    
//    }else{
//        DPOST("Transferring patch %i from device", slot);
//        // delay nodig misschien?
//        requestPatch();
//    }
}


void VxShruthi::calculatePatternSize(){
    // Extract pattern length
    
    SequencerSettings &seq = workingSequencer_[slotIndex_];
    
    seq.pattern_size = kNumSteps;
    for (uint8_t i = 0; i < kNumSteps; ++i) {
        if (seq.steps[i].blank()) {
            seq.pattern_size = i;
            break;
        }
    }
    

}

void VxShruthi::loadSequence(long inlet, long slot){
    
    if(workingSequencerIndex_[slotIndex_] == slot){
        DPOST("Slot same as working, using exising seq data", slot);
        outputSequence();
        return;
    }
    
    workingSequencerIndex_[slotIndex_] = slot; // store current active slot
    
    sendSequenceProgramChange(slot);
    
//    if(useEepromCache_ && hasEepromCache_){
        loadSequenceFromEeprom(slot);
    
    calculatePatternSize();
    outputSequence();
//    }else{
//        DPOST("Transferring sequence %i from device", slot);
//        // delay nodig misschien?
//        requestSequence();
//    }
}

void VxShruthi::sendPatchProgramChange(long slot){
    uint8_t bank = slot / 128;
    uint8_t patch = (slot - bank * 128) & 0x7f;
    if(bank > 8)
        return;
    
    std::vector<uint8_t> message;
    
    // Bank select CC
    message.push_back(0xb0 | device_.channelOut_);
    message.push_back(0); // bank MSB
    message.push_back(0);
    device_.sendMessage( &message );
    message.clear();
    
    message.push_back(0xb0 | device_.channelOut_);
    message.push_back(0x20); // bank LSB
    message.push_back(bank);
    device_.sendMessage( &message );
    message.clear();
    
    // Program Change
    message.push_back(0xc0 | device_.channelOut_);
    message.push_back(patch);
    device_.sendMessage( &message );
}




void VxShruthi::sendSequenceProgramChange(long slot){
    uint8_t bank = slot / 128;
    uint8_t patch = (slot - bank * 128) & 0x7f;
    if(bank > 8)
        return;
    
    std::vector<uint8_t> message;
    
    // Bank select CC
    message.push_back(0xb0 | device_.channelOut_);
    message.push_back(0); // bank MSB
    message.push_back(0);
    device_.sendMessage( &message );
    message.clear();
    
    message.push_back(0xb0 | device_.channelOut_);
    message.push_back(0x20); // bank LSB
    message.push_back(bank + 0x40); // offset for shruthi sequence banks
    device_.sendMessage( &message );
    message.clear();
    
    // Program Change
    message.push_back(0xc0 | device_.channelOut_);
    message.push_back(patch & 0x7f);
    device_.sendMessage( &message );
}


void VxShruthi::loadDeviceEeprom(){
    
    char filepath[PATH_MAX];  /* defined in sys/param.h */
    snprintf(
             filepath,
             PATH_MAX,
             "%s/DeviceSlot%i.bin",
             dataroot_.c_str(),
             slotIndex_+1);
    try{
        hasEepromCache_ = false;
        std::ifstream fs(filepath, std::ios::in | std::ios::binary);
        
        if(fs.fail()){
            object_error((t_object*)this, "Failed to open file %s", filepath);
            clearEepromCache();
        }else{
    
            fs.read((char*)eeprom_, kEepromSize);
            fs.close();
            hasEepromCache_ = true;
        }
    }catch(std::exception e){
        object_error((t_object*)this, "Failed to read eeprom from %s", filepath);
        object_error((t_object*)this, "Initializing to all zero");
        clearEepromCache();
    }
}

void VxShruthi::saveDeviceEeprom(){
    
    char filepath[PATH_MAX];  /* defined in sys/param.h */
    snprintf(
             filepath,
             PATH_MAX,
             "%s/DeviceSlot%i.bin",
             dataroot_.c_str(),
             slotIndex_+1);
    
    try{
        std::ofstream fs(filepath, std::ios::out | std::ios::binary);
        if(fs.fail()){
            object_error((t_object*)this, "Failed to open file %s", filepath);
            return;
        }
        fs.write((const char*)eeprom_, kEepromSize);
        fs.close();
    }catch(std::exception e){
        object_error((t_object*)this,"Failed to write eeprom file at %s", filepath);
    }
}

void VxShruthi::importEeprom(long inlet, t_symbol* filepath){
    try{
        hasEepromCache_ = false;
        std::ifstream fs(filepath->s_name, std::ios::in | std::ios::binary);
        
        fs.seekg(0, std::ios::end);
        std::ifstream::pos_type filesize = fs.tellg();
        fs.seekg(0, std::ios::beg);
        
        if(filesize > kEepromSize){
            object_error((t_object*)this, "Trying to import a file that's bigger than maximum eeprom size: %i", filesize);
            return;
        }
        
        if(fs.fail()){
            object_error((t_object*)this, "Failed to open file %s", filepath->s_name);
            return;
        }
        fs.read((char*)eeprom_, kEepromSize);
        fs.close();
        hasEepromCache_ = true;
 
        refreshGui();
        
        // clear nrpn cache todo clean way
        device_.lastNrpnIndex = -1;
        
    }catch(std::exception e){
        
        object_error((t_object*)this,"Failed to read file %s", filepath->s_name);
        object_error((t_object*)this,"Eeprom cache disabled.");
    }
}



void VxShruthi::exportEeprom(long inlet, t_symbol* filepath){
    if(! hasEepromCache_){
        DPOST("No eeprom cache available, no export");
    }
    try{
        std::ofstream fs(filepath->s_name, std::ios::out | std::ios::binary);
        if(fs.fail()){
            object_error((t_object*)this, "Failed to open file %s", filepath->s_name);
            return;
        }
        fs.write((const char*)eeprom_, kEepromSize);
        fs.close();
    }catch(std::exception e){
        object_error((t_object*)this,"Failed to write file %s", filepath->s_name);
    }
}



void VxShruthi::clearEepromCache(long inlet){
    // only clear the external part
//    memset(eeprom_+kExternalEepromOffset, 0, kExternalEepromSize*sizeof(uint8_t)); // init to zero
    
    memset(eeprom_, 0, kEepromSize*sizeof(uint8_t)); // init to zero
    hasEepromCache_ = false;
}

void VxShruthi::copyPatchToClipboard(long inlet){
    std::memcpy(&clipboardPatch_,
                &workingPatch_[slotIndex_],
                StorageConfiguration<Patch>::size);
}

void VxShruthi::pastePatchFromClipboard(long inlet){
    std::memcpy(&workingPatch_[slotIndex_],
                &clipboardPatch_,
                StorageConfiguration<Patch>::size);
    transferPatch();
    outputPatchData();
}

void VxShruthi::copySequenceToClipboard(long inlet){
    std::memcpy(&clipboardSequencer_.steps,
                &workingSequencer_[slotIndex_].steps,
                StorageConfiguration<SequencerSettings>::size);
}

void VxShruthi::pasteSequenceFromClipboard(long inlet){
    std::memcpy(&workingSequencer_[slotIndex_].steps,
                &clipboardSequencer_.steps,
                StorageConfiguration<SequencerSettings>::size);
    transferSequence();
    
    calculatePatternSize();
    outputSequence();
}

void VxShruthi::acceptSysexData(SysexCommand cmd, uint8_t arg, std::vector<uint8_t> &data) {
    post("acceptSysexData");
    uint8_t success = 0;
    uint8_t *sysex_rx_buffer_ = &data[0];
    switch (cmd) {
        case kNumbers:
            if(data.size() == 4){
                success = 1;
                uint16_t current_patch_number = (data[1] << 8) | data[0];
                uint16_t current_sequence_number = (data[3] << 8) | data[2];
                DPOST("Current patch and sequence: %i %i",current_patch_number, current_sequence_number );
                
                current_patch_number_ = current_patch_number;
                current_sequence_number_ = current_sequence_number;
                
                atom_setsym(atoms_, gensym("current"));
                atom_setlong(atoms_+1, current_patch_number_);
                atom_setlong(atoms_+2, current_sequence_number_);
                outlet_list(m_outlets[1], ps_empty, 3, atoms_);
            }
            break;
            
        case kNumBanks:
            if(data.size() == 0 && arg > 0){
                success = 1;
                num_accessible_banks_ = arg;
                
                DPOST("Device numbanks: %i", num_accessible_banks_ );
                
                if(num_accessible_banks_ > 7){
                    object_error((t_object *)this, "Invalid eeprom size numbanks: %i", num_accessible_banks_);
                    DPOST("Resetting storage to default 2 banks");
                    num_accessible_banks_ = 2;
                }
                
                listPatchNames();
                
//                
//                atom_setsym(atoms_, gensym("patchcount"));
//                atom_setlong(atoms_+1, getNumPatches());
//                outlet_list(m_outlets[1], ps_empty, 2, atoms_);
            }
            break;
            
        case kPatch:  // Patch transfer
            success = workingPatch_[slotIndex_].CheckBuffer(sysex_rx_buffer_);
            if(success){
                DPOST("Patch data received");
                std::memcpy(&workingPatch_[slotIndex_],
                            sysex_rx_buffer_,
                            StorageConfiguration<Patch>::size);
                outputPatchData();
            }
            break;
            
        case kSequence:  // Sequence transfer
            success = 1;
            DPOST("Sequence data received");
            std::memcpy(workingSequencer_[slotIndex_].saved_data(),
                        sysex_rx_buffer_,
                        StorageConfiguration<SequencerSettings>::size);
            outputSequence();
            break;
            
        case kWavetable: // wavetable transfer
            // streams directly to destination so no copying
            success = 1;
            DPOST("Wavetable data received");
            break;
            
        case kSystemSettings: // Settings transfer
            std::memcpy(settings_,
                        sysex_rx_buffer_,
                        SYSTEM_SETTINGS_SIZE);
            success = 1;
            DPOST("Settings data received");
            outputSettingsData();
            break;
            
        case kSequenceStep:
        {
            uint8_t stepIndex = arg & 0x0f;
            workingSequencer_[slotIndex_].steps[stepIndex].data_[0] = sysex_rx_buffer_[0];
            workingSequencer_[slotIndex_].steps[stepIndex].data_[1] = sysex_rx_buffer_[1];
            DPOST("Sequencer step data received, index: %i", stepIndex);
        }
            success = 1;
            outputSequence();
            break;
        case kPatchName:
            std::memcpy(workingPatch_[slotIndex_].name,
                        sysex_rx_buffer_,
                        kPatchNameSize);
            success = 1;
            DPOST("Patch name received");
            break;
        case kSequencerState: // full sequencer state transfer
            success = 1;
            DPOST("Full sequencer state received");
            std::memcpy(&workingSequencer_[slotIndex_],
                        sysex_rx_buffer_,
                        sizeof(SequencerSettings));

            outputSequence();
            outputSequencerSettings();
            break;
            
        case kRawDataDumpA:  // Raw data dump
        case kRawDataDumpB:
        case kRawDataDumpC:
        case kRawDataDumpD:
        {
            post("cmd %d arg %d", cmd, arg);
            outputProgress(arg);
            uint8_t command = cmd;
            uint16_t address = arg * kSysExBulkDumpBlockSize;
            while (command > kRawDataDumpA) {
                address += (kSysExBulkDumpBlockSize * 128);
                --command;
//                cmd = cmd-(SysexCommand)(1);
            }
            success = address < kEepromSize;
            if (!success) {
                break;
            }
            
            std::memcpy(eeprom_+address,
                        sysex_rx_buffer_,
                        kSysExBulkDumpBlockSize);

        }
            break;
            
            
        default:
            // do nothing
            DPOST("Ignored incoming sysex cmd %i", cmd);
            success = 1;
            break;
    }
  
    if(!success){
        object_error((t_object*)this,"Sysex transfer error cmd %x, arg %x, data length %i", cmd, arg, data.size());
    }
}

void VxShruthi::midiNrpnCallback(long nrpn_index, long v){
    
    // update internal eeprom
//    mapSequencerNrpnToEeprom(nrpn_index, v);
    mapNrpnToEeprom(nrpn_index, v);
    
    // send out to patch
    outputNrpn(nrpn_index, v);
}



void VxShruthi::nrpn(long inlet, long nrpn_index, long v){
    // update internal eeprom
//    mapSequencerNrpnToEeprom(nrpn_index, v);
    mapNrpnToEeprom(nrpn_index, v);
    
    // send to device
    device_.sendNrpn(nrpn_index, v);
    
}

void VxShruthi::mapNrpnToEeprom(long nrpn_index, long v){
    Patch &p = workingPatch_[slotIndex_];
    
    switch(nrpn_index){
        case 0: p.osc[0].shape = v; break;
        case 1: p.osc[0].parameter = v; break;
        case 2: p.osc[0].range = v; break;
        case 3: p.osc[0].option = v; break;
            
        case 4: p.osc[1].shape = v; break;
        case 5: p.osc[1].parameter = v; break;
        case 6: p.osc[1].range = v; break;
        case 7: p.osc[1].option = v; break;
            
        case 8: p.mix_balance = v; break;
        case 9: p.mix_sub_osc = v; break;
        case 10: p.mix_noise = v; break;
        case 11: p.mix_sub_osc_shape = v; break;
            
        case 12: p.filter_cutoff = v; break;
        case 13: p.filter_resonance = v; break;
        case 14: p.filter_env = v; break;
        case 15: p.filter_lfo = v; break;
            
        case 16: p.env[0].attack = v; break;
        case 17: p.env[0].decay = v; break;
        case 18: p.env[0].sustain = v; break;
        case 19: p.env[0].release = v; break;
            
        case 20: p.env[1].attack = v; break;
        case 21: p.env[1].decay = v; break;
        case 22: p.env[1].sustain = v; break;
        case 23: p.env[1].release = v; break;
            
        case 24: p.lfo[0].waveform = v; break;
        case 25: p.lfo[0].rate = v; break;
        case 26: p.lfo[0].attack = v; break;
        case 27: p.lfo[0].retrigger_mode = v; break;
            
        case 28: p.lfo[1].waveform = v; break;
        case 29: p.lfo[1].rate = v; break;
        case 30: p.lfo[1].attack = v; break;
        case 31: p.lfo[1].retrigger_mode = v; break;
            
        case 32: p.modulation_matrix.modulation[0].source = v; break;
        case 33: p.modulation_matrix.modulation[0].destination = v; break;
        case 34: p.modulation_matrix.modulation[0].amount = v; break;
        case 35: p.modulation_matrix.modulation[1].source = v; break;
        case 36: p.modulation_matrix.modulation[1].destination = v; break;
        case 37: p.modulation_matrix.modulation[1].amount = v; break;
        case 38: p.modulation_matrix.modulation[2].source = v; break;
        case 39: p.modulation_matrix.modulation[2].destination = v; break;
        case 40: p.modulation_matrix.modulation[2].amount = v; break;
        case 41: p.modulation_matrix.modulation[3].source = v; break;
        case 42: p.modulation_matrix.modulation[3].destination = v; break;
        case 43: p.modulation_matrix.modulation[3].amount = v; break;
        case 44: p.modulation_matrix.modulation[4].source = v; break;
        case 45: p.modulation_matrix.modulation[4].destination = v; break;
        case 46: p.modulation_matrix.modulation[4].amount = v; break;
        case 47: p.modulation_matrix.modulation[5].source = v; break;
        case 48: p.modulation_matrix.modulation[5].destination = v; break;
        case 49: p.modulation_matrix.modulation[5].amount = v; break;
        case 50: p.modulation_matrix.modulation[6].source = v; break;
        case 51: p.modulation_matrix.modulation[6].destination = v; break;
        case 52: p.modulation_matrix.modulation[6].amount = v; break;
        case 53: p.modulation_matrix.modulation[7].source = v; break;
        case 54: p.modulation_matrix.modulation[7].destination = v; break;
        case 55: p.modulation_matrix.modulation[7].amount = v; break;
        case 56: p.modulation_matrix.modulation[8].source = v; break;
        case 57: p.modulation_matrix.modulation[8].destination = v; break;
        case 58: p.modulation_matrix.modulation[8].amount = v; break;
        case 59: p.modulation_matrix.modulation[9].source = v; break;
        case 60: p.modulation_matrix.modulation[9].destination = v; break;
        case 61: p.modulation_matrix.modulation[9].amount = v; break;
        case 62: p.modulation_matrix.modulation[10].source = v; break;
        case 63: p.modulation_matrix.modulation[10].destination = v; break;
        case 64: p.modulation_matrix.modulation[10].amount = v; break;
        case 65: p.modulation_matrix.modulation[11].source = v; break;
        case 66: p.modulation_matrix.modulation[11].destination = v; break;
        case 67: p.modulation_matrix.modulation[11].amount = v; break;
            
        case 84: p.filter_cutoff_2 = v; break;
        case 85: p.filter_resonance_2 = v; break;
        case 92: p.filter_1_mode_ = v; break;
        case 93: p.filter_2_mode_ = v; break;
            
        case 94: p.ops_[0].operands[0] = v; break;
        case 95: p.ops_[0].operands[1] = v; break;
        case 96: p.ops_[0].op = v; break;
        case 97: p.ops_[1].operands[0] = v; break;
        case 98: p.ops_[1].operands[1] = v; break;
        case 99: p.ops_[1].op = v; break;
            
        case 100: workingSequencer_[slotIndex_].seq_mode = v; break;
        case 101: workingSequencer_[slotIndex_].seq_tempo = v; break;
        case 102: workingSequencer_[slotIndex_].seq_groove_template = v; break;
        case 103: workingSequencer_[slotIndex_].seq_groove_amount = v; break;
        case 104: workingSequencer_[slotIndex_].arp_direction = v; break;
        case 105: workingSequencer_[slotIndex_].arp_range = v; break;
        case 106: workingSequencer_[slotIndex_].arp_pattern = v; break;
        case 107: workingSequencer_[slotIndex_].arp_warp = v; break;
        case 108: workingSequencer_[slotIndex_].pattern_size = v; break;
        case 109: workingSequencer_[slotIndex_].pattern_rotation = v; break;
            
        default:
            object_error((t_object*)this, "Nrpn index %i is not valid", nrpn_index);
    }

}


// voor als er iets hangt
void VxShruthi::stopTransfer(long inlet){
    transfer_.stop();
    device_.unlock();
    
    // misschien nog een all notes off?
    
    // misschien nog een resetDevice functie met default system settings etc?
}

void VxShruthi::transferProgressReporter(bool isBusy, uint8_t progress){
    outputProgress(progress);
}


// triggered by kNumBanks return, because first we want to know the
// total number of slots to init the list
void VxShruthi::listPatchNames(long inlet){
    
    Patch *p;
//    size_t numPatches;
    uint8_t *pmem;
    int patchNumber = 1; // starting at 1max
    
    
    // first output how many patches there will be
    atom_setsym(atoms_, gensym("patchcount"));
    atom_setlong(atoms_+1, getNumPatches());
    outlet_list(m_outlets[1], ps_empty, 2, atoms_);
    
    
    // then build the list
    atom_setsym(atoms_, gensym("patchlist"));
    
    // 16 internal patches
    pmem = eeprom_ + 0x0010;
        
    for(size_t i=0; i<16; ++i ){
        p = reinterpret_cast<Patch *>(pmem + i*PATCH_SIZE); 
        atom_setlong(atoms_+1, patchNumber++);
        
        if(p->exclamation_mark_ != '!'){
//            break; // not valid patch data
            atom_setsym(atoms_+2, gensym("_"));
        } else {
            atom_setsym(atoms_+2, gensym((char*)p->name));
        }
        outlet_list(m_outlets[1], ps_empty, 3, atoms_);
        ++p;
    }
    
    
    // for each bank 64 patches
    for(int k=0; k<num_accessible_banks_; ++k){
    
        pmem = eeprom_ + kInternalEepromSize + (k * kBankSize);
        
        for(size_t i=0; i<64; ++i ){
            p = reinterpret_cast<Patch *>(pmem + i*PATCH_SIZE);
            atom_setlong(atoms_+1, patchNumber++);
            
            if(p->exclamation_mark_ != '!'){
                //            break; // not valid patch data
                atom_setsym(atoms_+2, gensym("_"));
            } else {
                atom_setsym(atoms_+2, gensym((char*)p->name));
            }
            outlet_list(m_outlets[1], ps_empty, 3, atoms_);
            ++p;
        }
    }

}

// a macro to mark exported symbols in the code without requiring an external file to define them
#ifdef WIN_VERSION
// note that this is the required syntax on windows regardless of whether the compiler is msvc or gcc
#define T_EXPORT __declspec(dllexport)
#else // MAC_VERSION
// the mac uses the standard gcc syntax, you should also set the -fvisibility=hidden flag to hide the non-marked symbols
#define T_EXPORT __attribute__((visibility("default")))
#endif



int T_EXPORT main(void) {
	// create a class with the given name:
	VxShruthi::makeMaxClass("vx.shruthi");
    
    REGISTER_METHOD_LONG2(VxShruthi, setSequenceNote);
    REGISTER_METHOD_LONG2(VxShruthi, setSequenceGate);
    REGISTER_METHOD_LONG2(VxShruthi, setSequenceVelocity);
    REGISTER_METHOD_LONG2(VxShruthi, setSequenceController);
    REGISTER_METHOD_LONG2(VxShruthi, setSequenceLegato);
    
    REGISTER_METHOD_SYMBOL(VxShruthi, setPatchName);
    
    REGISTER_METHOD(VxShruthi, requestNumbers);
    REGISTER_METHOD(VxShruthi, requestNumBanks);
    REGISTER_METHOD(VxShruthi, requestPatch);
    REGISTER_METHOD(VxShruthi, requestSequence);
    REGISTER_METHOD(VxShruthi, requestWavetable);
    REGISTER_METHOD(VxShruthi, requestSystemSettings);
    REGISTER_METHOD_LONG(VxShruthi, requestSequenceStep);
    REGISTER_METHOD(VxShruthi, requestPatchName);
    REGISTER_METHOD(VxShruthi, requestSequencerSettings);
    REGISTER_METHOD(VxShruthi, requestRandomizePatch);
    REGISTER_METHOD(VxShruthi, requestRandomizeSequence);
    REGISTER_METHOD_LONG(VxShruthi, storePatch);
    REGISTER_METHOD_LONG(VxShruthi, storeSequence);
    
    REGISTER_METHOD(VxShruthi, requestRom);
    
    REGISTER_METHOD(VxShruthi, transferPatch);
    REGISTER_METHOD(VxShruthi, transferSequence);
    REGISTER_METHOD(VxShruthi, transferWavetable);
    REGISTER_METHOD(VxShruthi, transferSystemSettings);
    REGISTER_METHOD(VxShruthi, transferSequencerSettings);
    REGISTER_METHOD(VxShruthi, transferPatchName);
    REGISTER_METHOD(VxShruthi, transferRom);

    // system settings
    REGISTER_METHOD_SYMBOL(VxShruthi, setSettingsFilter);
    REGISTER_METHOD_LONG(VxShruthi, setSettingsOctave);
    REGISTER_METHOD_LONG(VxShruthi, setSettingsRaga);
    REGISTER_METHOD_LONG(VxShruthi, setSettingsPortamento);
    REGISTER_METHOD_LONG(VxShruthi, setSettingsLegato);
    

    REGISTER_METHOD_SYMBOL_LONG(VxShruthi, setMidiIn);
    REGISTER_METHOD_SYMBOL_LONG(VxShruthi, setMidiAuxIn);
    REGISTER_METHOD_SYMBOL_LONG(VxShruthi, setMidiOut);
    
    REGISTER_METHOD_LONG2(VxShruthi, nrpn);
    
    REGISTER_METHOD_LONG(VxShruthi, enableFilterMsb);
    REGISTER_METHOD_LONG(VxShruthi, enableEepromCache);
    
    REGISTER_METHOD_GIMME(VxShruthi, liveStep);
    REGISTER_METHOD_GIMME(VxShruthi, liveGrid);
    REGISTER_METHOD_GIMME(VxShruthi, setSystemSettings);
    
    REGISTER_METHOD_LONG(VxShruthi, setPatternLength);
    REGISTER_METHOD_LONG(VxShruthi, setPatternRotation);
    
    REGISTER_METHOD_LONG(VxShruthi, loadPatch);
    REGISTER_METHOD_LONG(VxShruthi, loadSequence);
    
    REGISTER_METHOD_SYMBOL(VxShruthi, importEeprom);
    REGISTER_METHOD_SYMBOL(VxShruthi, exportEeprom);

    REGISTER_METHOD(VxShruthi, clearEepromCache);
    
    REGISTER_METHOD(VxShruthi, stopTransfer);
    
    REGISTER_METHOD_LONG(VxShruthi, enableEepromCache);
    
    REGISTER_METHOD(VxShruthi, listPatchNames);
    REGISTER_METHOD(VxShruthi, testMidi);
    
    REGISTER_METHOD(VxShruthi, copyPatchToClipboard);
    REGISTER_METHOD(VxShruthi, pastePatchFromClipboard);
    REGISTER_METHOD(VxShruthi, copySequenceToClipboard);
    REGISTER_METHOD(VxShruthi, pasteSequenceFromClipboard);
    
    REGISTER_METHOD_LONG(VxShruthi, switchToDevice);

    
    
//    #ifdef WIN_VERSION
//        char user_name[UNLEN+1];
//        DWORD user_name_size = sizeof(user_name);
//        if (GetUserName(user_name, &user_name_size)){
//            DPOST("Your user name is: %s", user_name);
//        }else{
//            object_error((t_object*)this,"Failed to lookup user name");
//        }
//        /* Handle error */
//    #else // MAC_VERSION
//                // the mac uses the standard gcc syntax, you should also set the -fvisibility=hidden flag to hide the non-marked symbols
//        char* szUserName;
//        szUserName = getenv("USER");
//        DPOST("Your user name is: %s", szUserName);  
//    #endif
}

