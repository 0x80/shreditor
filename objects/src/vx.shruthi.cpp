//#include "maxcpp6.h"

#include "vx.shruthi.h"

#include <cstring>
#include <ctime>
#include <iostream>
#include <cstdlib>
#include <map>
#include <fstream>

#ifdef WIN_VERSION

#include <Windows.h>
//#include <Shlwapi.h>
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

#define SHREDITOR_VERSION "beta 8"

// for using _1 _2 
//using namespace std::placeholders;


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
//static t_symbol *ps_xtmode = gensym("xtmode");
static t_symbol *ps_noinput = gensym("--- none ---");
static t_symbol *ps_nooutput = gensym("--- none ---");


//uint8_t Patch::CheckBuffer(uint8_t* buffer) {
//    for (uint8_t i = 8; i < 24; ++i) {
//        if (buffer[i] >= 128) {
//            memset(name, '-', 8);
//            return 0;
//        }
//    }
//    if (buffer[91] != '!') {
//        memset(name, '-', 8);
//        return 0;
//    }
//    return 1;
//}


VxShruthi::VxShruthi(t_symbol * sym, long ac, t_atom * av)
:
    midi_(*this),
    numAccessibleBanks_(2),
    useEepromCache_(true),
    hasEepromCache_(false),
    progressCounter_(0),
    slotIndex_(-1)
{
    setupIO(1, 3); // inlets / outlets
    
    // point outlets to right place
    nrpnOut_ = m_outlets[0];
    midiOut_ = m_outlets[2];
    msgOut_ = m_outlets[1];
    
    midi_.setOutlets(midiOut_, msgOut_);
    
//    if(isExpired()){
//        
//        // Need defer low to output some data from the constructor,
//        // otherwise outputs are not initialized at time of call.
//        defer_low(this, (method)VxShruthi::onExpired, NULL, 0, NULL);
//        return;
//    }
    
    eeprom_ = new uint8_t[kEepromSize];
    settings_ = (SystemSettings *)eeprom_; // settings are stored in first part of eeprom
    
    memset(eeprom_, 0, kEepromSize*sizeof(uint8_t)); // init to zero
    
    // init active indexs to -1
    memset(workingPatchIndex_, -1, NUM_DEVICE_SLOTS*sizeof(int));
    memset(workingSequencerIndex_, -1, NUM_DEVICE_SLOTS*sizeof(int));
    
    clock_ = clock_new((t_object *)this, (method)onTick);
    clock_fdelay(clock_, SEQUENCE_UPDATE_INTERVAL_MS);
    
    // after io is setup
    initializeSystemStoragePath();

}

VxShruthi::~VxShruthi() {
     
    // is dit handig?
    if(hasEepromCache_) saveDeviceEeprom();
    
    delete[] eeprom_;
    object_free(clock_);
}

int VxShruthi::makePaths(const char* rootname){

    short rootpath;
    char filename[PATH_MAX];
    if(path_frompathname(rootname, &rootpath, filename)){
		object_post((t_object*)this, "path_frompathname failed");
		return 1;
    }

	DPOST("rootname %s", rootname);
	DPOST("rootpath %i", rootpath);
    
	short newpath;
	int err = path_createfolder(rootpath, "Vauxlab", &newpath);
    if(err){
        object_post((t_object*)this, "create folder Vauxlab failed: %i", err);
        return 2;
    }

	if(path_createfolder(newpath, "Shreditor", &newpath)){
		object_post((t_object*)this, "createfolder Shreditor failed");
        return 3;
    }

	if(path_createfolder(newpath, "Eeprom", &newpath)){
		object_post((t_object*)this, "createfolder Eeprom failed");
        return 4;
    }

	return 0;
}

void VxShruthi::initializeSystemStoragePath(){

    #ifdef WIN_VERSION
    //CSIDL_APPDATA
	std::string root;
    TCHAR path[MAX_PATH];
	TCHAR conformpath[MAX_PATH];
	if(SUCCEEDED(SHGetFolderPath(NULL, 
		CSIDL_APPDATA | CSIDL_FLAG_CREATE,
								 NULL, 
								 0, 
								 path))) 
	{
		if(path_nameconform(path, conformpath, PATH_STYLE_MAX_PLAT, PATH_TYPE_ABSOLUTE)){
			object_error((t_object*)this, "Failed to conform path");
		}
		root = std::string(conformpath, strlen(path)) + std::string("/Vauxlab/Shreditor");
		//root = std::string(path, strlen(path)) + std::string("\\Vauxlab\\Shreditor");
		dataroot_ = root + std::string("/Eeprom");
		presetfile_ = root + std::string("/DevicePresets.json");

	}else{
		DWORD errcode = GetLastError();
		object_error((t_object*)this, "Failed to look up appdata path: %s", path);
		return;
	}

	if(makePaths(path)){
		// error try different location for windows

		if(SUCCEEDED(SHGetFolderPath(NULL, 
			CSIDL_PROGRAM_FILES_COMMONX86 | CSIDL_FLAG_CREATE,
								 NULL, 
								 0, 
								 path))) 
		{
			if(path_nameconform(path, conformpath, PATH_STYLE_MAX_PLAT, PATH_TYPE_ABSOLUTE)){
				object_error((t_object*)this, "Failed to conform path");
			}
			root = std::string(conformpath, strlen(path)) + std::string("/Vauxlab/Shreditor");
			//root = std::string(path, strlen(path)) + std::string("\\Vauxlab\\Shreditor");
			dataroot_ = root + std::string("/Eeprom");
			presetfile_ = root + std::string("/DevicePresets.json");

		}else{
			DWORD errcode = GetLastError();
			object_error((t_object*)this, "Failed to look up appdata path: %s", path);
			return;
		}


		if(makePaths(path)){
			defer_low(this, (method)VxShruthi::onFail, NULL, 0, NULL);
			object_error((t_object*)this, "Initialization failed");
			return;
		}
		// send out error from outlet
	}else{
		// Need defer low to output some data from the constructor,
		// otherwise outputs are not initialized at time of call.
		defer_low(this, (method)VxShruthi::onReady, NULL, 0, NULL);
		object_post((t_object *)this, "Shreditor userdata location: %s", root.c_str());
	 };
    
    #else // MAC_VERSION
    

    FSRef ref;
    OSType folderType = kApplicationSupportFolderType;
    char path[PATH_MAX];
    
    FSFindFolder( kUserDomain, folderType, kCreateFolder, &ref );
    FSRefMakePath( &ref, (UInt8*)&path, PATH_MAX );
	std::string root = std::string(path, strlen(path)) + std::string("/Vauxlab/Shreditor");
    dataroot_ = root + std::string("/Eeprom");
    presetfile_ = root + std::string("/DevicePresets.json");

	 if(makePaths(path)){
		// error try different location for windows
		defer_low(this, (method)VxShruthi::onFail, NULL, 0, NULL);
		object_error((t_object*)this, "Initialization failed");
		return;
		// send out error from outlet
	}else{
		 // Need defer low to output some data from the constructor,
    // otherwise outputs are not initialized at time of call.
		defer_low(this, (method)VxShruthi::onReady, NULL, 0, NULL);
		DPOST("Shreditor userdata location: %s", dataroot_.c_str());
	
	 };
	#endif

   
   
   
    
}
void VxShruthi::outputDataroot(){
    atom_setsym(atoms_, gensym("dataroot"));
    atom_setsym(atoms_+1, gensym(dataroot_.c_str()));
    outlet_list(m_outlets[1], ps_empty, 2, atoms_);
    
    atom_setsym(atoms_, gensym("presetfile"));
    atom_setsym(atoms_+1, gensym(presetfile_.c_str()));
    outlet_list(m_outlets[1], ps_empty, 2, atoms_);
    
}

