#include "vx.shruthi.h"
#include "shruthi.midi.h"

#include <cstring>
#include <iostream>
#include <cstdlib>
#include <map>


ShruthiMidi::ShruthiMidi()
:   channelIn_(0),
    channelOut_(0),
    midiin(0),
    midiout(0),
    lastNrpnIndex(-1),
    last_data_msb(-1),
    running_status(0),
    index_lsb(0),
    index_msb(0),
    value_lsb(0),
    value_msb(0),
    valid(false),
    enable_running_status_(false),
    filterMsb_(true),
   // sysexCallback_(NULL),
    //nrpnCallback_(NULL),
    locked_(false)
{
    // Create an api map.
    std::map<int, std::string> apiMap;
    apiMap[RtMidi::MACOSX_CORE] = "OS-X CoreMidi";
    apiMap[RtMidi::WINDOWS_MM] = "Windows MultiMedia";
    apiMap[RtMidi::WINDOWS_KS] = "Windows Kernel Straming";
    apiMap[RtMidi::UNIX_JACK] = "Jack Client";
    apiMap[RtMidi::LINUX_ALSA] = "Linux ALSA";
    apiMap[RtMidi::RTMIDI_DUMMY] = "RtMidi Dummy";
    
    std::vector< RtMidi::Api > apis;
    RtMidi :: getCompiledApi( apis );
    
    DPOST("Compiled APIs:");
    for ( unsigned int i=0; i<apis.size(); i++ ){
        DPOST("%s", apiMap[ apis[i] ].c_str());
    }
    
    try {
        midiin = new RtMidiIn();
        DPOST("Current input API: %s", apiMap[ midiin->getCurrentApi() ].c_str());
        
        midiin->setCallback(&ShruthiMidi::midiInputCallback, this);
        
        midiout = new RtMidiOut();
        DPOST("Current output API: %s", apiMap[ midiout->getCurrentApi() ].c_str());
    }
    catch (RtError & err) {
        error("Failed to create midi ports: %s", err.getMessage().c_str());
    }
    
    
}

ShruthiMidi::~ShruthiMidi(){
    midiin->closePort();
    midiout->closePort();
    
    delete midiin;
    delete midiout;
}


void ShruthiMidi::registerSysexCallback(SysexCallback fun){
    sysexCallback_ = fun;
}

void ShruthiMidi::registerNrpnCallback(NrpnCallback fun){
    nrpnCallback_ = fun;
}


bool ShruthiMidi::validateSysexChecksum(std::vector<uint8_t> *msg, uint8_t checksum){
    size_t size = msg->size();
    uint8_t msb = msg->at(size-3);
    uint8_t lsb = msg->at(size-2);
    uint8_t target = (msb << 4) | lsb;
    return target == checksum;
}

void ShruthiMidi::testMidiOut(){
    if(locked_){
        DPOST("midi output locked for sysex transfer");
        return;
    }
    
    std::vector<uint8_t> message;
    
    // Control Change: 176, 7, 100 (volume)
    message.push_back(176 | channelOut_);
    message.push_back(7);
    message.push_back( 100 );
    midiout->sendMessage( &message );
    
    // Note On: 144, 64, 90
    message[0] = 144 | channelOut_;
    message[1] = 64;
    message[2] = 90;
    midiout->sendMessage( &message );
    
}

bool ShruthiMidi::validateSysex(std::vector<uint8_t> *sysex){
    // validate header
    return std::memcmp(sysex_rx_header, sysex, 6);
    
    // TODO validate checksum
}

void ShruthiMidi::parseSysex(std::vector<uint8_t> *msg){
    // header and checksum
    if(!validateSysex(msg)){
        DPOST("Ignored incoming sysex, n: %i", msg->size());
        return;
    }
    
    SysexCommand cmd = (SysexCommand)msg->at(6);
    uint8_t arg = msg->at(7);
    
    long payload = (msg->size() - 11) >> 1;
    long expected_payload = expectedSysexPayload(cmd);
    
    if(expected_payload < 0){
        DPOST("Sysex command is not implemented: %x", cmd);
        return;
    }
    
    if (payload != expected_payload){
        error("Expected sysex payload for cmd %x is %i, not: %i", cmd, expected_payload, payload);
        return;
    }
    
    std::vector<uint8_t>::const_iterator it = msg->begin() + 8; // first 8 bytes are not payload
    int counter = 0;
    std::vector<uint8_t> data;
    
    uint8_t msb, lsb, byte;
    uint8_t checksum = 0;
    
    for(; it != msg->end()-3; ++it){
        
        if (counter & 1) {
            lsb = *it & 0xf;
            byte = msb |= lsb;
            data.push_back(byte);
            checksum += byte;
        } else {
            msb = *it << 4;
        }
        ++counter;
    }
    
    if(!validateSysexChecksum(msg, checksum)){
        error("Checksum didn't match %#4x", checksum);
        return;
    }
    

    if(sysexCallback_){
        sysexCallback_(cmd, arg, data);
    }
}

