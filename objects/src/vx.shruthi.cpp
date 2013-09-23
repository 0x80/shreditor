//#include "maxcpp6.h"

#include "vx.shruthi.h"

#include <cstring>
#include <iostream>
#include <cstdlib>
#include <map>
#include <fstream>


// for using _1 _2 
using namespace std::placeholders;
//#include "rtmidi/RtMidi.h"

const float VELOCITY_SCALE_DOWN = 7.f / 127.f;
const float VELOCITY_SCALE_UP = 1.f / VELOCITY_SCALE_DOWN;

//#define WAVETABLE_NSAMPS 129
//#define WAVETABLE_SIZE 129 << 3 // 8 * 129

static const float SEQUENCE_UPDATE_INTERVAL_MS = 500.f;

const size_t kExternalEepromSize = kBankSize * kMaxNumBanks;
const size_t kExternalEepromOffset = kInternalEepromSize;
const size_t kEepromSize = kInternalEepromSize + kExternalEepromSize;

static t_symbol *ps_nrpn = gensym("nrpn");
//static t_symbol *ps_cc = gensym("cc");
static t_symbol *ps_empty = gensym("");
static t_symbol *psx_name = gensym("name"); // global clash
static t_symbol *ps_settings = gensym("settings");
//static t_symbol *ps_filter = gensym("filter");
//static t_symbol *ps_unknown = gensym("unknown");
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
//static t_symbol *ps_size = gensym("size"); // global clash
static t_symbol *ps_progress = gensym("progress");
//static t_symbol *ps_transfer = gensym("transfer");
//static t_symbol *ps_extra1 = gensym("extra1");
//static t_symbol *ps_step = gensym("step");    
//static t_symbol *ps_liveStep = gensym("liveStep");
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


//static inline uint8_t pgm_read_byte(const uint8_t* address){
//    return *address;
//}


VxShruthi::VxShruthi(t_symbol * sym, long ac, t_atom * av)
:   transfer_(device_),
    num_accessible_banks_(kMaxNumBanks),
    useEepromCache_(true),
    hasEepromCache_(false)
{
    eeprom_ = new uint8_t[kEepromSize];
    settings_ = (SystemSettings *)eeprom_; // settings are stored in first part of eeprom
    
    memset(eeprom_, 0, kEepromSize*sizeof(uint8_t)); // init to zero
    
    setupIO(1, 2); // inlets / outlets

    device_.registerSysexCallback(std::bind(&VxShruthi::acceptSysexData, this, _1, _2, _3));
	device_.registerNrpnCallback(std::bind(&VxShruthi::midiNrpnCallback, this, _1, _2));
    transfer_.registerProgressCallback(std::bind(&VxShruthi::transferProgressReporter, this, _1, _2));
    
    m_clock = clock_new((t_object *)this, (method)onTick);
    clock_fdelay(m_clock, SEQUENCE_UPDATE_INTERVAL_MS);
}

VxShruthi::~VxShruthi() {
    delete[] eeprom_;
    object_free(m_clock);
}

uint16_t VxShruthi::addressable_space_size() {
    return kInternalEepromSize + num_accessible_banks_ * kBankSize;
}

//void VxShruthi::outputProgress(long busy, long progress){
void VxShruthi::outputProgress(long progress){
//    post("progress %d", progress);
    atom_setsym(atoms_, ps_progress);
//    atom_setlong(atoms_+1, busy);
//    atom_setlong(atoms_+2, progress);
//    outlet_list(m_outlets[1], ps_empty, 3, atoms_);
    atom_setlong(atoms_+1, progress);
    outlet_list(m_outlets[1], ps_empty, 2, atoms_);
}

