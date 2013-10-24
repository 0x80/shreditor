#include "maxcpp6.h"
#include "RtMidi.h"

#include <cstring>
#include <iostream>
#include <cstdlib>
#include <map>


#if defined(__WINDOWS_MM__)
#include <windows.h>
#define SLEEP( milliseconds ) Sleep( (DWORD) milliseconds )
#else // Unix variants
#include <unistd.h>
#define SLEEP( milliseconds ) usleep( (unsigned long) (milliseconds * 1000.0) )
#endif

#define STATUS_NOTE_ON 0x90
#define STATUS_NOTE_OFF 0x80
#define STATUS_MONO_PRESSURE 0xd0
#define STATUS_POLY_PRESSURE 0xa0
#define STATUS_PROGRAM_CHANGE 0xc0
#define STATUS_PITCH_BEND 0xe0
#define STATUS_CC 0xb0
#define STATUS_SYSEX 0xf0

class RtMidiMax : public MaxCpp6<RtMidiMax> {
public:
	RtMidiMax(t_symbol * sym, long ac, t_atom * av) :
    channelIn_(0),
    channelOut_(0)
    {
		setupIO(2, 2); // inlets / outlets
        
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
        
        post("Compiled APIs:");
        for ( unsigned int i=0; i<apis.size(); i++ ){
            post("%s", apiMap[ apis[i] ].c_str());
        }
        
        try {
            midiin = new RtMidiIn();
            post("Current input API: %s", apiMap[ midiin->getCurrentApi() ].c_str());
            
            midiin->setCallback(&RtMidiMax::midiInputCallback, this);
            
            midiout = new RtMidiOut();
            post("Current output API: %s", apiMap[ midiout->getCurrentApi() ].c_str());
        }
        catch (RtError & err) {
            error("Failed to create midi ports: %s", err.getMessage().c_str());
        }
        
    
	}
	~RtMidiMax() {
        midiin->closePort();
        midiout->closePort();
        
        delete midiin;
        delete midiout;
    }
    
    static void midiInputCallback( double deltatime, std::vector<uint8_t> *msg, void *userData )
    {
        
        RtMidiMax &x = *(RtMidiMax*)userData;
        //        post("Midi input msg count: %i, delta: %f", ++x.midiMsgCounter_, deltatime);
        
        if(x.locked_){
            post("midi input locked for sysex transfer");
            return;
        }
        
        size_t nBytes = msg->size();
        
        if(!nBytes)
            return;
        
        uint8_t status = msg->at(0) & 0xf0;
        uint8_t channel = msg->at(0) & 0x0f;
        
        // skip parsing channel messages which are not on our channel
        if(status != STATUS_SYSEX && x.channelIn_ != channel){
            post("Ignored msg for channel %i", channel+1);
            return;
        }
        
        switch(status){
            case STATUS_SYSEX:
                post("Sysex message received, n: %i", nBytes);
//                x.parseSysex(msg);
                break;
            case STATUS_CC:
            {
                uint8_t index = msg->at(1);
                uint8_t value = msg->at(2);
                               post("cc, chan: %i n: %i", channel, nBytes);
                               post("index: %i v: %i", index, value);
//                x.processControlChange(index, value);
            }
                break;
            default:
                post("Ignored channel msg with status: %x", status);
                break;
        }
    }
	
	// methods:
	void bang(long inlet) {
        sendMidi();
		outlet_bang(m_outlets[0]);
	}
	void testfloat(long inlet, double v) { 
		outlet_float(m_outlets[0], v);
	}
	void testint(long inlet, long v) {
        v = CLAMP(v, 0, 127);
		outlet_int(m_outlets[0], v);
	}
	void test(long inlet, t_symbol * s, long ac, t_atom * av) { 
		outlet_anything(m_outlets[1], gensym("test"), ac, av); 
	}
    
