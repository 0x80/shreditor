//#include "maxcpp6.h"

#include "vx.shruthi.h"

#include <cstring>
#include <iostream>
#include <cstdlib>
#include <map>
#include <fstream>

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
static t_symbol *ps_name = gensym("name");
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
static t_symbol *ps_size = gensym("size");
static t_symbol *ps_progress = gensym("progress");
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
    
    device_.registerSysexCallback(std::tr1::bind(&VxShruthi::acceptSysexData, this, _1, _2, _3));
    device_.registerNrpnCallback(std::tr1::bind(&VxShruthi::outputNrpn, this, _1, _2));
    
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

void VxShruthi::outputProgress(long v){
    atom_setsym(atoms_, ps_progress);
    atom_setlong(atoms_+1, v);
    outlet_list(m_outlet[1], ps_empty, 2, atoms_);
}

void VxShruthi::outputPatchData(){    
    // Convert name directly to symbol. Both should be char
    atom_setsym(atoms_, ps_name);
    atom_setsym(atoms_+1, gensym((char*)patch_.name));
    outlet_list(m_outlet[1], ps_empty, 2, atoms_);
    
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

void VxShruthi::outputAllSequencerData(){
    outputNrpn(100, sequencer_.seq_mode);
    outputNrpn(101, sequencer_.seq_tempo);
    outputNrpn(102, sequencer_.seq_groove_template);
    outputNrpn(103, sequencer_.seq_groove_amount);
    outputNrpn(104, sequencer_.arp_direction);
    outputNrpn(105, sequencer_.arp_range);
    outputNrpn(106, sequencer_.arp_pattern);
    outputNrpn(107, sequencer_.arp_warp);
    
    outputSequence();
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
    
//    t_symbol *fb;
    
//    switch(settings_->expansion_filter_board){
//        case FILTER_BOARD_LPF:
//            fb = ps_lpf;
//            break;
//        case FILTER_BOARD_SSM:
//            fb = ps_ssm;
//            break;
//        case FILTER_BOARD_SVF:
//            fb = ps_svf;
//            break;
//        case FILTER_BOARD_DSP:
//            fb = ps_dsp;
//            break;
//        case FILTER_BOARD_PVK:
//            fb = ps_pvk;
//            break;
//        case FILTER_BOARD_4PM:
//            fb = ps_4pm;
//            break;
//        case FILTER_BOARD_DLY:
//            fb = ps_dly;
//            break;
//        default:
//            fb = ps_unknown;
//    };
//    
//    atom_setsym(atoms_, ps_settings);
//    atom_setsym(atoms_+1, ps_filter);
//    atom_setsym(atoms_+2, fb);
//    outlet_list(m_outlet[1], ps_empty, 3, atoms_);
    
    atom_setsym(atoms_, ps_settings);
    atom_setsym(atoms_+1, gensym("octave"));
    atom_setlong(atoms_+2, settings_->octave);
    outlet_list(m_outlet[1], ps_empty, 3, atoms_);
    
    atom_setsym(atoms_, ps_settings);
    atom_setsym(atoms_+1, gensym("raga"));
    atom_setlong(atoms_+2, settings_->raga);
    outlet_list(m_outlet[1], ps_empty, 3, atoms_);
    
    atom_setsym(atoms_, ps_settings);
    atom_setsym(atoms_+1, gensym("portamento"));
    atom_setlong(atoms_+2, settings_->portamento);
    outlet_list(m_outlet[1], ps_empty, 3, atoms_);
    
    atom_setsym(atoms_, ps_settings);
    atom_setsym(atoms_+1, gensym("legato"));
    atom_setlong(atoms_+2, settings_->legato);
    outlet_list(m_outlet[1], ps_empty, 3, atoms_);
    
    atom_setsym(atoms_, ps_settings);
    atom_setsym(atoms_+1, gensym("tuning"));
    atom_setlong(atoms_+2, settings_->master_tuning);
    outlet_list(m_outlet[1], ps_empty, 3, atoms_);
    
    atom_setsym(atoms_, ps_settings);
    atom_setsym(atoms_+1, gensym("channel"));
    atom_setlong(atoms_+2, settings_->midi_channel);
    outlet_list(m_outlet[1], ps_empty, 3, atoms_);
    
    atom_setsym(atoms_, ps_settings);
    atom_setsym(atoms_+1, gensym("midimode"));
    atom_setlong(atoms_+2, settings_->midi_out_mode);
    outlet_list(m_outlet[1], ps_empty, 3, atoms_);

    atom_setsym(atoms_, ps_settings);
    atom_setsym(atoms_+1, gensym("split"));
    atom_setlong(atoms_+2, settings_->midi_split_point);
    outlet_list(m_outlet[1], ps_empty, 3, atoms_);

    atom_setsym(atoms_, ps_settings);
    atom_setsym(atoms_+1, gensym("filter"));
    atom_setlong(atoms_+2, settings_->expansion_filter_board);
    outlet_list(m_outlet[1], ps_empty, 3, atoms_);

    atom_setsym(atoms_, ps_settings);
    atom_setsym(atoms_+1, gensym("cvmode"));
    atom_setlong(atoms_+2, settings_->expansion_cv_mode);
    outlet_list(m_outlet[1], ps_empty, 3, atoms_);
}

void VxShruthi::outputNrpn(long index, long value){
    atom_setlong(atoms_, index);
    atom_setlong(atoms_+1, value);
    outlet_list(m_outlet[0],  ps_nrpn, 2, atoms_);
}

void VxShruthi::outputSequence(){
    atom_setsym(atoms_, ps_sequence);
    t_atom *data = atoms_+2;
    
    // note
    atom_setsym(atoms_+1, ps_note);
    for(int i=0; i<kNumSteps; ++i)
        atom_setlong(data+i, sequencer_.steps[i].getNoteValue()); // only first 7 bits
    outlet_list(m_outlet[1], ps_empty, kNumSteps+2, atoms_);
    
    // velocity
    atom_setsym(atoms_+1, ps_velocity);
    for(int i=0; i<kNumSteps; ++i)
        atom_setlong(data+i, sequencer_.steps[i].getVelocityValue() * VELOCITY_SCALE_UP);
    outlet_list(m_outlet[1], ps_empty, kNumSteps+2, atoms_);

    // ctrl
    atom_setsym(atoms_+1, ps_ctrl);
    for(int i=0; i<kNumSteps; ++i)
        atom_setlong(data+i, sequencer_.steps[i].getControllerValue());
    outlet_list(m_outlet[1], ps_empty, kNumSteps+2, atoms_);
    
    // gate
    atom_setsym(atoms_+1, ps_gate);
    for(int i=0; i<kNumSteps; ++i)
        atom_setlong(data+i, sequencer_.steps[i].getGateValue());
    outlet_list(m_outlet[1], ps_empty, kNumSteps+2, atoms_);
    
    // legato
    atom_setsym(atoms_+1, ps_legato);
    for(int i=0; i<kNumSteps; ++i)
        atom_setlong(data+i, sequencer_.steps[i].getLegatoValue());
    outlet_list(m_outlet[1], ps_empty, kNumSteps+2, atoms_);
    
    // rotation
    atom_setsym(atoms_+1, ps_rotation);
    atom_setlong(atoms_+2, sequencer_.pattern_rotation);
    outlet_list(m_outlet[1], ps_empty, 3, atoms_);
    
    // size
    atom_setsym(atoms_+1, ps_size);
    atom_setlong(atoms_+2, sequencer_.pattern_size);
    outlet_list(m_outlet[1], ps_empty, 3, atoms_);
    
    
    // gate legato matrix
//        int counter = 0;
    atom_setsym(atoms_, ps_liveGrid);

    for(int i=0; i<16; ++i){
        atom_setlong(atoms_+1, i+1);
        atom_setlong(atoms_+2, 1);
        atom_setlong(atoms_+3, sequencer_.steps[i].getLegatoValue());
        outlet_list(m_outlet[1], ps_empty, 4, atoms_);
    }
    
    for(int i=0; i<16; ++i){
        atom_setlong(atoms_+1, i+1);
        atom_setlong(atoms_+2, 2);
        atom_setlong(atoms_+3, sequencer_.steps[i].getGateValue());
        outlet_list(m_outlet[1], ps_empty, 4, atoms_);
    }
    
//        outlet_list(m_outlet[1], ps_empty, 1+counter*3, atoms_);
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
    uint8_t v = CLIP(length, 1, 16);
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
    useEepromCache_ = true;
}
// send out complete eeprom to midi
void VxShruthi::transferRom(long inlet) {
    
    transfer_.transferEeprom(eeprom_, addressable_space_size());
    useEepromCache_ = true;
}

// requests
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
    
    atom_setsym(atoms_, ps_name);
    atom_setsym(atoms_+1, gensym((char*)patch_.name));
    outlet_list(m_outlet[1], ps_empty, 2, atoms_);
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
    outputSettingsData();
}