void VxShruthi::outputPatchData(){    
    // Convert name directly to symbol. Both should be char
    atom_setsym(atoms_, psx_name);
    atom_setsym(atoms_+1, gensym((char*)patch_.name));
    outlet_list(m_outlets[1], ps_empty, 2, atoms_);
    
    outputNrpn(0, patch_.osc[0].shape);
    outputNrpn(1, patch_.osc[0].parameter);
    outputNrpn(2, patch_.osc[0].range);
    outputNrpn(3, patch_.osc[0].option); // modulation operator?
    
    outputNrpn(4, patch_.osc[1].shape);
    outputNrpn(5, patch_.osc[1].parameter);
    outputNrpn(6, patch_.osc[1].range);
    outputNrpn(7, patch_.osc[1].option); // detune?
    
    outputNrpn(8, patch_.mix_balance);
    outputNrpn(9, patch_.mix_sub_osc);
    outputNrpn(10, patch_.mix_noise);
    outputNrpn(11, patch_.mix_sub_osc_shape);
    
    outputNrpn(12, patch_.filter_cutoff);
    outputNrpn(13, patch_.filter_resonance);
    outputNrpn(14, patch_.filter_env);
    outputNrpn(15, patch_.filter_lfo);
    
    outputNrpn(16, patch_.env[0].attack);
    outputNrpn(17, patch_.env[0].decay);
    outputNrpn(18, patch_.env[0].sustain);
    outputNrpn(19, patch_.env[0].release);
    
    outputNrpn(20, patch_.env[1].attack);
    outputNrpn(21, patch_.env[1].decay);
    outputNrpn(22, patch_.env[1].sustain);
    outputNrpn(23, patch_.env[1].release);

    outputNrpn(24, patch_.lfo[0].waveform);
    outputNrpn(25, patch_.lfo[0].rate);
    outputNrpn(26, patch_.lfo[0].attack);
    outputNrpn(27, patch_.lfo[0].retrigger_mode);
    
    outputNrpn(28, patch_.lfo[1].waveform);
    outputNrpn(29, patch_.lfo[1].rate);
    outputNrpn(30, patch_.lfo[1].attack);
    outputNrpn(31, patch_.lfo[1].retrigger_mode);

    // kModulationMatrixSize 12
    outputNrpn(32, patch_.modulation_matrix.modulation[0].source);
    outputNrpn(33, patch_.modulation_matrix.modulation[0].destination);
    outputNrpn(34, patch_.modulation_matrix.modulation[0].amount);
    outputNrpn(35, patch_.modulation_matrix.modulation[1].source);
    outputNrpn(36, patch_.modulation_matrix.modulation[1].destination);
    outputNrpn(37, patch_.modulation_matrix.modulation[1].amount);
    outputNrpn(38, patch_.modulation_matrix.modulation[2].source);
    outputNrpn(39, patch_.modulation_matrix.modulation[2].destination);
    outputNrpn(40, patch_.modulation_matrix.modulation[2].amount);
    outputNrpn(41, patch_.modulation_matrix.modulation[3].source);
    outputNrpn(42, patch_.modulation_matrix.modulation[3].destination);
    outputNrpn(43, patch_.modulation_matrix.modulation[3].amount);
    outputNrpn(44, patch_.modulation_matrix.modulation[4].source);
    outputNrpn(45, patch_.modulation_matrix.modulation[4].destination);
    outputNrpn(46, patch_.modulation_matrix.modulation[4].amount);
    outputNrpn(47, patch_.modulation_matrix.modulation[5].source);
    outputNrpn(48, patch_.modulation_matrix.modulation[5].destination);
    outputNrpn(49, patch_.modulation_matrix.modulation[5].amount);
    outputNrpn(50, patch_.modulation_matrix.modulation[6].source);
    outputNrpn(51, patch_.modulation_matrix.modulation[6].destination);
    outputNrpn(52, patch_.modulation_matrix.modulation[6].amount);
    outputNrpn(53, patch_.modulation_matrix.modulation[7].source);
    outputNrpn(54, patch_.modulation_matrix.modulation[7].destination);
    outputNrpn(55, patch_.modulation_matrix.modulation[7].amount);
    outputNrpn(56, patch_.modulation_matrix.modulation[8].source);
    outputNrpn(57, patch_.modulation_matrix.modulation[8].destination);
    outputNrpn(58, patch_.modulation_matrix.modulation[8].amount);
    outputNrpn(59, patch_.modulation_matrix.modulation[9].source);
    outputNrpn(60, patch_.modulation_matrix.modulation[9].destination);
    outputNrpn(61, patch_.modulation_matrix.modulation[9].amount);
    outputNrpn(62, patch_.modulation_matrix.modulation[10].source);
    outputNrpn(63, patch_.modulation_matrix.modulation[10].destination);
    outputNrpn(64, patch_.modulation_matrix.modulation[10].amount);
    outputNrpn(65, patch_.modulation_matrix.modulation[11].source);
    outputNrpn(66, patch_.modulation_matrix.modulation[11].destination);
    outputNrpn(67, patch_.modulation_matrix.modulation[11].amount);
    

    outputNrpn(84, patch_.filter_cutoff_2);
    outputNrpn(85, patch_.filter_resonance_2);
    outputNrpn(92, patch_.filter_1_mode_);
    outputNrpn(93, patch_.filter_2_mode_);
    
    outputNrpn(94, patch_.ops_[0].operands[0]);
    outputNrpn(95, patch_.ops_[0].operands[1]);
    outputNrpn(96, patch_.ops_[0].op);
    outputNrpn(97, patch_.ops_[1].operands[0]);
    outputNrpn(98, patch_.ops_[1].operands[1]);
    outputNrpn(99, patch_.ops_[1].op);
}