void ShruthiMidi::setMidiIn(t_symbol* portName, long channel){
    midiin->closePort();
    midiin->openPort(findInputPortNumberForName(portName));
    
    midiin->ignoreTypes( false, true, true ); // Don't ignore sysex, but ignore timing and active sensing messages.
    channelIn_ = CLAMP(channel-1, 0, 0x0f); // channels start counting at 0 in midi bytes;
}

void ShruthiMidi::setMidiOut(t_symbol* portName, long channel){
    if(locked_){
        DPOST("midi output locked for sysex transfer");
        return;
    }
    midiout->closePort();
    midiout->openPort(findOutputPortNumberForName(portName));
    channelOut_ = CLAMP(channel-1, 0, 0x0f); // channels start counting at 0 in midi bytes;
}

void ShruthiMidi::sendMessage(std::vector<uint8_t> *msg){
    if(locked_){
        DPOST("midi output locked for sysex transfer");
        return;
    }
    midiout->sendMessage(msg);
}

void ShruthiMidi::lock(){
    locked_ = true;
}

void ShruthiMidi::unlock(){
    locked_ = false;
}

void ShruthiMidi::sendSysex(uint8_t* data, uint8_t command, uint8_t argument, size_t size){
    if(locked_){
        DPOST("midi output locked for sysex transfer");
        return;
    }
    
    sendSysexSafe(data, command, argument, size);
    
}
void ShruthiMidi::sendSysexSafe(uint8_t* data, uint8_t command, uint8_t argument, size_t size) {
    std::vector<unsigned char> msg;
    uint8_t checksum = 0;
    
    // header
    msg.push_back(0xf0);
    msg.push_back(0x00);
    msg.push_back(0x20);
    msg.push_back(0x77);
    msg.push_back(0x00);
    msg.push_back(0x02);
    
    // cmd
    msg.push_back(command);
    msg.push_back(argument);
    
    // payload
    for (size_t i = 0; i < size; ++i) {
        checksum += data[i];
        msg.push_back(data[i] >> 4);
        msg.push_back(data[i] & 0x0f);
    }
    
    // footer
    msg.push_back(checksum >> 4);
    msg.push_back(checksum & 0x0f);
    msg.push_back(0xf7);
    
    midiout->sendMessage(&msg);
}

void ShruthiMidi::sendSysexCommand(uint8_t command, uint8_t argument) {
    if(locked_){
        DPOST("midi output locked for sysex transfer");
        return;
    }
    std::vector<unsigned char> msg;
    
    // header
    msg.push_back(0xf0);
    msg.push_back(0x00);
    msg.push_back(0x20);
    msg.push_back(0x77);
    msg.push_back(0x00);
    msg.push_back(0x02);
    
    // cmd
    msg.push_back(command);
    msg.push_back(argument);
    
    // footer
    msg.push_back(0);
    msg.push_back(0);
    msg.push_back(0xf7);
    
    midiout->sendMessage(&msg);
}


int ShruthiMidi::expectedSysexPayload(SysexCommand cmd){
//    SysexCommand cmd = (SysexCommand) msg->at(6);
//    size_t size = (msg->size() - 11) >> 1; // sysex overhead is 11 bytes, bytes are transferred in nibblets

    switch (cmd) {
        case kNumbers:
            return sizeof(uint16_t) * 2 ;
            break;
            
        case kNumBanks:
            return 0;
            break;
            
        case kPatch:  // Patch transfer
//            post("expected size %i", StorageConfiguration<Patch>::size);
            return StorageConfiguration<Patch>::size;
            break;

        case kSequence:  // Sequence transfer
            return StorageConfiguration<SequencerSettings>::size;
            break;

        case kWavetable:  // Wavetable dump
            return kUserWavetableSize;
            break;

        case kSystemSettings:  // Settings transfer
            return SYSTEM_SETTINGS_SIZE;
            break;

        case kSequenceStep: // sequence step transfer
            return 2;
            break;

        case kPatchName:
            return kPatchNameSize;
            break;

        case kSequencerState: // Full sequencer state transfer
            return sizeof(SequencerSettings);
            break;
            
        case kRawDataDumpA:  // Bulk transfer
        case kRawDataDumpB:
        case kRawDataDumpC:
        case kRawDataDumpD:
            return kSysExBulkDumpBlockSize;
            break;
            
        default:
            return -1; // command not supported
            break;
    }
}




