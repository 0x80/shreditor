#ifndef MutableSysex_shruthi_midi_h
#define MutableSysex_shruthi_midi_h



//#include "shruthi.types.h"

//#include <boost/tr1/functional.hpp>
//#include <functional>
#include "rtmidi/RtMidi.h"
#include "ext.h"

class RtMidiIn;
class RtMidiOut;

class SysexBulkTransfer;
// typedef std::tr1::function<void (SysexCommand cmd, uint8_t arg, std::vector<uint8_t> &data)> SysexCallback;
// typedef std::tr1::function<void (uint8_t index, uint8_t value)> NrpnCallback;
typedef void (*SysexCallback) (SysexCommand, uint8_t, std::vector<uint8_t>&);
typedef void (*NrpnCallback)(uint8_t, uint8_t);

class ShruthiMidi
{
public:
    ShruthiMidi();
    ~ShruthiMidi();
    
    void registerSysexCallback(SysexCallback fun);
    void registerNrpnCallback(NrpnCallback fun);
    
    void parseSysex(std::vector<uint8_t> *msg);
    
    int expectedSysexPayload(SysexCommand cmd);
    bool validateSysexChecksum(std::vector<uint8_t> *msg, uint8_t checksum);
    void sendSysex(uint8_t* data, uint8_t command, uint8_t argument, size_t size);
    void sendSysexSafe(uint8_t* data, uint8_t command, uint8_t argument, size_t size);
    void sendSysexCommand(uint8_t command, uint8_t argument=0);
    
    static void midiInputCallback( double deltatime, std::vector<uint8_t> *msg, void *userData);
    static void midiAuxCallback( double deltatime, std::vector<uint8_t> *msg, void *userData);
    static void midiVoidCallback( double deltatime, std::vector<uint8_t> *msg, void *userData);
    int findInputPortNumberForName(t_symbol* name);
    int findOutputPortNumberForName(t_symbol* name);
    void printMidiPorts(long inlet);
	void getMidiPortNames(std::vector<std::string> &inputs, std::vector<std::string> &outputs);
        
    // forward midi
    void sendMessage(std::vector<uint8_t> *msg);
    void sendNrpn(long nrpn_index, long nrpn_value);

    void testMidiOut();
    bool validateSysex(std::vector<uint8_t> *sysex);
        
    void setMidiIn(t_symbol* portName, long channel);
    void setMidiOut(t_symbol* portName, long channel);
    void setMidiAuxIn(t_symbol* portName, long channel);
    void setFilterMsb(bool v){ filterMsb_ = v; }
    
    void allocatePorts();
    
    uint8_t channelIn_;
    uint8_t channelOut_;
	uint8_t channelAuxIn_;
    
    long lastNrpnIndex_;
        
//    typedef std::tr1::function<void (SysexCommand cmd, uint8_t arg, std::vector<uint8_t> &data)> SysexCallbackFun;
//    void registerCallbacks(VxShruthi &ob);
    
private:
        
    RtMidiIn *midiInput_;
    RtMidiIn *midiAuxInput_;
    RtMidiOut *midiOutput_;
    
    void processControlChange(long cc_index, long cc_value);
    void processControlChangeAsNrpn();
    
    uint8_t nrpnMsb_;
    uint8_t nrpnLsb_;
    uint8_t dataMsb_;
    uint8_t dataLsb_;
    
    uint8_t lastDataMsb_;
    uint8_t runningStatus_;
    
    long indexLsb_;
    long indexMsb_;
    long valueLsb_;
    long valueMsb_;
    bool isNrpnValid_;
    
//    uint8_t midiMsgCounter_;
    bool useRunningStatus_;
    bool filterMsb_; // TODO fix
    
    SysexCallback sysexCallback_;
    NrpnCallback nrpnCallback_;
    
    //bool locked_; // when transferring eeprom lock all other io
	bool isInputValid_;
	bool isOutputValid_;
	bool isAuxInputValid_;
	t_symbol *portnameIn_;
	t_symbol *portnameAuxIn_;
	t_symbol *portnameOut_;


};

#endif