void VxShruthi::setSystemSettings(long inlet, t_symbol *s, long ac, t_atom *av){
    
    if(ac != 10){
        error("setSystemSettings expects 10 arguments, not %i", ac);
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
    
//
//    atom_setsym(atoms_, ps_settings);
//    atom_setsym(atoms_+1, gensym("octave"));
//    atom_setlong(atoms_+2, settings_->octave);
//    outlet_list(m_outlets[1], ps_empty, 3, atoms_);
//    
//    atom_setsym(atoms_, ps_settings);
//    atom_setsym(atoms_+1, gensym("raga"));
//    atom_setlong(atoms_+2, settings_->raga);
//    outlet_list(m_outlets[1], ps_empty, 3, atoms_);
//    
//    atom_setsym(atoms_, ps_settings);
//    atom_setsym(atoms_+1, gensym("portamento"));
//    atom_setlong(atoms_+2, settings_->portamento);
//    outlet_list(m_outlets[1], ps_empty, 3, atoms_);
//    
//    atom_setsym(atoms_, ps_settings);
//    atom_setsym(atoms_+1, gensym("legato"));
//    atom_setlong(atoms_+2, settings_->legato);
//    outlet_list(m_outlets[1], ps_empty, 3, atoms_);
//    
//    atom_setsym(atoms_, ps_settings);
//    atom_setsym(atoms_+1, gensym("tuning"));
//    atom_setlong(atoms_+2, settings_->master_tuning);
//    outlet_list(m_outlets[1], ps_empty, 3, atoms_);
//    
//    atom_setsym(atoms_, ps_settings);
//    atom_setsym(atoms_+1, gensym("channel"));
//    atom_setlong(atoms_+2, settings_->midi_channel);
//    outlet_list(m_outlets[1], ps_empty, 3, atoms_);
//    
//    atom_setsym(atoms_, ps_settings);
//    atom_setsym(atoms_+1, gensym("midimode"));
//    atom_setlong(atoms_+2, settings_->midi_out_mode);
//    outlet_list(m_outlets[1], ps_empty, 3, atoms_);
//
//    atom_setsym(atoms_, ps_settings);
//    atom_setsym(atoms_+1, gensym("split"));
//    atom_setlong(atoms_+2, settings_->midi_split_point);
//    outlet_list(m_outlets[1], ps_empty, 3, atoms_);
//
//    atom_setsym(atoms_, ps_settings);
//    atom_setsym(atoms_+1, gensym("filter"));
//    atom_setlong(atoms_+2, settings_->expansion_filter_board);
//    outlet_list(m_outlets[1], ps_empty, 3, atoms_);
//
//    atom_setsym(atoms_, ps_settings);
//    atom_setsym(atoms_+1, gensym("cvmode"));
//    atom_setlong(atoms_+2, settings_->expansion_cv_mode);
//    outlet_list(m_outlets[1], ps_empty, 3, atoms_);
}

void VxShruthi::outputNrpn(long index, long value){
//    post("outputNrpn %i, %i", index, value);
    atom_setlong(atoms_, index);
    atom_setlong(atoms_+1, value);
    outlet_list(m_outlets[0],  ps_nrpn, 2, atoms_);
}

void VxShruthi::outputSequencerSettings(){
    outputNrpn(100, sequencer_.seq_mode);
    outputNrpn(101, sequencer_.seq_tempo);
    outputNrpn(102, sequencer_.seq_groove_template);
    outputNrpn(103, sequencer_.seq_groove_amount);
    outputNrpn(104, sequencer_.arp_direction);
    outputNrpn(105, sequencer_.arp_range);
    outputNrpn(106, sequencer_.arp_pattern);
    outputNrpn(107, sequencer_.arp_warp);
    outputNrpn(108, sequencer_.pattern_size);
    outputNrpn(109, sequencer_.pattern_rotation);
    
//    atom_setsym(atoms_, ps_sequencersettings);
//    t_atom *data = atoms_+2;
//    
//    // rotation
//    atom_setsym(atoms_+1, ps_rotation);
//    atom_setlong(atoms_+2, sequencer_.pattern_rotation);
//    outlet_list(m_outlets[1], ps_empty, 3, atoms_);
//
//    // size
//    atom_setsym(atoms_+1, ps_size);
//    atom_setlong(atoms_+2, sequencer_.pattern_size);
//    outlet_list(m_outlets[1], ps_empty, 3, atoms_);
}

void VxShruthi::outputSequence(){
    atom_setsym(atoms_, ps_sequence);
    t_atom *data = atoms_+2;
    
    // note
    atom_setsym(atoms_+1, ps_note);
    for(int i=0; i<kNumSteps; ++i)
        atom_setlong(data+i, sequencer_.steps[i].getNoteValue()); // only first 7 bits
    outlet_list(m_outlets[1], ps_empty, kNumSteps+2, atoms_);
    
    // velocity
    atom_setsym(atoms_+1, ps_velocity);
    for(int i=0; i<kNumSteps; ++i)
        atom_setlong(data+i, sequencer_.steps[i].getVelocityValue() * VELOCITY_SCALE_UP);
    outlet_list(m_outlets[1], ps_empty, kNumSteps+2, atoms_);

    // ctrl
    atom_setsym(atoms_+1, ps_ctrl);
    for(int i=0; i<kNumSteps; ++i)
        atom_setlong(data+i, sequencer_.steps[i].getControllerValue());
    outlet_list(m_outlets[1], ps_empty, kNumSteps+2, atoms_);
    
    // gate
    atom_setsym(atoms_+1, ps_gate);
    for(int i=0; i<kNumSteps; ++i)
        atom_setlong(data+i, sequencer_.steps[i].getGateValue());
    outlet_list(m_outlets[1], ps_empty, kNumSteps+2, atoms_);
    
    // legato
    atom_setsym(atoms_+1, ps_legato);
    for(int i=0; i<kNumSteps; ++i)
        atom_setlong(data+i, sequencer_.steps[i].getLegatoValue());
    outlet_list(m_outlets[1], ps_empty, kNumSteps+2, atoms_);
    
//    // rotation
//    atom_setsym(atoms_+1, ps_rotation);
//    atom_setlong(atoms_+2, sequencer_.pattern_rotation);
//    outlet_list(m_outlets[1], ps_empty, 3, atoms_);
//    
//    // size
//    atom_setsym(atoms_+1, ps_size);
//    atom_setlong(atoms_+2, sequencer_.pattern_size);
//    outlet_list(m_outlets[1], ps_empty, 3, atoms_);
    
    
    // gate legato matrix
//        int counter = 0;
    atom_setsym(atoms_, ps_liveGrid);

    for(int i=0; i<16; ++i){
        atom_setlong(atoms_+1, i+1);
        atom_setlong(atoms_+2, 1);
        atom_setlong(atoms_+3, sequencer_.steps[i].getLegatoValue());
        outlet_list(m_outlets[1], ps_empty, 4, atoms_);
    }
    
    for(int i=0; i<16; ++i){
        atom_setlong(atoms_+1, i+1);
        atom_setlong(atoms_+2, 2);
        atom_setlong(atoms_+3, sequencer_.steps[i].getGateValue());
        outlet_list(m_outlets[1], ps_empty, 4, atoms_);
    }
    
//        outlet_list(m_outlets[1], ps_empty, 1+counter*3, atoms_);
}


    
// transfers
void VxShruthi::transferPatch(long inlet){
    device_.sendSysex((uint8_t*) &patch_, 0x01, 0, PATCH_SIZE);
}

void VxShruthi::transferSequence(long inlet){
    device_.sendSysex((uint8_t*) sequencer_.steps, 0x02, 0, sizeof(SequenceStep) * kNumSteps);
}

void VxShruthi::transferWavetable(long inlet){
    device_.sendSysex(wavetable_, 0x03, 0, kUserWavetableSize);
}

void VxShruthi::transferSystemSettings(long inlet){
    device_.sendSysex((uint8_t*) settings_, 0x04, 0, SYSTEM_SETTINGS_SIZE);
}

void VxShruthi::transferSequenceStep(long index){
    uint8_t stepIndex = index & 0x0f;
    device_.sendSysex(sequencer_.steps[stepIndex].data_, 0x05, stepIndex, 2);
}

void VxShruthi::transferPatchName(long inlet){
    device_.sendSysex(patch_.name, 0x06, 0, kPatchNameSize);
}

void VxShruthi::transferSequencerSettings(long inlet){
    device_.sendSysex((uint8_t*) &sequencer_, 0x07, 0, sizeof(SequencerSettings));
}

void VxShruthi::setPatternLength(long inlet, long length){
    uint8_t v = CLAMP(length, 1, 16);
    sequencer_.pattern_size = v;
    device_.sendSysexCommand(0x08, v);
}

void VxShruthi::setPatternRotation(long inlet, long rotation){
    uint8_t v = rotation & 0x0f;
    sequencer_.pattern_rotation = v;
    device_.sendSysexCommand(0x09, v);
}

void VxShruthi::requestRom(long inlet){
    device_.sendSysexCommand(0x50);
//    useEepromCache_ = true;
    // Ga er maar vanuit dat dit goed gaat. We hebben geen aanduiding wanneer de transfer klaar is namelijk.
    hasEepromCache_ = true;
}
// send out complete eeprom to midi
void VxShruthi::transferRom(long inlet) {
    
    transfer_.transferEeprom(eeprom_, addressable_space_size());
//    useEepromCache_ = true;
}

// requests
void VxShruthi::requestNumbers(long inlet){ device_.sendSysexCommand(0x1a); }
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
    sequencer_.steps[step & 0x0f].setNoteValue(value);
    transferSequenceStep(step);
}