//void VxShruthi::onExpired(VxShruthi *x, t_symbol* s, short ac, t_atom *av){
//    
//    t_atom a[2];
//    atom_setsym(a, gensym("version"));
//    atom_setsym(a+1, gensym(SHREDITOR_VERSION));
//    outlet_list(x->m_outlets[1], ps_empty, 2, a);
//    
////    atom_setsym(a, gensym("expires"));
////    atom_setsym(a+1, gensym(asctime(&x->expire_)));
////    outlet_list(x->m_outlets[1], ps_empty, 2, a);
//    
//    object_error((t_object *)x, "This beta version of Shreditor has expired.");
//    
//    atom_setsym(a, gensym("alert"));
//    atom_setsym(a+1, gensym("expired"));
//    outlet_list(x->m_outlets[1], ps_empty, 2, a);
//    return;
//    
//}

void VxShruthi::onReady(VxShruthi *x, t_symbol* s, short ac, t_atom *av){
    DPOST("onReady...");
    
    t_atom a[2];
    atom_setsym(a, gensym("version"));
    atom_setsym(a+1, gensym(SHREDITOR_VERSION));
    outlet_list(x->m_outlets[1], ps_empty, 2, a);
    
// no more expire
//    atom_setsym(a, gensym("expires"));
//    atom_setsym(a+1, gensym(asctime(&x->expire_)));
//    outlet_list(x->m_outlets[1], ps_empty, 2, a);
    
    x->outputDataroot();
//	x->populateMidiPortMenus();
}

void VxShruthi::onFail(VxShruthi *x, t_symbol* s, short ac, t_atom *av){
    DPOST("onFail...");
    
    t_atom a[2];
    atom_setsym(a, gensym("error"));
    atom_setsym(a+1, gensym("init"));
    outlet_list(x->m_outlets[1], ps_empty, 2, a);
}

//bool VxShruthi::isExpired(){
//    
//   
//
//    time_t now = time(0);
//    struct tm local;
//    struct tm release;
////    struct tm expire;
//    double secondsSinceRelease;
//    double secondsToExpire;
//    local = *localtime(&now);
//    
//    // year is since 1900
//    // mon range 0-11
//    // mday range 0-30
//    release = local;
//    release.tm_hour = 0;   release.tm_min = 0; release.tm_sec = 0;
//    release.tm_year = 114; release.tm_mon = 11; release.tm_mday = 0;
//    
//    expire_ = local;
//    expire_.tm_hour = 24;  expire_.tm_min = 0; expire_.tm_sec = 0;
//    expire_.tm_year = 115; expire_.tm_mon = 3; expire_.tm_mday = 0;
//    
//    secondsSinceRelease = difftime(now, mktime(&release));
//    secondsToExpire = difftime(mktime(&expire_), now);
//    
//    object_post((t_object *)this, "Version %s", SHREDITOR_VERSION);
////    object_post((t_object *)this, "Developed by Thijs Koerselman");
//    object_post((t_object *)this, "This beta expires %s", asctime(&expire_));
//
////	return false; // don't expire ever
//    
//    DPOST("%.f seconds since release", secondsSinceRelease);
//    DPOST("%.f seconds to expire", secondsToExpire);
//    
//    if(secondsSinceRelease <= 0)
//        return true; // time is reset by user before release time
//    
//    if(secondsToExpire <= 0)
//        return true;
//    
//    return false;
//}


uint16_t VxShruthi::addressable_space_size() {
    return kInternalEepromSize + numAccessibleBanks_ * kBankSize;
}

//void VxShruthi::outputProgress(long busy, long progress){
void VxShruthi::outputProgress(long progress){
    DPOST("progress %i", progress);
    
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
        //switchToDevice(0, slotIndex_+1); // +1 since v start at 1
		saveDeviceEeprom(); // save current
		refreshGui(); // list patch names, selection etc.
    }
    
}