    void sendMidi(){
        if(locked_){
            post("output locked");
            return;
        }
        
//        RtMidiOut *midiout = 0;
        std::vector<unsigned char> message;
//
//        // RtMidiOut constructor
//        try {
//            midiout = new RtMidiOut();
//        }
//        catch ( RtError &error ) {
//            error.printMessage();
//            exit( EXIT_FAILURE );
//        }
//        
//        // Call function to select port.
//        try {
////            if ( chooseMidiPort( midiout ) == false ) goto cleanup;
//            midiout->openPort( 0 );
//        }
//        catch ( RtError &err ) {
////            error.printMessage();
//            error("%s", err.getMessage().c_str());
//            goto cleanup;
//        }
        
        
        // Program change: 192, 5
        message.push_back( 192 );
        message.push_back( 5 );
        midiout->sendMessage( &message );
        
//        SLEEP( 500 );
        
        message[0] = 0xF1;
        message[1] = 60;
        midiout->sendMessage( &message );
        
        // Control Change: 176, 7, 100 (volume)
        message[0] = 176;
        message[1] = 7;
        message.push_back( 100 );
        midiout->sendMessage( &message );
        
        // Note On: 144, 64, 90
        message[0] = 144;
        message[1] = 64;
        message[2] = 90;
        midiout->sendMessage( &message );
        
//        SLEEP( 500 );
        
        // Note Off: 128, 64, 40
        message[0] = 128;
        message[1] = 64;
        message[2] = 40;
        midiout->sendMessage( &message );
        
//        SLEEP( 500 );
        
        // Control Change: 176, 7, 40
        message[0] = 176;
        message[1] = 7;
        message[2] = 40;
        midiout->sendMessage( &message );
        
//        SLEEP( 500 );
        
        // Sysex: 240, 67, 4, 3, 2, 247
        message[0] = 240;
        message[1] = 67;
        message[2] = 4;
        message.push_back( 3 );
        message.push_back( 2 );
        message.push_back( 247 );
        midiout->sendMessage( &message );
        
        // Clean up
//    cleanup:
//        delete midiout;
        
//        return 0;
        
    }
    
    void setMidiIn(long inlet, t_symbol* portName, long channel){
        locked_ = true;
        try{
            midiin->closePort();
            int portindex = findInputPortNumberForName(portName);
            if(portindex == -1)
                return;
            
            midiin->openPort();
            midiin->ignoreTypes( false, true, true ); // Don't ignore sysex, but ignore timing and active sensing messages.
            channelIn_ = CLAMP(channel-1, 0, 0x0f); // channels start counting at 0 in midi bytes;
            locked_ = false;
        }catch(std::exception& e){
            error("setMidiIn failed: %s", e.what());
        }
    }
    
    void setMidiOut(long inlet, t_symbol* portName, long channel){
        locked_ = true;
        
        try{
            midiout->closePort();
            int portindex = findOutputPortNumberForName(portName);
            if(portindex == -1)
                return;
            
            midiout->openPort(portindex);
            channel = CLAMP(channel-1, 0, 0x0f); // channels start counting at 0 in midi bytes;
            //DPOST("output midi channel %i", channel);
            channelOut_ = channel;
            locked_ = false;
        }catch(std::exception& e){
            error("setMidiOut failed: %s", e.what());
        }
    }
    
    int findInputPortNumberForName(t_symbol* name){
        t_symbol *portName;
        for (size_t i=0; i<midiin->getPortCount(); ++i){
            try {
                portName = gensym(midiin->getPortName(i).c_str());
                if(portName == name){
                    post("Port name %s, matched index %i", name->s_name, i);
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
    
    int findOutputPortNumberForName(t_symbol* name){
        t_symbol *portName;
        for (size_t i=0; i<midiout->getPortCount(); ++i){
            try {
                portName = gensym(midiout->getPortName(i).c_str());
                if(portName == name){
                    post("Port name %s, matched index %i", name->s_name, i);
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
    
    
    int channelIn_;
    int channelOut_;
    
//private:
    RtMidiIn *midiin;
    RtMidiOut *midiout;
    bool locked_;

};



C74_EXPORT extern "C" int main(void) {
	// create a class with the given name:
	RtMidiMax::makeMaxClass("rtmidi");
	REGISTER_METHOD(RtMidiMax, bang);
	REGISTER_METHOD_FLOAT(RtMidiMax, testfloat);
	REGISTER_METHOD_LONG(RtMidiMax, testint);
	REGISTER_METHOD_GIMME(RtMidiMax, test);
    REGISTER_METHOD_SYMBOL_LONG(RtMidiMax, setMidiIn);
    REGISTER_METHOD_SYMBOL_LONG(RtMidiMax, setMidiOut);
}