void VxShruthi::setSequenceController(long inlet, long step, long value){
    sequencer_.steps[step & 0x0f].setControllerValue(value);
    transferSequenceStep(step);
}

void VxShruthi::setSequenceGate(long inlet, long step, long value){
    sequencer_.steps[step & 0x0f].setGateValue(value);
    transferSequenceStep(step);
}

void VxShruthi::setSequenceLegato(long inlet, long step, long value){
    sequencer_.steps[step & 0x0f].setLegatoValue(value);
    transferSequenceStep(step);
}

void VxShruthi::setSequenceVelocity(long inlet, long step, long value){
    sequencer_.steps[step & 0x0f].setVelocityValue(value);
    transferSequenceStep(step);
}

void VxShruthi::setPatchName(long inlet, t_symbol *name){
    int c = 0;
    const char* cname = name->s_name;
    for(c=0; c<kPatchNameSize; ++c){
        patch_.name[c] = cname[c];
        if(cname[c] == '\0'){
            break;
        }
    }
    
    while(c < kPatchNameSize){
        patch_.name[c] = ' ';
        ++c;
    }
    
    transferPatchName();
    
    atom_setsym(atoms_, psx_name);
    atom_setsym(atoms_+1, gensym((char*)patch_.name));
    outlet_list(m_outlets[1], ps_empty, 2, atoms_);
    
    listPatchNames();
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
        error("Unknown filter board %s", name->s_name);
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
        error("liveStep expects a list of 6 items");
        return;
    }
    
    uint8_t stepIndex = (atom_getlong(av) - 1) & 0x0f;
    sequencer_.steps[stepIndex].setNoteValue(atom_getlong(av+1));
    // scale 0-127 to 0-7, round up is important here otherwise downspiral on iteration
    sequencer_.steps[stepIndex].setVelocityValue(VELOCITY_SCALE_DOWN * atom_getlong(av+2) + 0.5f); 
    sequencer_.steps[stepIndex].setControllerValue(atom_getlong(av+4));
    
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
                error("Invalid row index for liveGrid: %i", row);
                break;
        }
    }
    
    for(size_t i=0; i<16; ++i){
        sequencer_.steps[i].setGateValue(listGate[i]);
        sequencer_.steps[i].setLegatoValue(listLegato[i]);
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
    requestSequenceWrite(slot);
    storeSequenceToEeprom(slot);
}

