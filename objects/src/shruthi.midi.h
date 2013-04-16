#ifndef MutableSysex_shruthi_midi_h
#define MutableSysex_shruthi_midi_h

#include "shruthi.types.h"
#include "rtmidi/RtMidi.h"
//#include <boost/tr1/functional.hpp>
#include <functional>


class SysexBulkTransfer;
// typedef std::tr1::function<void (SysexCommand cmd, uint8_t arg, std::vector<uint8_t> &data)> SysexCallback;
// typedef std::tr1::function<void (uint8_t index, uint8_t value)> NrpnCallback;
typedef std::function<void (SysexCommand, uint8_t, std::vector<uint8_t>&)> SysexCallback;
typedef std::function<void (uint8_t, uint8_t)> NrpnCallback;

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
    int findInputPortNumberForName(t_symbol* name);
    int findOutputPortNumberForName(t_symbol* name);
    void printMidiPorts(long inlet);
        
    // forward midi
    void sendMessage(std::vector<uint8_t> *msg);
    void sendNrpn(long nrpn_index, long nrpn_value);

    void testMidiOut();
    bool validateSysex(std::vector<uint8_t> *sysex);
        
    void setMidiIn(t_symbol* portName, long channel);
    void setMidiOut(t_symbol* portName, long channel);
    void setFilterMsb(bool v){ filterMsb_ = v; }
    
    uint8_t channelIn_;
    uint8_t channelOut_;
    
    void lock();
    void unlock();
        
//    typedef std::tr1::function<void (SysexCommand cmd, uint8_t arg, std::vector<uint8_t> &data)> SysexCallbackFun;
//    void registerCallbacks(VxShruthi &ob);
    
private:
        
    RtMidiIn *midiin;
    RtMidiOut *midiout;
    
    void processControlChange(long cc_index, long cc_value);
    void processControlChangeAsNrpn();
        
    long lastNrpnIndex;
    
    uint8_t nrpn_msb;
    uint8_t nrpn_lsb;
    uint8_t data_msb;
    uint8_t data_lsb;
    
    uint8_t last_data_msb;
    uint8_t running_status;
    
    long index_lsb;
    long index_msb;
    long value_lsb;
    long value_msb;
    bool valid;
    
//    uint8_t midiMsgCounter_;
    bool enable_running_status_;
    bool filterMsb_; // TODO fix
    
    SysexCallback sysexCallback_;
    NrpnCallback nrpnCallback_;
    
    bool locked_; // when transferring eeprom lock all other io

};

#endif