void VxShruthi::outputPatchData(){
    if(slotIndex_ < 0) return;
    // Convert name directly to symbol. Both should be char
    
    Patch &p = workingPatch_[slotIndex_];
    
    // PATCH NAME WETEN WE AL ALS EEN PATCH GELADEN WORDT
//    // convert name into 0 terminated string
//	char str[kPatchNameSize+1];
//	memcpy(str, p.name, kPatchNameSize);
//	str[kPatchNameSize] = 0;
//    atom_setsym(atoms_, psx_name);
//    atom_setsym(atoms_+1, gensym(str));
//    outlet_list(m_outlets[1], ps_empty, 2, atoms_);
    
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
//    object_post((t_object *)this, "outputNrpn %i, %i", index, value);
    atom_setlong(atoms_, index);
    atom_setlong(atoms_+1, value);
    outlet_list(m_outlets[0],  ps_nrpn, 2, atoms_);
}

void VxShruthi::outputSequencerSettings(){
    if(slotIndex_ < 0) return;
    
    SequencerSettings &s = workingSequencer_[slotIndex_];
    
    outputNrpn(100, s.seq_mode);
    outputNrpn(101, s.seq_tempo);
    outputNrpn(102, s.seq_groove_template);
    outputNrpn(103, s.seq_groove_amount);
    outputNrpn(104, s.arp_direction);
    outputNrpn(105, s.arp_range);
    outputNrpn(106, s.arp_pattern);
    outputNrpn(107, s.arp_clock_division); // warp in pre xt
    // pattern size is not global but extracted from steps
    outputNrpn(109, s.pattern_rotation);
    
}

void VxShruthi::outputSequence(){
    if(slotIndex_ < 0) return;
    
    SequencerSettings &s = workingSequencer_[slotIndex_];
    atom_setsym(atoms_, ps_sequence);
    t_atom *data = atoms_+2;
    
    // note
    atom_setsym(atoms_+1, ps_note);
    for(int i=0; i<kNumSteps; ++i)
        atom_setlong(data+i, s.steps[i].note()); // only first 7 bits
    outlet_list(m_outlets[1], ps_empty, kNumSteps+2, atoms_);
    
    
    // velocity
    atom_setsym(atoms_+1, ps_velocity);
    for(int i=0; i<kNumSteps; ++i){
//        DPOST("velocity %d , scale %f", s.steps[i].velocity(), VELOCITY_SCALE_UP);
        atom_setlong(data+i, s.steps[i].velocity());
//        atom_setlong(data+i, s.steps[i].velocity() * VELOCITY_SCALE_UP);
    }
    outlet_list(m_outlets[1], ps_empty, kNumSteps+2, atoms_);
    
    // ctrl
    atom_setsym(atoms_+1, ps_ctrl);
    for(int i=0; i<kNumSteps; ++i)
        atom_setlong(data+i, s.steps[i].controller());
    outlet_list(m_outlets[1], ps_empty, kNumSteps+2, atoms_);
    
    // gate
    atom_setsym(atoms_+1, ps_gate);
    for(int i=0; i<kNumSteps; ++i)
        atom_setlong(data+i, s.steps[i].gate());
    outlet_list(m_outlets[1], ps_empty, kNumSteps+2, atoms_);
    
    // legato / tie
    atom_setsym(atoms_+1, ps_legato);
    for(int i=0; i<kNumSteps; ++i)
        atom_setlong(data+i, s.steps[i].legato());
    outlet_list(m_outlets[1], ps_empty, kNumSteps+2, atoms_);
    
    
    // gate legato matrix
    atom_setsym(atoms_, ps_liveGrid);

    for(int i=0; i<16; ++i){
        atom_setlong(atoms_+1, i+1);
        atom_setlong(atoms_+2, 1);
        atom_setlong(atoms_+3, s.steps[i].legato());
        outlet_list(m_outlets[1], ps_empty, 4, atoms_);
    }
    
    for(int i=0; i<16; ++i){
        atom_setlong(atoms_+1, i+1);
        atom_setlong(atoms_+2, 2);
        atom_setlong(atoms_+3, s.steps[i].gate());
        outlet_list(m_outlets[1], ps_empty, 4, atoms_);
    }
    
    // pattern size is not global but extracted from steps
    outputNrpn(108, s.pattern_size);
}


    
// transfers
void VxShruthi::transferPatch(long inlet){
    if(slotIndex_ < 0) return;
    midi_.sendSysex((uint8_t*) &workingPatch_[slotIndex_], 0x01, 0, PATCH_SIZE);
}

void VxShruthi::transferSequence(long inlet){
    if(slotIndex_ < 0) return;
    midi_.sendSysex((uint8_t*) workingSequencer_[slotIndex_].steps, 0x02, 0, sizeof(SequenceStep) * kNumSteps);
}

void VxShruthi::transferWavetable(long inlet){
    midi_.sendSysex(wavetable_, 0x03, 0, kUserWavetableSize);
}

void VxShruthi::transferSystemSettings(long inlet){
//    DPOST("setOutputChannel() %d",settings_->midi_channel);
    midi_.setOutputChannel(settings_->midi_channel);
    midi_.sendSysex((uint8_t*) settings_, 0x04, 0, SYSTEM_SETTINGS_SIZE);
}

void VxShruthi::transferSequenceStep(long index){
    if(slotIndex_ < 0) return;
    uint8_t stepIndex = index & 0x0f;
    midi_.sendSysex( workingSequencer_[slotIndex_].steps[stepIndex].data_, 0x05, stepIndex, 2);
}