void VxShruthi::setSettingsOctave(long inlet, long v){    
    settings_->octave = CLIP(v, -2, 2);
    transferSystemSettings();
    outputSettingsData();
}

void VxShruthi::setSettingsRaga(long inlet, long v){
    settings_->raga = CLIP(v, 0, 31);
    transferSystemSettings();
    outputSettingsData();
}

void VxShruthi::setSettingsPortamento(long inlet, long v){
    settings_->portamento = CLIP(v, 0, 63);
    transferSystemSettings();
    outputSettingsData();
}

void VxShruthi::setSettingsLegato(long inlet, long v){
    settings_->legato = v > 0 ? 1 : 0;
    transferSystemSettings();
    outputSettingsData();
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
        post("updating sequence on device");
        x->transferSequence();
        x->outputSequence();
        x->sequence_dirty_ = false;
    }
    clock_fdelay(x->m_clock, SEQUENCE_UPDATE_INTERVAL_MS);
}

void VxShruthi::storePatch(long inlet, long slot){
    requestPatchWrite(slot);
    storePatchToEeprom(slot);
//    sendPatchProgramChange(slot);
}

void VxShruthi::storeSequence(long inlet, long slot){
    requestSequenceWrite(slot);
//    sendSequenceProgramChange(slot);
    storeSequenceToEeprom(slot);
}