//bool ShruthiMidi::expectedSysexLength(SysexCommand cmd){
////    SysexCommand cmd = (SysexCommand) msg->at(6);
//    size_t size = (msg->size() - 11) >> 1; // sysex overhead is 11 bytes, bytes are transferred in nibblets
//    
//    switch (cmd) {
//        case kPatch:  // Patch transfer
////            post("expected size %i", StorageConfiguration<Patch>::size);
//            return size == StorageConfiguration<Patch>::size;
//            break;
//            
//        case kSequence:  // Sequence transfer
//            return size ==  StorageConfiguration<SequencerSettings>::size;
//            break;
//            
//        case kWavetable:  // Wavetable dump
//            return size == kUserWavetableSize;
//            break;
//            
//        case kSystemSettings:  // Settings transfer
//            return size == SYSTEM_SETTINGS_SIZE;
//            break;
//            
//        case kSequenceStep: // sequence step transfer
//            return size == 2;
//            break;
//            
//        case kPatchName:
//            return size == kPatchNameSize;
//            break;
//            
//        case kSequencerState: // Full sequencer state transfer
//            return size == sizeof(SequencerSettings);
//            break;
//            
//        case kRawDataDumpA:  // Bulk transfer
//        case kRawDataDumpB:
//        case kRawDataDumpC:
//        case kRawDataDumpD:
//            return size == kSysExBulkDumpBlockSize;
//            break;
//            
//        default:
//            return false;
//            break;
//    }
//}




void ShruthiMidi::processControlChange(long cc_index, long cc_value){

    switch(cc_index){
            // ******************** Parameter INDEX ************* //
        case CC_NRPN_MSB:
            // Save 7 high bits
            index_msb = cc_value << 7;
            valid = false;
            break;
        case CC_NRPN_LSB: // 98
            // Save 7 low bits
            index_lsb = cc_value;
            valid = true;
            break;
            // ******************** Parameter VALUE **************//
        case CC_DATA_MSB:
            // WARNING
            // Officially LSB is optional, but since Max provides us only separate messages and not a buffer
            // we have no way of knowing if LSB will be provided or not. Apart from buffering ourself but that
            // would impose a delay.

            value_msb = cc_value << 7;
            value_lsb = 0; // lsb is optional
            // sends value directy in case LSB is not used
            //                if(valid){ // only if value is
            //                    send_nrpn();
            //                }
            break;
        case CC_DATA_LSB:  // OPTIONAL
            value_lsb = cc_value;
            if(valid){
                processControlChangeAsNrpn();
            }
            break;
        default:
            // process cc as regular
            // TODO forward as cc to shruthi?
            
//              send_cc(cc_index, cc_value);// output cc to max patch to update parameters?
            break;
    }
}

void ShruthiMidi::processControlChangeAsNrpn(){
    if(value_msb && value_lsb > 63){
        // negative
        long v = value_lsb - 0x80;
//        outputNrpn(index_msb | index_lsb, v);
        if(nrpnCallback_){
//            post("nrpn_callback %x %x", index_msb | index_lsb, v);
            nrpnCallback_(index_msb | index_lsb, v);
        }

    }else{
        // range 0-127 or positive >127
        long v = value_msb | value_lsb;
//        outputNrpn(index_msb | index_lsb, v);
        if(nrpnCallback_){
//            post("nrpn_callback %x %x", index_msb | index_lsb, v);
            nrpnCallback_(index_msb | index_lsb, v);
        }
    }
}



void ShruthiMidi::midiInputCallback( double deltatime, std::vector<uint8_t> *msg, void *userData )
{
    
    
    ShruthiMidi &x = *(ShruthiMidi*)userData;
    //        post("Midi input msg count: %i, delta: %f", ++x.midiMsgCounter_, deltatime);
    
    if(x.locked_){
        DPOST("midi input locked for sysex transfer");
        return;
    }
    
    size_t nBytes = msg->size();
    
    if(!nBytes)
        return;
    
    uint8_t status = msg->at(0) & 0xf0;
    uint8_t channel = msg->at(0) & 0x0f;
    
    // skip parsing channel messages which are not on our channel
    if(status != STATUS_SYSEX && x.channelIn_ != channel){
        //            post("Ignored msg for channel %i", channel+1);
        return;
    }
    
    switch(status){
        case STATUS_SYSEX:
            DPOST("Sysex message received, n: %i", nBytes);
            x.parseSysex(msg);
            break;
        case STATUS_CC:
        {
            uint8_t index = msg->at(1);
            uint8_t value = msg->at(2);
            //                post("cc, chan: %i n: %i", channel, nBytes);
            //                post("index: %i v: %i", index, value);
            x.processControlChange(index, value);
        }
            break;
        default:
            DPOST("Ignored channel msg with status: %x", status);
            break;
    }
}