void VxShruthi::transferPatchName(long inlet){
    if(slotIndex_ < 0) return;
    midi_.sendSysex(workingPatch_[slotIndex_].name, 0x06, 0, kPatchNameSize);
}

void VxShruthi::transferSequencerSettings(long inlet){
    if(slotIndex_ < 0) return;
    midi_.sendSysex((uint8_t*) &workingSequencer_[slotIndex_], 0x07, 0, sizeof(SequencerSettings));
}

void VxShruthi::setPatternLength(long inlet, long length){
    if(slotIndex_ < 0) return;
    uint8_t v = CLAMP(length, 1, 16);
    workingSequencer_[slotIndex_].pattern_size = v;
    midi_.sendSysexCommand(0x08, v);
}

void VxShruthi::setPatternRotation(long inlet, long rotation){
    if(slotIndex_ < 0) return;
    uint8_t v = rotation & 0x0f;
    workingSequencer_[slotIndex_].pattern_rotation = v;
    midi_.sendSysexCommand(0x09, v);
}

void VxShruthi::requestRom(long inlet){
//    // vraag eerst numbanks op DIT DOEN WE IN MAX
    // ANDERS RACE CONDITIE OF ZOIETS
//    requestNumBanks();
    
    progressCounter_ = 0;
    midi_.sendSysexCommand(0x50);
    
    
//    useEepromCache_ = true;
    // Ga er maar vanuit dat dit goed gaat. We hebben geen aanduiding wanneer de transfer klaar is namelijk.
    hasEepromCache_ = true;
}
// send out complete eeprom to midi
void VxShruthi::transferRom(long inlet) {
    progressCounter_ = 0;
    DPOST("transferRom werkt niet");
//    midi_.transferEeprom(eeprom_, addressable_space_size());
//    useEepromCache_ = true;
}

// requests
void VxShruthi::requestNumbers(long inlet){ midi_.sendSysexCommand(0x1a); }
void VxShruthi::requestNumBanks(long inlet){ midi_.sendSysexCommand(0x1b); }
void VxShruthi::requestVersion(long inlet){
    DPOST("_______requestVersion()______");
    
    atom_setsym(atoms_, gensym("firmware"));
    atom_setsym(atoms_+1, gensym("undefined"));
    outlet_list(m_outlets[1], ps_empty, 2, atoms_);
    
    
    midi_.sendSysexCommand(0x1c);
}
void VxShruthi::requestPatch(long inlet){ midi_.sendSysexCommand(0x11); }
void VxShruthi::requestSequence(long inlet){ midi_.sendSysexCommand(0x12); }
void VxShruthi::requestWavetable(long inlet){ midi_.sendSysexCommand(0x13); }
void VxShruthi::requestSystemSettings(long inlet){ midi_.sendSysexCommand(0x14); }
void VxShruthi::requestSequenceStep(long inlet, long index){ midi_.sendSysex(NULL, 0x15, index & 0x0f, 0); }
void VxShruthi::requestPatchName(long inlet){ midi_.sendSysexCommand(0x16); }
void VxShruthi::requestSequencerSettings(long inlet){ midi_.sendSysexCommand(0x17); }
void VxShruthi::requestRandomizePatch(long inlet){ midi_.sendSysexCommand(0x31); }
void VxShruthi::requestRandomizeSequence(long inlet){ midi_.sendSysexCommand(0x32); }

void VxShruthi::requestPatchWrite(long slot){
    long first14Bit = slot & 0x3fff;
    uint8_t payload[2];
    payload[0] = first14Bit >> 8; // msb
    payload[1] = first14Bit & 0xff; // lsb
    midi_.sendSysex(payload, 0x21, 0, 2);
}

void VxShruthi::requestSequenceWrite(long slot){
    long first14Bit = slot & 0x3fff;
    uint8_t payload[2];
    payload[0] = first14Bit >> 8; // msb
    payload[1] = first14Bit & 0xff; // lsb
    midi_.sendSysex(payload, 0x22, 0, 2);
}

void VxShruthi::setPatchName(long inlet, t_symbol *name){
    if(slotIndex_ < 0) return;
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

//void VxShruthi::setMidiIn(long inlet, t_symbol* portName, long channel){
//    if(portName == ps_noinput){
//        DPOST("empty port name, skipping lookip");
//        return;
//    }
//    midi_.setMidiIn(portName, channel);
//}
//
//void VxShruthi::setMidiAuxIn(long inlet, t_symbol* portName, long channel){
//    if(portName == ps_noinput){
//        DPOST("empty port name, skipping lookip");
//        return;
//    }
//    midi_.setMidiAuxIn(portName, channel);
//}
//
//void VxShruthi::setMidiOut(long inlet, t_symbol* portName, long channel){
//    if(portName == ps_nooutput){
//        DPOST("empty port name, skipping lookip");
//        return;
//    }
//    midi_.setMidiOut(portName, channel);
//}

//void VxShruthi::enableFilterMsb(long inlet, long v){
//    midi_.setFilterMsb((v > 0) ? true : false);
//}
//void VxShruthi::enableEepromCache(long inlet, long v){
//    useEepromCache_ = (v > 0) ? true : false;
//}

void VxShruthi::liveStep(long inlet, t_symbol* s, long ac, t_atom *av)
{
    if(slotIndex_ < 0) return;
    
    if(ac != 6){
        object_error((t_object*)this,"liveStep expects a list of 6 items");
        return;
    }
    
    uint8_t stepIndex = (atom_getlong(av) - 1) & 0x0f;
    workingSequencer_[slotIndex_].steps[stepIndex].set_note(atom_getlong(av+1));
    // scale 0-127 to 0-7, round up is important here otherwise downspiral on iteration
    
//    DPOST("set velocity %f", VELOCITY_SCALE_DOWN * atom_getlong(av+2) + 0.5f);
//    workingSequencer_[slotIndex_].steps[stepIndex].set_velocity(VELOCITY_SCALE_DOWN * atom_getlong(av+2) + 0.5f);
    workingSequencer_[slotIndex_].steps[stepIndex].set_velocity(atom_getlong(av+2));
    workingSequencer_[slotIndex_].steps[stepIndex].set_controller(atom_getlong(av+4));
    
    // schedule transfer to prevent sending lots of data
    isSequenceDirty_ = true;
}

void VxShruthi::liveGrid(long inlet, t_symbol* s, long ac, t_atom *av)
{
    if(slotIndex_ < 0) return;
    
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
        workingSequencer_[slotIndex_].steps[i].set_gate(listGate[i]);
        workingSequencer_[slotIndex_].steps[i].set_legato(listLegato[i]);
    }
    
    // schedule transfer to prevent sending lots of data
    isSequenceDirty_ = true;
}

