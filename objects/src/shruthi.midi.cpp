#include "vx.shruthi.h"
#include "shruthi.midi.h"



#include <cstring>
#include <iostream>
#include <cstdlib>
#include <map>

static t_symbol *ps_invalid = gensym("invalid");

ShruthiMidi::ShruthiMidi()
:   channelIn_(0),
	channelAuxIn_(0),
    channelOut_(0),
    midiInput_(0),
    midiOutput_(0),
	midiAuxInput_(0),
    lastNrpnIndex_(-1),
    lastDataMsb_(-1),
    runningStatus_(0),
    indexLsb_(0),
    indexMsb_(0),
    valueLsb_(0),
    valueMsb_(0),
    isNrpnValid_(false),
    useRunningStatus_(false),
    filterMsb_(true),
	isInputValid_(false),
	isOutputValid_(false),
	isAuxInputValid_(false)
    //locked_(true) // gebruikt nu voor init als poorten nog niet aangemaakt zijn geen berichtjes sturen
{
    // Create an api map.
    std::map<int, std::string> apiMap;
    apiMap[RtMidi::MACOSX_CORE] = "OS-X CoreMidi";
    apiMap[RtMidi::WINDOWS_MM] = "Windows MultiMedia";
    apiMap[RtMidi::WINDOWS_KS] = "Windows Kernel Streaming";
    apiMap[RtMidi::UNIX_JACK] = "Jack Client";
    apiMap[RtMidi::LINUX_ALSA] = "Linux ALSA";
    apiMap[RtMidi::RTMIDI_DUMMY] = "RtMidi Dummy";
    
    std::vector< RtMidi::Api > apis;
    RtMidi :: getCompiledApi( apis );
    
    DPOST("Compiled APIs:");
    for ( unsigned int i=0; i<apis.size(); i++ ){
        DPOST("%s", apiMap[ apis[i] ].c_str());
    }
    
//    allocatePorts();
//
//    try {
//        midiInput_ = new RtMidiIn();
////        DPOST("Current input API: %s", apiMap[ midiInput_->getCurrentApi() ].c_str());
//        
//        midiInput_->setCallback(&ShruthiMidi::midiInputCallback, this);
//        
//        midiAuxInput_ = new RtMidiIn();
////        DPOST("Current aux API: %s", apiMap[ midiAuxInput_->getCurrentApi() ].c_str());
//        
//        midiAuxInput_->setCallback(&ShruthiMidi::midiAuxCallback, this);
//        
//        
//        midiOutput_ = new RtMidiOut();
////        DPOST("Current output API: %s", apiMap[ midiOutput_->getCurrentApi() ].c_str());
//    }
//    catch (RtError & err) {
//        error("Failed to create midi ports: %s", err.what());
//    }
//  
    
}

ShruthiMidi::~ShruthiMidi(){
    
  /*  try{
        for(int i=0; i< inputPorts_.size(); ++i){
            inputPorts_.at(i)->closePort();
            delete inputPorts_.at(i);
        }
    }catch(RtError err){
        error("Failed to clean up input ports, %s", err.what());
    }
    
    try{
        for(int i=0; i< outputPorts_.size(); ++i){
            outputPorts_.at(i)->closePort();
            delete outputPorts_.at(i);
        }
    }catch(RtError err){
        error("Failed to clean up output ports, %s", err.what());
    }*/
    
    try{
		if(midiInput_){
			midiInput_->closePort();
			delete midiInput_;
		}
		if(midiAuxInput_){
			midiAuxInput_->closePort();
			delete midiAuxInput_;
		}
        if(midiOutput_){
			midiOutput_->closePort();
			delete midiOutput_;
		}
        
    }catch(RtError err){
        error("Failed to clean up midi ports, %s", err.what());
    }
}