void VxShruthi::storePatchToEeprom(long slot){
    DPOST("Store patch %i to eeprom cache", slot);
    uint8_t *address = getAddress<Patch>(slot);
    std::memcpy(address,
                &patch_,
                StorageConfiguration<Patch>::size);
}

void VxShruthi::loadPatchFromEeprom(long slot){
    DPOST("Fetch patch %i from eeprom cache", slot);
    uint8_t *address = getAddress<Patch>(slot);
    std::memcpy(&patch_,
                address,
                StorageConfiguration<Patch>::size);
}
void VxShruthi::storeSequenceToEeprom(long slot){
    DPOST("Store sequence %i to eeprom", slot);
    uint8_t *address = getAddress<SequencerSettings>(slot);
    std::memcpy(address,
                &sequencer_.steps,
                StorageConfiguration<SequencerSettings>::size);
}

void VxShruthi::loadSequenceFromEeprom(long slot){
    DPOST("Fetch sequence %i from eeprom", slot);
    uint8_t *address = getAddress<SequencerSettings>(slot);
    std::memcpy(&sequencer_.steps,
                address,
                StorageConfiguration<SequencerSettings>::size);
}

void VxShruthi::loadPatch(long inlet, long slot){
    
    sendPatchProgramChange(slot);
    
    if(useEepromCache_ && hasEepromCache_){
        loadPatchFromEeprom(slot);
        outputPatchData();
    }else{
        DPOST("Transferring patch %i from device", slot);
        // delay nodig misschien?
        requestPatch();
    }
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
    
    message.push_back(0xb0 | device_.channelOut_);
    message.push_back(0x20); // bank LSB
    message.push_back(bank);
    
    // Program Change
    message.push_back(0xc0 | device_.channelOut_);
    message.push_back(patch);
    
    device_.sendMessage( &message );
}


void VxShruthi::loadSequence(long inlet, long slot){
    
    sendSequenceProgramChange(slot);
    
    if(useEepromCache_ && hasEepromCache_){
        loadSequenceFromEeprom(slot);
        outputSequence();
    }else{
        DPOST("Transferring sequence %i from device", slot);
        // delay nodig misschien?
        requestSequence();
    }
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
    message.push_back(0xb0 | device_.channelOut_);
    message.push_back(0x20); // bank LSB
    message.push_back(bank + 0x40); // offset for shruthi sequence banks
    
    // Program Change
    message.push_back(0xc0 | device_.channelOut_);
    message.push_back(patch & 0x7f);
    
    device_.sendMessage( &message );
}




void VxShruthi::importEeprom(long inlet, t_symbol* filepath){
    try{
        hasEepromCache_ = false;
        std::ifstream fs(filepath->s_name, std::ios::in | std::ios::binary);
        fs.read((char*)eeprom_, kEepromSize);
        fs.close();
        hasEepromCache_ = true;
        listPatchNames();
        
        requestNumbers();
//        outputPatchData();
        outputSettingsData();
//        outputSequence();
//        outputSequencerSettings();
        // clear nrpn cache todo clean way
        device_.lastNrpnIndex = -1;
        
    }catch(std::exception e){
        
        error("Failed to read file %s", filepath->s_name);
        error("Eeprom cache disabled.");
    }
}