void VxShruthi::onTick(VxShruthi *x)
{
    if(x->isSequenceDirty_){
        DPOST("updating sequence on device");
        x->transferSequence();
//        x->outputSequence();
        x->isSequenceDirty_ = false;
    }
    clock_fdelay(x->clock_, SEQUENCE_UPDATE_INTERVAL_MS);
}

void VxShruthi::storePatch(long inlet, long slot){
    requestPatchWrite(slot);
    storePatchToEeprom(slot);
    
    requestSequenceWrite(slot);
    storeSequenceToEeprom(slot);
}

void VxShruthi::storePatchToEeprom(long slot){
    if(slotIndex_ < 0) return;
    
    DPOST("Store patch %i to eeprom cache", slot);
    uint8_t *address = getAddress<Patch>(slot);
    
    // update before write
    workingPatch_[slotIndex_].PrepareForWriteXt(*settings_, workingSequencer_[slotIndex_]);
    std::memcpy(address,
                &workingPatch_[slotIndex_],
                StorageConfiguration<Patch>::size);
}

void VxShruthi::loadPatchFromEeprom(long slot){
    if(slotIndex_ < 0) return;
    DPOST("Fetch patch %i from eeprom cache", slot);
    uint8_t *address = getAddress<Patch>(slot);
    std::memcpy(&workingPatch_[slotIndex_],
                address,
                StorageConfiguration<Patch>::size);
   
    // update patch data
    // also load sequence with same slot
    loadSequenceFromEeprom(slot);
    workingPatch_[slotIndex_].UpdateXt(*settings_, workingSequencer_[slotIndex_]);
}

void VxShruthi::storeSequenceToEeprom(long slot){
    if(slotIndex_ < 0) return;
    DPOST("Store sequence %i to eeprom", slot);
    uint8_t *address = getAddress<SequencerSettings>(slot);
    
    workingSequencer_[slotIndex_].PrepareForWrite();
    std::memcpy(address,
                & workingSequencer_[slotIndex_].steps,
                StorageConfiguration<SequencerSettings>::size);
}

void VxShruthi::loadSequenceFromEeprom(long slot){
    if(slotIndex_ < 0) return;
    DPOST("Fetch sequence %i from eeprom", slot);
    uint8_t *address = getAddress<SequencerSettings>(slot);
    std::memcpy(& workingSequencer_[slotIndex_].steps,
                address,
                StorageConfiguration<SequencerSettings>::size);
    
    workingSequencer_[slotIndex_].Update();
}