void VxShruthi::storePatchToEeprom(long slot){
    post("Store patch %i to eeprom cache", slot);
    uint8_t *address = getAddress<Patch>(slot);
    std::memcpy(address,
                &patch_,
                StorageConfiguration<Patch>::size);
}

void VxShruthi::loadPatchFromEeprom(long slot){
    post("Fetch patch %i from eeprom cache", slot);
    uint8_t *address = getAddress<Patch>(slot);
    std::memcpy(&patch_,
                address,
                StorageConfiguration<Patch>::size);
}
void VxShruthi::storeSequenceToEeprom(long slot){
    post("Store sequence %i to eeprom", slot);
    uint8_t *address = getAddress<SequencerSettings>(slot);
    std::memcpy(address,
                &sequencer_,
                StorageConfiguration<SequencerSettings>::size);
}

void VxShruthi::loadSequenceFromEeprom(long slot){
    post("Fetch sequence %i from eeprom", slot);
    uint8_t *address = getAddress<SequencerSettings>(slot);
    std::memcpy(&sequencer_,
                address,
                StorageConfiguration<SequencerSettings>::size);
}

void VxShruthi::loadPatch(long inlet, long slot){
    
    sendPatchProgramChange(slot);
    
    if(useEepromCache_ && hasEepromCache_ && slot > 15){
        loadPatchFromEeprom(slot);
        outputPatchData();
    }else{
        post("Request patch %i from device", slot);
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
    
    if(useEepromCache_ && hasEepromCache_ && slot > 15){
        loadSequenceFromEeprom(slot);
        outputSequence();
    }else{
        post("Request sequence %i from device", slot);
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
        std::ifstream fs(filepath->s_name, std::ios::in | std::ios::binary);
        fs.read((char*)eeprom_, kEepromSize);
        fs.close();
        hasEepromCache_ = true;
        listPatchNames();
    }catch(std::exception e){
        
        error("failed to read file %s", filepath->s_name);
    }
}

void VxShruthi::exportEeprom(long inlet, t_symbol* filepath){
    try{
        std::ofstream fs(filepath->s_name, std::ios::out | std::ios::binary);
        fs.write((const char*)eeprom_, kEepromSize);
        fs.close();
    }catch(std::exception e){
        error("failed to write file %s", filepath->s_name);
    }
}

void VxShruthi::importUserData(long inlet, t_symbol* filepath){
    try{
        std::ifstream fs(filepath->s_name, std::ios::in | std::ios::binary);
        fs.read((char*)eeprom_+kInternalEepromSize, kEepromSize-kInternalEepromSize);
        fs.close();
        hasEepromCache_ = true;
        listPatchNames();
    }catch(std::exception e){
        
        error("failed to read file %s", filepath->s_name);
    }
}

void VxShruthi::exportUserData(long inlet, t_symbol* filepath){
    try{
        std::ofstream fs(filepath->s_name, std::ios::out | std::ios::binary);
        fs.write((const char*)eeprom_+kInternalEepromSize, kEepromSize-kInternalEepromSize);
        fs.close();
    }catch(std::exception e){
        error("failed to write file %s", filepath->s_name);
    }
}

void VxShruthi::clearEepromCache(long inlet){
    // only clear the external part
    memset(eeprom_+kExternalEepromOffset, 0, kExternalEepromSize*sizeof(uint8_t)); // init to zero
    hasEepromCache_ = false;
}


void VxShruthi::acceptSysexData(SysexCommand cmd, uint8_t arg, std::vector<uint8_t> &data) {
    uint8_t success = 0;
    uint8_t *sysex_rx_buffer_ = &data[0];
    switch (cmd) {
        case kPatch:  // Patch transfer
            success = patch_.CheckBuffer(sysex_rx_buffer_);
            if(success){
                post("Patch data received");
                std::memcpy(&patch_,
                            sysex_rx_buffer_,
                            StorageConfiguration<Patch>::size);
                outputPatchData();
            }
            break;
            
        case kSequence:  // Sequence transfer
            success = 1;
            post("Sequence data received");
            std::memcpy(sequencer_.saved_data(),
                        sysex_rx_buffer_,
                        StorageConfiguration<SequencerSettings>::size);
            outputSequence();
            break;
            
        case kWavetable: // wavetable transfer
            // streams directly to destination so no copying
            success = 1;
            post("Wavetable data received");
            break;
            
        case kSystemSettings: // Settings transfer
            std::memcpy(settings_,
                        sysex_rx_buffer_,
                        SYSTEM_SETTINGS_SIZE);
            success = 1;
            post("Settings data received");
            outputSettingsData();
            break;
            
        case kSequenceStep:
        {
            uint8_t stepIndex = arg & 0x0f;
            sequencer_.steps[stepIndex].data_[0] = sysex_rx_buffer_[0];
            sequencer_.steps[stepIndex].data_[1] = sysex_rx_buffer_[1];
            post("Sequencer step data received, index: %i", stepIndex);
        }
            success = 1;
            outputSequence();
            break;
        case kPatchName:
            std::memcpy(patch_.name,
                        sysex_rx_buffer_,
                        kPatchNameSize);
            success = 1;
            post("Patch name received");
            break;
        case kSequencerState: // full sequencer state transfer
            success = 1;
            post("Full sequencer state received");
            std::memcpy(&sequencer_,
                        sysex_rx_buffer_,
                        sizeof(SequencerSettings));
            outputAllSequencerData();
            break;
            
        case kRawDataDumpA:  // Raw data dump
        case kRawDataDumpB:
        case kRawDataDumpC:
        case kRawDataDumpD:
        {
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
            break;
    }
    //        sysex_rx_state_ = success ? RECEPTION_OK : RECEPTION_ERROR;
    if(!success){
        error("Sysex transfer error cmd %x, arg %x, data length %i", cmd, arg, data.size());
    }
}


void VxShruthi::nrpn(long inlet, long nrpn_index, long nrpn_value){
    device_.sendNrpn(nrpn_index, nrpn_value);
}


// voor als er iets hangt
void VxShruthi::panic(long inlet){
    transfer_.stop();
    device_.unlock();
    
    // misschien nog een all notes off?
    
    // misschien nog een resetDevice functie met default system settings etc?
}

void VxShruthi::listPatchNames(long inlet){
    
    
    Patch *p;
    size_t numPatches;
    uint8_t *pmem;
//    int count = 0;
//    t_atom* a = atoms_;
    
    
    //kMaxNumBanks * 128; fix atoms_ size limted ot 128
    atom_setsym(atoms_, gensym("patchlist"));
    
    // 16 internal patches
    pmem = eeprom_ + 0x0010;
    numPatches = 16;
        
    for(size_t i=0; i<numPatches; ++i ){
        p = reinterpret_cast<Patch *>(pmem + i*PATCH_SIZE);
        atom_setlong(atoms_+1, i+1);
        
        if(p->exclamation_mark_ != '!'){
//            break; // not valid patch data
            atom_setsym(atoms_+2, gensym("_"));
        } else {
            atom_setsym(atoms_+2, gensym((char*)p->name));
        }
        outlet_list(m_outlet[1], ps_empty, 3, atoms_);
        ++p;
    }
    
    // 64 external patches
    pmem = eeprom_+kInternalEepromSize;
    numPatches = 64;
    
    for(size_t i=0; i<numPatches; ++i ){
        p = reinterpret_cast<Patch *>(pmem + i*PATCH_SIZE);
        atom_setlong(atoms_+1, i+17);
        
        if(p->exclamation_mark_ != '!'){
            //            break; // not valid patch data
            atom_setsym(atoms_+2, gensym("_"));
        } else {
            atom_setsym(atoms_+2, gensym((char*)p->name));
        }
        outlet_list(m_outlet[1], ps_empty, 3, atoms_);
        ++p;
    }
    
    
    

}

extern "C" int main(void) {
	// create a class with the given name:
	VxShruthi::makeMaxClass("vx.shruthi");
    
    REGISTER_METHOD_LONG2(VxShruthi, setSequenceNote);
    REGISTER_METHOD_LONG2(VxShruthi, setSequenceGate);
    REGISTER_METHOD_LONG2(VxShruthi, setSequenceVelocity);
    REGISTER_METHOD_LONG2(VxShruthi, setSequenceController);
    REGISTER_METHOD_LONG2(VxShruthi, setSequenceLegato);
    
    REGISTER_METHOD_SYMBOL(VxShruthi, setPatchName);
    
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
    REGISTER_METHOD_SYMBOL(VxShruthi, importUserData);
    REGISTER_METHOD_SYMBOL(VxShruthi, exportUserData);
    REGISTER_METHOD(VxShruthi, clearEepromCache);
    
//    REGISTER_METHOD(VxShruthi, testThreadStart);
//    REGISTER_METHOD(VxShruthi, stopTransfer);
    REGISTER_METHOD(VxShruthi, panic);
    
    REGISTER_METHOD_LONG(VxShruthi, enableEepromCache);
    
    REGISTER_METHOD(VxShruthi, listPatchNames);
    //    REGISTER_METHOD(VxShruthi, printMidiPorts);
    //    REGISTER_METHOD(VxShruthi, testMidiOut);
}