void VxShruthi::exportEeprom(long inlet, t_symbol* filepath){
    if(! hasEepromCache_){
        DPOST("No eeprom cache available, no export");
    }
    try{
        std::ofstream fs(filepath->s_name, std::ios::out | std::ios::binary);
        fs.write((const char*)eeprom_, kEepromSize);
        fs.close();
    }catch(std::exception e){
        error("Failed to write file %s", filepath->s_name);
    }
}




//void VxShruthi::importUserData(long inlet, t_symbol* filepath){
//    try{
//        std::ifstream fs(filepath->s_name, std::ios::in | std::ios::binary);
//        fs.read((char*)eeprom_+kInternalEepromSize, kEepromSize-kInternalEepromSize);
//        fs.close();
//        hasEepromCache_ = true;
//        listPatchNames();
//    }catch(std::exception e){
//        
//        error("Failed to read file %s", filepath->s_name);
//    }
//}
//
//void VxShruthi::exportUserData(long inlet, t_symbol* filepath){
//    try{
//        std::ofstream fs(filepath->s_name, std::ios::out | std::ios::binary);
//        fs.write((const char*)eeprom_+kInternalEepromSize, kEepromSize-kInternalEepromSize);
//        fs.close();
//    }catch(std::exception e){
//        error("Failed to write file %s", filepath->s_name);
//    }
//}

void VxShruthi::clearEepromCache(long inlet){
    // only clear the external part
    memset(eeprom_+kExternalEepromOffset, 0, kExternalEepromSize*sizeof(uint8_t)); // init to zero
    hasEepromCache_ = false;
}

void VxShruthi::copyPatchToClipboard(long inlet){
    std::memcpy(&copypatch_,
                &patch_,
                StorageConfiguration<Patch>::size);
}

void VxShruthi::pastePatchFromClipboard(long inlet){
    std::memcpy(&patch_,
                &copypatch_,
                StorageConfiguration<Patch>::size);
    transferPatch();
    outputPatchData();
}

void VxShruthi::copySequenceToClipboard(long inlet){
    std::memcpy(&copysequencer_.steps,
                &sequencer_.steps,
                StorageConfiguration<SequencerSettings>::size);
}

void VxShruthi::pasteSequenceFromClipboard(long inlet){
    std::memcpy(&sequencer_.steps,
                &copysequencer_.steps,
                StorageConfiguration<SequencerSettings>::size);
    transferSequence();
    outputSequence();
}

void VxShruthi::acceptSysexData(SysexCommand cmd, uint8_t arg, std::vector<uint8_t> &data) {
//    post("acceptSysexData");
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
                
//                outputCurrentNumbers();
                atom_setsym(atoms_, gensym("current"));
                atom_setlong(atoms_+1, current_patch_number_);
                atom_setlong(atoms_+2, current_sequence_number_);
                outlet_list(m_outlets[1], ps_empty, 3, atoms_);
            }
            break;
            
        case kPatch:  // Patch transfer
            success = patch_.CheckBuffer(sysex_rx_buffer_);
            if(success){
                DPOST("Patch data received");
                std::memcpy(&patch_,
                            sysex_rx_buffer_,
                            StorageConfiguration<Patch>::size);
                outputPatchData();
            }
            break;
            
        case kSequence:  // Sequence transfer
            success = 1;
            DPOST("Sequence data received");
            std::memcpy(sequencer_.saved_data(),
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
            sequencer_.steps[stepIndex].data_[0] = sysex_rx_buffer_[0];
            sequencer_.steps[stepIndex].data_[1] = sysex_rx_buffer_[1];
            DPOST("Sequencer step data received, index: %i", stepIndex);
        }
            success = 1;
            outputSequence();
            break;
        case kPatchName:
            std::memcpy(patch_.name,
                        sysex_rx_buffer_,
                        kPatchNameSize);
            success = 1;
            DPOST("Patch name received");
            break;
        case kSequencerState: // full sequencer state transfer
            success = 1;
            DPOST("Full sequencer state received");
            std::memcpy(&sequencer_,
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
//            post("cmd %d arg %d", cmd, arg);
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
//            success = 1;
            break;
            
            
        default:
            // do nothing
            DPOST("Ignored incoming sysex cmd %i", cmd);
            success = 1;
            break;
    }
  
    if(!success){
        error("Sysex transfer error cmd %x, arg %x, data length %i", cmd, arg, data.size());
    }
}

void VxShruthi::midiNrpnCallback(long nrpn_index, long v){
    
    // update internal eeprom
//    mapSequencerNrpnToEeprom(nrpn_index, v);
    
    // send out to patch
    outputNrpn(nrpn_index, v);
}



void VxShruthi::nrpn(long inlet, long nrpn_index, long v){
    // update internal eeprom
//    mapSequencerNrpnToEeprom(nrpn_index, v);
    
    // send to device
    device_.sendNrpn(nrpn_index, v);
}