void VxShruthi::calculatePatternSize(){
    if(slotIndex_ < 0) return;
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

void VxShruthi::loadPatch(long inlet, long slot){
    if(slotIndex_ < 0) return;
    
    if(workingPatchIndex_[slotIndex_] == slot){
        DPOST("Slot same as working, using exising data", slot);
        outputPatchData();
        return;
    }
    
    workingPatchIndex_[slotIndex_] = slot; // store current active slot
    
    sendPatchProgramChange(slot);
    
    loadPatchFromEeprom(slot);
    outputPatchData();
    
    // sequences are coupled to patch storage
    outputSequence();
    // sequence settings are embedded in patch data
    outputSequencerSettings();
    
}

void VxShruthi::loadSequence(long inlet, long slot){
    if(slotIndex_ < 0) return;
    
    //if(xtmode_){
    //    object_error((t_object*)this, "loadSequence is not valid in xt mode");
    //    return;
    //}
    
    if(workingSequencerIndex_[slotIndex_] == slot){
        DPOST("Slot same as working, using existing seq data", slot);
        outputSequence();
        return;
    }
    
    workingSequencerIndex_[slotIndex_] = slot; // store current active slot
    
    // in xt mode zijn patch en sequence al gekoppeld
    //   if(!xtmode_){
    sendSequenceProgramChange(slot);
    //    }
    
    loadSequenceFromEeprom(slot);
    //    calculatePatternSize();
    outputSequence();
}

void VxShruthi::sendPatchProgramChange(long slot){
    midi_.sendPatchProgramChange(slot);
}

void VxShruthi::sendSequenceProgramChange(long slot){
    midi_.sendSequenceProgramChange(slot);
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
        midi_.clearCache();
        
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
    if(slotIndex_ < 0) return;
    std::memcpy(&clipboardPatch_,
                &workingPatch_[slotIndex_],
                StorageConfiguration<Patch>::size);
}

void VxShruthi::pastePatchFromClipboard(long inlet){
    if(slotIndex_ < 0) return;
    std::memcpy(&workingPatch_[slotIndex_],
                &clipboardPatch_,
                StorageConfiguration<Patch>::size);
    transferPatch();
    outputPatchData();
}

void VxShruthi::copySequenceToClipboard(long inlet){
    if(slotIndex_ < 0) return;
    std::memcpy(&clipboardSequencer_.steps,
                &workingSequencer_[slotIndex_].steps,
                StorageConfiguration<SequencerSettings>::size);
}

void VxShruthi::pasteSequenceFromClipboard(long inlet){
    if(slotIndex_ < 0) return;
    std::memcpy(&workingSequencer_[slotIndex_].steps,
                &clipboardSequencer_.steps,
                StorageConfiguration<SequencerSettings>::size);
    transferSequence();
    outputSequence();
}

void VxShruthi::refreshGui(){
    // clear want banks kjasdfl
    clearPatchNames();
    
    listPatchNames();

    // output the current selected patch and sequence numbers
    requestNumbers(); //hoort dit wel hier
    
    // output global setting data
    outputSettingsData(); // hoort dit wel hier?
}

// v range 1-8
void VxShruthi::switchToDevice(long inlet, long v){
    
    v = CLAMP(v, 1, 8);
    DPOST("switch to device (1-8): %i", v);
    
    // save current eeprom, but not when first time / startup
    if(slotIndex_ != -1){
        saveDeviceEeprom();
    }
    
    slotIndex_ = v-1;
    loadDeviceEeprom(); // load new
   
    // clear nrpn cache todo clean way
    midi_.clearCache();
    
    // pre xt sequencer settings are not stored anywhere
    // we might have restarted the editor
//    requestSequencerSettings();
    refreshGui();
}

void VxShruthi::processSysexInput(SysexCommand cmd, uint8_t arg, std::vector<uint8_t> &data) {
    
    if(slotIndex_ < 0) return;
    
    DPOST("acceptSysexData");
    uint8_t success = 0;
	// prevent exception when data is 0 and VS bounds check is enabled
    uint8_t *sysex_rx_buffer_ = 0;
	if(data.size()) sysex_rx_buffer_ = &data[0];

    switch (cmd) {
        case kNumbers:
            if(data.size() == 4){
                success = 1;
                uint16_t current_patch_number = (data[1] << 8) | data[0];
                uint16_t current_sequence_number = (data[3] << 8) | data[2];
                DPOST("Current patch and sequence: %i %i",current_patch_number, current_sequence_number );
                
                currentPatchNumber_ = current_patch_number;
                currentSequenceNumber_ = current_sequence_number;
                
                atom_setsym(atoms_, gensym("current"));
                atom_setlong(atoms_+1, currentPatchNumber_);
                atom_setlong(atoms_+2, currentSequenceNumber_);
                outlet_list(m_outlets[1], ps_empty, 3, atoms_);
            }
            break;
            
        case kNumBanks:
            if(data.size() == 0 && arg > 1){
                success = 1;
                numAccessibleBanks_ = arg;
                
                DPOST("Device numbanks: %i", numAccessibleBanks_ );
                
                if(numAccessibleBanks_ > 7 || numAccessibleBanks_ < 2){
                    object_error((t_object *)this, "Invalid eeprom size numbanks: %i", numAccessibleBanks_);
                    DPOST("Resetting storage to default 2 banks");
                    numAccessibleBanks_ = 2;
                }
                atom_setsym(atoms_, gensym("numbanks"));
                atom_setlong(atoms_+1, numAccessibleBanks_);
                outlet_list(m_outlets[1], ps_empty, 2, atoms_);
                
//                listPatchNames();
            }
            break;
            
        case kVersion:
            if(data.size() == 2){
                success = 1;
                
                firmware_major_ = data[0];
                firmware_minor_ = data[1];
                DPOST("Firmware version %i %i", firmware_major_, firmware_minor_);
                atom_setsym(atoms_, gensym("firmware"));
                atom_setlong(atoms_+1, firmware_major_);
                atom_setlong(atoms_+2, firmware_minor_);
                outlet_list(m_outlets[1], ps_empty, 3, atoms_);
                
            }else{
                object_error((t_object*)this, "Invalid response from version request");
            }
            break;
            
        case kPatch:  // Patch transfer
            
            success = workingPatch_[slotIndex_].CheckBufferXt(sysex_rx_buffer_);
            
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
            DPOST("cmd %d arg %d", cmd, arg);
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
                            
void VxShruthi::setNumBanks(long inlet, long v){
    DPOST("setNumBanks %i", v);
    numAccessibleBanks_ = CLAMP(v, 2, 7);
}

void VxShruthi::processNrpnInput(long index, long v){
    
    // update internal eeprom
//    mapSequencerNrpnToEeprom(nrpn_index, v);
    mapNrpnToEeprom(index, v);
    
    // send out to patch
    outputNrpn(index, v);
}

/*
    In xt mode all knob changes come in as cc and need to be mapped to correct nrpns
    for the editor.
 */
void VxShruthi::processCcInput(long index, long v){
    mapCcToNrpn(index, v);
}

/*
 For XT firmware convert the CC to NRPN for the editor controls
 mapping is like this 128/x = increment,
 don't round off inc. So for a 6 value nrpn the CC values would be
 128 / 6 = 21.333333
 range in nrpn = 0 tm 5
 value 0 = 0
 value 2 = 43
 value 5 = 107
 
 aantal steps voor negatief:
 range -6 6 -> 6 + 7 = 13 nsteps
 */


long VxShruthi::convertControlValue(long v, long nsteps, long min){
    float stepsize = 128.f / nsteps;
    long step = floor((float)v / stepsize);
    long result = min + step;
    DPOST("converted value to %i", result);
    return result;
}

/*  map incoming cc to nrpn and act like it was received as such, using the same callback
    so that behavior is same. Bit of a hack though.
 */
void VxShruthi::mapCcToNrpn(long index, long v){
    
    switch(index){
            
            // oscillators
        case 20: processNrpnInput(0, convertControlValue(v, 34)); break;
        case 21: processNrpnInput(1, v); break;
        case 22: processNrpnInput(2, convertControlValue(v, 49, -24)); break;
        case 28: processNrpnInput(3, convertControlValue(v, 14)); break;
        case 24: processNrpnInput(4, convertControlValue(v, 34)); break;
        case 25: processNrpnInput(5, v); break;
        case 26: processNrpnInput(6, convertControlValue(v, 49, -24)); break;
        case 27: processNrpnInput(7, v); break;
        case 29: processNrpnInput(8, convertControlValue(v, 64)); break;
        case 30: processNrpnInput(9, convertControlValue(v, 64)); break;
        case 31: processNrpnInput(10, convertControlValue(v, 64)); break;
        case 23: processNrpnInput(11, convertControlValue(v, 11)); break;
            
            // filter
        case 14: processNrpnInput(12, v); break;
        case 74: processNrpnInput(12, v); break;
        case 15: processNrpnInput(13, convertControlValue(v, 64)); break;
        case 71: processNrpnInput(13, convertControlValue(v, 64)); break;
        case 102: processNrpnInput(14, convertControlValue(v, 64)); break;
        case 103: processNrpnInput(15, convertControlValue(v, 64)); break;
            
            // envelopes
        case 104: processNrpnInput(16, v); break;
        case 105: processNrpnInput(17, v); break;
        case 106: processNrpnInput(18, v); break;
        case 107: processNrpnInput(19, v); break;
        case 108: processNrpnInput(20, v); break;
        case 109: processNrpnInput(21, v); break;
        case 110: processNrpnInput(22, v); break;
        case 111: processNrpnInput(23, v); break;
            
            // lfos
        case 112: processNrpnInput(24, convertControlValue(v, 21)); break;
        case 113: processNrpnInput(25, convertControlValue(v, 144)); break;
        case 114: processNrpnInput(26, v); break;
        case 115: processNrpnInput(27, convertControlValue(v, 4)); break;
        case 116: processNrpnInput(28, convertControlValue(v, 21)); break;
        case 117: processNrpnInput(29, convertControlValue(v, 144)); break;
        case 118: processNrpnInput(30, v); break;
        case 119: processNrpnInput(31, convertControlValue(v, 4)); break;
            
            // sequencer settings
        case 75: processNrpnInput(100, convertControlValue(v, 3)); break;
        case 76: processNrpnInput(102, convertControlValue(v, 6)); break;
        case 77: processNrpnInput(103, v); break;
        case 78: processNrpnInput(104, convertControlValue(v, 4)); break;
        case 79: processNrpnInput(105, convertControlValue(v, 4, 1)); break;
        case 80: processNrpnInput(106, convertControlValue(v, 16)); break;
        case 81: processNrpnInput(107, convertControlValue(v, 12)); break;
            
            // system settings (fictieve nrpns voor xt, voor nu)
        case 82: processNrpnInput(142, convertControlValue(v, 12)); break;
        case 83: processNrpnInput(143, convertControlValue(v, 33)); break;
        case 84: processNrpnInput(144, convertControlValue(v, 64)); break;
        case 68: processNrpnInput(145, convertControlValue(v, 2)); break;
            
            // filterboard xtras
        case 12: processNrpnInput(84, v); break;
        case 13: processNrpnInput(85, convertControlValue(v, 64)); break;
        case 85: processNrpnInput(92, convertControlValue(v, 6)); break;
        case 86: processNrpnInput(93, convertControlValue(v, 6)); break;
        case 87: processNrpnInput(92, convertControlValue(v, 6)); break;
        case 88: processNrpnInput(93, convertControlValue(v, 16)); break;
        case 89: processNrpnInput(92, convertControlValue(v, 2)); break;
        case 90: processNrpnInput(84, convertControlValue(v, 2)); break;
        case 91: processNrpnInput(85, convertControlValue(v, 2)); break;
        case 92: processNrpnInput(92, convertControlValue(v, 15)); break;
        case 93: processNrpnInput(93, convertControlValue(v, 4)); break;
        case 94: processNrpnInput(92, convertControlValue(v, 16)); break;
        case 95: processNrpnInput(93, convertControlValue(v, 16)); break;
            
            
        default:
            DPOST("ignored cc %i %i", index, v);
            // do nothing
    }
}


void VxShruthi::nrpn(long inlet, long nrpn_index, long v){
    
    if(slotIndex_ < 0) return;
    
    // update internal eeprom
    mapNrpnToEeprom(nrpn_index, v);
    
    // send to device
    midi_.sendNrpn(nrpn_index, v);
}

void VxShruthi::cc(long inlet, long index, long v){
    midi_.parseControlChange(index, v);
}

void VxShruthi::sysex(long inlet, t_symbol* s, long ac, t_atom *av){
 
    std::vector<uint8_t> data;
    std::vector<uint8_t>::iterator it;
    
    for(int i=0; i<ac; ++i){
        data.push_back(static_cast<uint8_t>(atom_getlong(av+i)));
    }
    
    // split data if multiple sysex messages
    // komt alleen voor bij sysex echo door midi "full" setting
    // dan zijn het 2 messages. Nog niet voorgekomen dat het er meer zijn
    it = std::find(data.begin(), data.end(), 0xf7);
    
    if(it != data.end() && ++it != data.end()){
        DPOST("Found a second sysex message in data");
        std::vector<uint8_t> msg1(data.begin(), it);
        std::vector<uint8_t> msg2(it, data.end());
        midi_.parseSysex(msg1);
        midi_.parseSysex(msg2);
    }else{
    
        midi_.parseSysex(data);
    }
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
        case 64:
            p.modulation_matrix.modulation[10].amount = v;
            
            break;
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
        case 107: workingSequencer_[slotIndex_].arp_clock_division = v; break;
            
        case 108: workingSequencer_[slotIndex_].pattern_size = v; break;
        case 109: workingSequencer_[slotIndex_].pattern_rotation = v; break;
            
        // in xt these system settings emit cc and are mapped to (fictive?) nrpns
        case 142: settings_->octave = v; break;
        case 143: settings_->raga = v; break;
        case 144: settings_->portamento = v; break;
        case 145: settings_->legato = v; break;
            
        default:
            object_error((t_object*)this, "Nrpn index %i is not valid", nrpn_index);
    }

}


// voor als er iets hangt
void VxShruthi::stopTransfer(long inlet){
    midi_.stopTransfer();
}

// triggered by kNumBanks return, because first we want to know the
// total number of slots to init the list
void VxShruthi::listPatchNames(long inlet){
    
    Patch *p;
    uint8_t *pmem;
    int patchNumber = 0;
    int rowNumber = 0;
    
    
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
        atom_setlong(atoms_+1, (float)patchNumber++/32.f);
        atom_setlong(atoms_+2, rowNumber++);
        
        if(p->version_ != '!' && p->version_ !='%'){ // % = xt version
            atom_setsym(atoms_+3, gensym("-"));
        } else {
			// convert name into 0 terminated string
			char str[kPatchNameSize+1];
			memcpy(str, p->name, kPatchNameSize);
			str[kPatchNameSize] = 0;
            atom_setsym(atoms_+3, gensym(str));
        }
        outlet_list(m_outlets[1], ps_empty, 4, atoms_);
        ++p;
    }
    
    
    // for each bank 64 patches
    for(int k=0; k<numAccessibleBanks_; ++k){
    
        pmem = eeprom_ + kInternalEepromSize + (k * kBankSize);
        
        for(size_t i=0; i<64; ++i ){
            p = reinterpret_cast<Patch *>(pmem + i*PATCH_SIZE);
            atom_setlong(atoms_+1, (float)patchNumber++/32.f);
            atom_setlong(atoms_+2, rowNumber++);
            
            if(p->version_ != '!' && p->version_ !='%'){ // % = xt version
                atom_setsym(atoms_+3, gensym("-"));
            } else {
				// convert name into 0 terminated string
				char str[kPatchNameSize+1];
				memcpy(str, p->name, kPatchNameSize);
				str[kPatchNameSize] = 0;
				atom_setsym(atoms_+3, gensym(str));
            }
            outlet_list(m_outlets[1], ps_empty, 4, atoms_);
            ++p;
            
            if(rowNumber >= 32){
                rowNumber = 0;
            }
        }
    }

}

void VxShruthi::clearPatchNames(long inlet){
    
    int patchNumber = 0;
    int rowNumber = 0;
    
    // first output how many patches there will be
//    atom_setsym(atoms_, gensym("patchcount"));
//    atom_setlong(atoms_+1, getNumPatches());
//    outlet_list(m_outlets[1], ps_empty, 2, atoms_);
    
    // then build the list
    atom_setsym(atoms_, gensym("patchlist"));
    atom_setsym(atoms_+3, ps_empty); // altijd zelfde
    
    for(size_t i=0; i<16; ++i ){
        atom_setlong(atoms_+1, (float)patchNumber++/32.f);
        atom_setlong(atoms_+2, rowNumber++);
        outlet_list(m_outlets[1], ps_empty, 4, atoms_);
    }
    
    // for each bank 64 patches
    // kan wel maar dan wel de vorige device niet van huidige anders
    // schiet je er niks mee ok
    //for(int k=0; k<numAccessibleBanks_; ++k){
    for(int k=0; k<7; ++k){
        for(size_t i=0; i<64; ++i ){
            atom_setlong(atoms_+1, (float)patchNumber++/32.f);
            atom_setlong(atoms_+2, rowNumber++);
            outlet_list(m_outlets[1], ps_empty, 4, atoms_);
            
            if(rowNumber >= 32){
                rowNumber = 0;
            }
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
    
    REGISTER_METHOD(VxShruthi, requestNumbers);
    REGISTER_METHOD(VxShruthi, requestNumBanks);
    REGISTER_METHOD(VxShruthi, requestVersion);
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
    
    REGISTER_METHOD_LONG2(VxShruthi, nrpn);
    REGISTER_METHOD_LONG2(VxShruthi, cc);
    REGISTER_METHOD_GIMME(VxShruthi, sysex);
    
    REGISTER_METHOD_GIMME(VxShruthi, liveStep);
    REGISTER_METHOD_GIMME(VxShruthi, liveGrid);
    REGISTER_METHOD_GIMME(VxShruthi, setSystemSettings);
    
    REGISTER_METHOD_LONG(VxShruthi, setPatternLength);
    REGISTER_METHOD_LONG(VxShruthi, setPatternRotation);
    REGISTER_METHOD_SYMBOL(VxShruthi, setPatchName);
    
    REGISTER_METHOD_LONG(VxShruthi, loadPatch);
    REGISTER_METHOD_LONG(VxShruthi, loadSequence);
    
    REGISTER_METHOD_SYMBOL(VxShruthi, importEeprom);
    REGISTER_METHOD_SYMBOL(VxShruthi, exportEeprom);

    REGISTER_METHOD(VxShruthi, clearEepromCache);
    REGISTER_METHOD(VxShruthi, stopTransfer);
    REGISTER_METHOD_LONG(VxShruthi, setNumBanks);
    REGISTER_METHOD(VxShruthi, listPatchNames);
 
    REGISTER_METHOD(VxShruthi, copyPatchToClipboard);
    REGISTER_METHOD(VxShruthi, pastePatchFromClipboard);
    REGISTER_METHOD(VxShruthi, copySequenceToClipboard);
    REGISTER_METHOD(VxShruthi, pasteSequenceFromClipboard);
    
    REGISTER_METHOD_LONG(VxShruthi, switchToDevice);

}