void ShruthiMidi::allocatePorts(){
    
    try {
        for (size_t i=0; i<midiOutput_->getPortCount(); ++i){
            
            
        }
    }
    catch ( RtError &err ) {
        error("%s", err.what());
    }
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
    if(!isOutputValid_){
        DPOST("midi output not valid");
        return;
    }
    
    std::vector<uint8_t> message;
    
    try{
        // Control Change: 176, 7, 100 (volume)
        message.push_back(176 | channelOut_);
        message.push_back(7);
        message.push_back( 100 );
        midiOutput_->sendMessage( &message );
        
        // Note On: 144, 64, 90
        message[0] = 144 | channelOut_;
        message[1] = 64;
        message[2] = 90;
        midiOutput_->sendMessage( &message );
    } catch ( RtError &err ) {
        error("%s", err.what());
    }
    
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

	channelIn_ = CLAMP(channel-1, 0, 0x0f);
	if(portName == portnameIn_)
		return; // same port, no realloc

	isInputValid_ = false;
	portnameIn_ = ps_invalid;

	try{
		// recreate needed for Windows because otherwise we don't get new ports after rescan
		if(midiInput_){
			midiInput_->closePort();
			delete midiInput_;
		}
		midiInput_ = new RtMidiIn();
		midiInput_->setCallback(&ShruthiMidi::midiInputCallback, this);

        int portindex = findInputPortNumberForName(portName);
        if(portindex == -1)
            return;

        midiInput_->openPort(portindex);
        midiInput_->ignoreTypes( false, true, true ); // Don't ignore sysex, but ignore timing and active sensing messages.
		portnameIn_ = portName;
        isInputValid_ = true;
	}catch(RtError &err){
		error("setMidiIn failed: %s", err.what());
	}
}

void ShruthiMidi::setMidiAuxIn(t_symbol* portName, long channel){

	channelAuxIn_ = CLAMP(channel-1, 0, 0x0f); // channels start counting at 0 in midi bytes;
	if(portName == portnameAuxIn_)
		return; // same port, no realloc

	isAuxInputValid_ = false;
	portnameAuxIn_ = ps_invalid;

	try{

		// recreate needed for Windows because otherwise we don't get new ports after rescan
		if(midiAuxInput_){
			midiAuxInput_->closePort();
			delete midiAuxInput_;
		}
		midiAuxInput_ = new RtMidiIn();
		midiAuxInput_->setCallback(&ShruthiMidi::midiAuxCallback, this);
        
        int portindex = findInputPortNumberForName(portName);
        if(portindex == -1)
            return;
        
        midiAuxInput_->openPort(portindex);
        midiAuxInput_->ignoreTypes( false, true, true ); // Don't ignore sysex, but ignore timing and active sensing messages.
        portnameAuxIn_ = portName;
        isAuxInputValid_ = true;
	}catch(std::exception& e){
		error("setMidiAuxIn failed: %s", e.what());
	}
}

void ShruthiMidi::setMidiOut(t_symbol* portName, long channel){

	channelOut_ = CLAMP(channel-1, 0, 0x0f);
	if(portName == portnameOut_)
		return; // same port, no realloc

	isOutputValid_ = false;
	portnameOut_ = ps_invalid;

	try{
		// recreate needed for Windows because otherwise we don't get new ports after rescan
        if(midiOutput_){
			midiOutput_->closePort();
			delete midiOutput_;
		}
		midiOutput_ = new RtMidiOut();

        int portindex = findOutputPortNumberForName(portName);
        if(portindex == -1)
            return;

        midiOutput_->openPort(portindex);  
		portnameOut_ = portName;
        isOutputValid_ = true;
	}catch(RtError &err){
		error("setMidiOut failed: %s", err.what());
	}
}

void ShruthiMidi::sendMessage(std::vector<uint8_t> *msg){
    if(!isOutputValid_){
        DPOST("midi output not valid");
        return;
    }
    
    try{
        midiOutput_->sendMessage(msg);
    }catch(RtError &err){
        error("Midi error: %s", err.what());
    }
}