void VxShruthi::mapSequencerNrpnToEeprom(long nrpn_index, long v){
    
    // these nrpn values are global and schould be mirrored in eeprom
    // when changes occur from patch or from device.
    switch(nrpn_index){
        case 100: sequencer_.seq_mode = v; break;
        case 101: sequencer_.seq_tempo = v; break;
        case 102: sequencer_.seq_groove_template = v; break;
        case 103: sequencer_.seq_groove_amount = v; break;
        case 104: sequencer_.arp_direction = v; break;
        case 105: sequencer_.arp_range = v; break;
        case 106: sequencer_.arp_pattern = v; break;
        case 107: sequencer_.arp_warp = v; break;
        case 108: sequencer_.pattern_size = v; break;
        case 109: sequencer_.pattern_rotation = v; break;
    }
}

// not used atm
void VxShruthi::mapNrpnToEeprom(long nrpn_index, long v){
    
    switch(nrpn_index){
        case 0: patch_.osc[0].shape = v; break;
        case 1: patch_.osc[0].parameter = v; break;
        case 2: patch_.osc[0].range = v; break;
        case 3: patch_.osc[0].option = v; break;
            
        case 4: patch_.osc[1].shape = v; break;
        case 5: patch_.osc[1].parameter = v; break;
        case 6: patch_.osc[1].range = v; break;
        case 7: patch_.osc[1].option = v; break;
            
        case 8: patch_.mix_balance = v; break;
        case 9: patch_.mix_sub_osc = v; break;
        case 10: patch_.mix_noise = v; break;
        case 11: patch_.mix_sub_osc_shape = v; break;
            
        case 12: patch_.filter_cutoff = v; break;
        case 13: patch_.filter_resonance = v; break;
        case 14: patch_.filter_env = v; break;
        case 15: patch_.filter_lfo = v; break;
            
        case 16: patch_.env[0].attack = v; break;
        case 17: patch_.env[0].decay = v; break;
        case 18: patch_.env[0].sustain = v; break;
        case 19: patch_.env[0].release = v; break;
            
        case 20: patch_.env[1].attack = v; break;
        case 21: patch_.env[1].decay = v; break;
        case 22: patch_.env[1].sustain = v; break;
        case 23: patch_.env[1].release = v; break;
            
        case 24: patch_.lfo[0].waveform = v; break;
        case 25: patch_.lfo[0].rate = v; break;
        case 26: patch_.lfo[0].attack = v; break;
        case 27: patch_.lfo[0].retrigger_mode = v; break;
            
        case 28: patch_.lfo[1].waveform = v; break;
        case 29: patch_.lfo[1].rate = v; break;
        case 30: patch_.lfo[1].attack = v; break;
        case 31: patch_.lfo[1].retrigger_mode = v; break;
            
        case 32: patch_.modulation_matrix.modulation[0].source = v; break;
        case 33: patch_.modulation_matrix.modulation[0].destination = v; break;
        case 34: patch_.modulation_matrix.modulation[0].amount = v; break;
        case 35: patch_.modulation_matrix.modulation[1].source = v; break;
        case 36: patch_.modulation_matrix.modulation[1].destination = v; break;
        case 37: patch_.modulation_matrix.modulation[1].amount = v; break;
        case 38: patch_.modulation_matrix.modulation[2].source = v; break;
        case 39: patch_.modulation_matrix.modulation[2].destination = v; break;
        case 40: patch_.modulation_matrix.modulation[2].amount = v; break;
        case 41: patch_.modulation_matrix.modulation[3].source = v; break;
        case 42: patch_.modulation_matrix.modulation[3].destination = v; break;
        case 43: patch_.modulation_matrix.modulation[3].amount = v; break;
        case 44: patch_.modulation_matrix.modulation[4].source = v; break;
        case 45: patch_.modulation_matrix.modulation[4].destination = v; break;
        case 46: patch_.modulation_matrix.modulation[4].amount = v; break;
        case 47: patch_.modulation_matrix.modulation[5].source = v; break;
        case 48: patch_.modulation_matrix.modulation[5].destination = v; break;
        case 49: patch_.modulation_matrix.modulation[5].amount = v; break;
        case 50: patch_.modulation_matrix.modulation[6].source = v; break;
        case 51: patch_.modulation_matrix.modulation[6].destination = v; break;
        case 52: patch_.modulation_matrix.modulation[6].amount = v; break;
        case 53: patch_.modulation_matrix.modulation[7].source = v; break;
        case 54: patch_.modulation_matrix.modulation[7].destination = v; break;
        case 55: patch_.modulation_matrix.modulation[7].amount = v; break;
        case 56: patch_.modulation_matrix.modulation[8].source = v; break;
        case 57: patch_.modulation_matrix.modulation[8].destination = v; break;
        case 58: patch_.modulation_matrix.modulation[8].amount = v; break;
        case 59: patch_.modulation_matrix.modulation[9].source = v; break;
        case 60: patch_.modulation_matrix.modulation[9].destination = v; break;
        case 61: patch_.modulation_matrix.modulation[9].amount = v; break;
        case 62: patch_.modulation_matrix.modulation[10].source = v; break;
        case 63: patch_.modulation_matrix.modulation[10].destination = v; break;
        case 64: patch_.modulation_matrix.modulation[10].amount = v; break;
        case 65: patch_.modulation_matrix.modulation[11].source = v; break;
        case 66: patch_.modulation_matrix.modulation[11].destination = v; break;
        case 67: patch_.modulation_matrix.modulation[11].amount = v; break;
            
        case 84: patch_.filter_cutoff_2 = v; break;
        case 85: patch_.filter_resonance_2 = v; break;
        case 92: patch_.filter_1_mode_ = v; break;
        case 93: patch_.filter_2_mode_ = v; break;
            
        case 94: patch_.ops_[0].operands[0] = v; break;
        case 95: patch_.ops_[0].operands[1] = v; break;
        case 96: patch_.ops_[0].op = v; break;
        case 97: patch_.ops_[1].operands[0] = v; break;
        case 98: patch_.ops_[1].operands[1] = v; break;
        case 99: patch_.ops_[1].op = v; break;
            
        case 100: sequencer_.seq_mode = v; break;
        case 101: sequencer_.seq_tempo = v; break;
        case 102: sequencer_.seq_groove_template = v; break;
        case 103: sequencer_.seq_groove_amount = v; break;
        case 104: sequencer_.arp_direction = v; break;
        case 105: sequencer_.arp_range = v; break;
        case 106: sequencer_.arp_pattern = v; break;
        case 107: sequencer_.arp_warp = v; break;
        default:
            object_error((t_object*)this, "Nrpn index %i is not valid", nrpn_index);
    }

}