int ShruthiMidi::findInputPortNumberForName(t_symbol* name){
    t_symbol *portName;
    for (size_t i=0; i<midiin->getPortCount(); ++i){
        try {
            portName = gensym(midiin->getPortName(i).c_str());
            if(portName == name){
                DPOST("Port name %s, matched index %i", name->s_name, i);
                return i;
            }
        }
        catch ( RtError &err ) {
            error("%s", err.getMessage().c_str());
        }
    }
    
    error("%s is not a valid input port name", name->s_name);
    return 0;
}

int ShruthiMidi::findOutputPortNumberForName(t_symbol* name){
    t_symbol *portName;
    for (size_t i=0; i<midiout->getPortCount(); ++i){
        try {
            portName = gensym(midiout->getPortName(i).c_str());
            if(portName == name){
                DPOST("Port name %s, matched index %i", name->s_name, i);
                return i;
            }
        }
        catch ( RtError &err ) {
            error("%s", err.getMessage().c_str());
        }
    }
    
    error("%s is not a valid input port name", name->s_name);
    return 0;
}


void ShruthiMidi::printMidiPorts(long inlet){
    // Check inputs.
    unsigned int nPorts = midiin->getPortCount();
    DPOST("There are %i input ports available:", nPorts);
    std::string portName;
    for ( unsigned int i=0; i<nPorts; i++ ) {
        try {
            portName = midiin->getPortName(i);
            DPOST("input %i: %s", i+1, portName.c_str());
        }
        catch ( RtError &err ) {
            error("%s", err.getMessage().c_str());
        }
    }
    
    
    nPorts = midiout->getPortCount();
    DPOST("There are %i output ports available:", nPorts);
    for ( unsigned int i=0; i<nPorts; i++ ) {
        try {
            portName = midiout->getPortName(i);
            DPOST("output %i: %s", i+1, portName.c_str());
        }
        catch ( RtError &err ) {
            error("%s", err.getMessage().c_str());
        }
    }
}

void ShruthiMidi::sendNrpn(long nrpn_index, long nrpn_value) {
    
    if(locked_){
        DPOST("midi output locked for sysex transfer");
        return;
    }
    
    std::vector<uint8_t> msg;
    uint8_t status = STATUS_CC | channelOut_;
    if(!enable_running_status_ || status != running_status){
        msg.push_back(status);
        running_status = status;
    }
    
    data_msb = 0;
    data_lsb = 0;
    
    if(nrpn_value < 0){
        data_msb = 1; // msb is only ever 1 or 0 for shruthi
        int8_t sbyte = static_cast<int8_t>(nrpn_value);
        data_lsb = sbyte ^ 0x80; // twos complement using xor msb
    } else if(nrpn_value > 127){
        data_msb = 1;
        data_lsb = nrpn_value & 0x7f;
    }else{
        data_lsb = static_cast<uint8_t>(nrpn_value);
    }
    
    
    // only send out nrpn index if it differs from last
    if(lastNrpnIndex != nrpn_index){
        last_data_msb = -1; // sowieso invalid maken
        nrpn_msb = nrpn_index >> 7;
        nrpn_lsb = nrpn_index & 0x7f;
        
        if(!filterMsb_ || nrpn_msb){
            msg.push_back(CC_NRPN_MSB);
            msg.push_back(nrpn_msb);
        }
        
        msg.push_back(CC_NRPN_LSB);
        msg.push_back(nrpn_lsb);
        
        // remember to avoid redundant nrpn messages
        lastNrpnIndex = nrpn_index;
    }
    
    // filter redundant data msb.
    if(!filterMsb_ || data_msb != last_data_msb){
        msg.push_back(CC_DATA_MSB);
        msg.push_back(data_msb);
    }
    
    msg.push_back(CC_DATA_LSB);
    msg.push_back(data_lsb);
    
    midiout->sendMessage(&msg);
    
    // save data_msb for redundancy check
    last_data_msb = data_msb;
}