void ShruthiMidi::sendSysex(uint8_t* data, uint8_t command, uint8_t argument, size_t size){
    if(!isOutputValid_){
        DPOST("midi output not valid");
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
    
    try{
        midiOutput_->sendMessage(&msg);
    }catch(RtError &err){
        error("Midi error: %s", err.what());
    }
}

void ShruthiMidi::sendSysexCommand(uint8_t command, uint8_t argument) {
    if(!isOutputValid_){
        DPOST("midi output not valid");
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
    try{
        midiOutput_->sendMessage(&msg);
    }catch(RtError &err){
        error("Midi error: %s", err.what());
    }
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
            indexMsb_ = cc_value << 7;
            isNrpnValid_ = false;
            break;
        case CC_NRPN_LSB: // 98
            // Save 7 low bits
            indexLsb_ = cc_value;
            isNrpnValid_ = true;
            break;
            // ******************** Parameter VALUE **************//
        case CC_DATA_MSB:
            // WARNING
            // Officially LSB is optional, but since Max provides us only separate messages and not a buffer
            // we have no way of knowing if LSB will be provided or not. Apart from buffering ourself but that
            // would impose a delay.

            valueMsb_ = cc_value << 7;
            valueLsb_ = 0; // lsb is optional
            // sends value directy in case LSB is not used
            //                if(isNrpnValid_){ // only if value is
            //                    send_nrpn();
            //                }
            break;
        case CC_DATA_LSB:  // OPTIONAL
            valueLsb_ = cc_value;
            if(isNrpnValid_){
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
    if(valueMsb_ && valueLsb_ > 63){
        // negative
        long v = valueLsb_ - 0x80;
//        outputNrpn(indexMsb_ | indexLsb_, v);
        if(nrpnCallback_){
//            post("nrpn_callback %x %x", indexMsb_ | indexLsb_, v);
            nrpnCallback_(indexMsb_ | indexLsb_, v);
        }

    }else{
        // range 0-127 or positive >127
        long v = valueMsb_ | valueLsb_;
//        outputNrpn(indexMsb_ | indexLsb_, v);
        if(nrpnCallback_){
//            post("nrpn_callback %x %x", indexMsb_ | indexLsb_, v);
            nrpnCallback_(indexMsb_ | indexLsb_, v);
        }
    }
}



void ShruthiMidi::midiInputCallback( double deltatime, std::vector<uint8_t> *msg, void *userData )
{
    //DPOST("midi input callback");
    
    ShruthiMidi &x = *(ShruthiMidi*)userData;
    //        post("Midi input msg count: %i, delta: %f", ++x.midiMsgCounter_, deltatime);
    
    size_t nBytes = msg->size();
    
    if(!nBytes)
        return;
    
    uint8_t status = msg->at(0) & 0xf0;
    uint8_t channel = msg->at(0) & 0x0f;
    
    // skip parsing channel messages which are not on our channel
    if(status != STATUS_SYSEX && x.channelIn_ != channel){
        DPOST("Ignored msg for channel %i", channel+1);
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
            //               post("cc, chan: %i n: %i", channel, nBytes);
                            DPOST("index: %i v: %i", index, value);
            x.processControlChange(index, value);
        }
            break;
        default:
            DPOST("Ignored channel msg with status: %x", status);
            break;
    }
}


void ShruthiMidi::midiAuxCallback( double deltatime, std::vector<uint8_t> *msg, void *userData )
{
    //DPOST("midi aux callback");
    
    ShruthiMidi &x = *(ShruthiMidi*)userData;
    //        post("Midi input msg count: %i, delta: %f", ++x.midiMsgCounter_, deltatime);
    
    size_t nBytes = msg->size();
    
    if(!nBytes)
        return;
    
    uint8_t status = msg->at(0) & 0xf0;
    uint8_t channel = msg->at(0) & 0x0f;
    
    if(status == STATUS_SYSEX){
        DPOST("Sysex ignored on aux input");
        return;
    }
    
    // skip parsing channel messages which are not on our channel
    if(status != STATUS_SYSEX && x.channelAuxIn_ != channel){
        DPOST("Ignored msg for channel %i", channel+1);
        return;
    }
    
    // forward data to output
    x.sendMessage(msg);
}

void ShruthiMidi::midiVoidCallback( double deltatime, std::vector<uint8_t> *msg, void *userData )
{
    DPOST("midi void callback");
}

int ShruthiMidi::findInputPortNumberForName(t_symbol* name){
    t_symbol *portName;
    
    try {
        for (size_t i=0; i<midiInput_->getPortCount(); ++i){
        
			#ifdef WIN_VERSION
			std::string str =  midiInput_->getPortName(i);
			std::string fixedname = str.substr(0, str.length()-2);
			portName = gensym(fixedname.c_str());
			#else
			portName = gensym(midiInput_->getPortName(i).c_str());
			#endif
            
			DPOST("match input port %s", portName->s_name);
            if(portName == name){
                DPOST("Port name %s, matched index %i", name->s_name, i);
                return i;
            }
        }
    }
    catch ( RtError &err ) {
        error("%s", err.what());
    }
    
    error("%s is not a isNrpnValid_ input port name", name->s_name);
    return -1;
}

int ShruthiMidi::findOutputPortNumberForName(t_symbol* name){
    t_symbol *portName;
    try {
        for (size_t i=0; i<midiOutput_->getPortCount(); ++i){
        
            portName = gensym(midiOutput_->getPortName(i).c_str());
			DPOST("match output port %s", portName->s_name);
            if(portName == name){
                DPOST("Port name %s, matched index %i", name->s_name, i);
                return i;
            }
        }
    }
    catch ( RtError &err ) {
        error("%s", err.what());
    }
    
    error("%s is not a valid output port name", name->s_name);
    return -1;
}

void ShruthiMidi::getMidiPortNames(std::vector<std::string> &inputs, std::vector<std::string> &outputs){

	RtMidiIn *in = 0;
	RtMidiOut *out = 0;

	try{
		inputs.clear();
		outputs.clear();

		in = new RtMidiIn();
		out = new RtMidiOut();

		// Check inputs.
		unsigned int nPorts = in->getPortCount();
		std::string portName;
		for ( unsigned int i=0; i<nPorts; i++ ) {
			#ifdef WIN_VERSION
			std::string str =  in->getPortName(i);
			portName = str.substr(0, str.length()-2);
			#else
			portName = in->getPortName(i);
			#endif
			inputs.push_back(portName);
		}
    
		nPorts = out->getPortCount();
		for ( unsigned int i=0; i<nPorts; i++ ) {
			outputs.push_back(out->getPortName(i));
		}

	}catch(RtError &err){
		error("Getting midi port names: %s", err.what());
	}

	if(in) delete in;
	if(out) delete out;
}

void ShruthiMidi::printMidiPorts(long inlet){
    // Check inputs.
    unsigned int nPorts = midiInput_->getPortCount();
    DPOST("There are %i input ports available:", nPorts);
    std::string portName;
    for ( unsigned int i=0; i<nPorts; i++ ) {
        try {
            portName = midiInput_->getPortName(i);
            DPOST("input %i: %s", i+1, portName.c_str());
        }
        catch ( RtError &err ) {
            error("%s", err.what());
        }
    }
    
    nPorts = midiOutput_->getPortCount();
    DPOST("There are %i output ports available:", nPorts);
    for ( unsigned int i=0; i<nPorts; i++ ) {
        try {
            portName = midiOutput_->getPortName(i);
            DPOST("output %i: %s", i+1, portName.c_str());
        }
        catch ( RtError &err ) {
            error("%s", err.what());
        }
    }
}

void ShruthiMidi::sendNrpn(long nrpn_index, long nrpn_value) {
    
    std::vector<uint8_t> msg;

    uint8_t status = STATUS_CC | channelOut_;
    if(!useRunningStatus_ || status != runningStatus_){
        msg.push_back(status);
        runningStatus_ = status;
    }
    
    dataMsb_ = 0;
    dataLsb_ = 0;
    
    if(nrpn_value < 0){
        dataMsb_ = 1; // msb is only ever 1 or 0 for shruthi
        int8_t sbyte = static_cast<int8_t>(nrpn_value);
        dataLsb_ = sbyte ^ 0x80; // twos complement using xor msb
    } else if(nrpn_value > 127){
        dataMsb_ = 1;
        dataLsb_ = nrpn_value & 0x7f;
    }else{
        dataLsb_ = static_cast<uint8_t>(nrpn_value);
    }
    
    try{
        
    
        // only send out nrpn index if it differs from last
        if(lastNrpnIndex_ != nrpn_index){
            lastDataMsb_ = -1; // sowieso invalid maken
            nrpnMsb_ = nrpn_index >> 7;
            nrpnLsb_ = nrpn_index & 0x7f;
            
            if(!filterMsb_ || nrpnMsb_){
                msg.push_back(CC_NRPN_MSB);
                msg.push_back(nrpnMsb_);
                midiOutput_->sendMessage(&msg);
                msg.clear();
            }
            
            msg.push_back(CC_NRPN_LSB);
            msg.push_back(nrpnLsb_);
            midiOutput_->sendMessage(&msg);
            msg.clear();
            
            // remember to avoid redundant nrpn messages
            lastNrpnIndex_ = nrpn_index;
        }
        
        // filter redundant data msb.
        if(!filterMsb_ || dataMsb_ != lastDataMsb_){
            msg.push_back(CC_DATA_MSB);
            msg.push_back(dataMsb_);
            midiOutput_->sendMessage(&msg);
            msg.clear();
        }
        
        msg.push_back(CC_DATA_LSB);
        msg.push_back(dataLsb_);
        
        midiOutput_->sendMessage(&msg);
        // save dataMsb_ for redundancy check
        lastDataMsb_ = dataMsb_;
        
    }catch ( RtError &err ) {
        error("%s", err.what());
    }
}