// voor als er iets hangt
void VxShruthi::panic(long inlet){
    transfer_.stop();
    device_.unlock();
    
    // misschien nog een all notes off?
    
    // misschien nog een resetDevice functie met default system settings etc?
}

void VxShruthi::transferProgressReporter(bool isBusy, uint8_t progress){
//    atom_setlong(atoms_, finished?1:0);
//    atom_setlong(atoms_+1, progress);
//    outlet_list(m_outlets[1], ps_transfer, 2, atoms_);
    outputProgress(progress);
}

void VxShruthi::listPatchNames(long inlet){
    
    
    Patch *p;
    size_t numPatches;
    uint8_t *pmem;
    int patchNumber = 1; // starting at 1max
    
//    int count = 0;
//    t_atom* a = atoms_;
    
    
    //kMaxNumBanks * 128; f ix atoms_ size limted ot 128
    atom_setsym(atoms_, gensym("patchlist"));
    
    // 16 internal patches
    pmem = eeprom_ + 0x0010;
    numPatches = 16;
        
    for(size_t i=0; i<numPatches; ++i ){
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
    
    // external patches starting here
//    pmem = eeprom_+kInternalEepromSize;
    numPatches = 64;
    
    // for each bank
    for(int k=0; k<kMaxNumBanks; ++k){
    
        pmem = eeprom_ + kInternalEepromSize + (k * kBankSize);
        
        for(size_t i=0; i<numPatches; ++i ){
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
//    REGISTER_METHOD_SYMBOL(VxShruthi, importUserData);
//    REGISTER_METHOD_SYMBOL(VxShruthi, exportUserData);
    REGISTER_METHOD(VxShruthi, clearEepromCache);
    
//    REGISTER_METHOD(VxShruthi, testThreadStart);
//    REGISTER_METHOD(VxShruthi, stopTransfer);
    REGISTER_METHOD(VxShruthi, panic);
    
    REGISTER_METHOD_LONG(VxShruthi, enableEepromCache);
    
    REGISTER_METHOD(VxShruthi, listPatchNames);
    
    REGISTER_METHOD(VxShruthi, copyPatchToClipboard);
    REGISTER_METHOD(VxShruthi, pastePatchFromClipboard);
    REGISTER_METHOD(VxShruthi, copySequenceToClipboard);
    REGISTER_METHOD(VxShruthi, pasteSequenceFromClipboard);

    
    //    REGISTER_METHOD(VxShruthi, printMidiPorts);
    //    REGISTER_METHOD(VxShruthi, testMidiOut);
    
    #ifdef WIN_VERSION
        char user_name[UNLEN+1];
        DWORD user_name_size = sizeof(user_name);
        if (GetUserName(user_name, &user_name_size)){
            DPOST("Your user name is: %s", user_name);
        }else{
            error("Failed to lookup user name");
        }
        /* Handle error */
    #else // MAC_VERSION
                // the mac uses the standard gcc syntax, you should also set the -fvisibility=hidden flag to hide the non-marked symbols
        char* szUserName;
        szUserName = getenv("USER");
        DPOST("Your user name is: %s", szUserName);  
    #endif
}

