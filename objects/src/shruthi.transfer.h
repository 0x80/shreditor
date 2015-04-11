
#ifndef MutableSysex_shruthi_transfer_h
#define MutableSysex_shruthi_transfer_h

#include "shruthi.types.h"
#include "ext.h"
class ShruthiMidi;
class VxShruthi;

//typedef void (*ProgressCallback)(VxShruthi*, bool, uint8_t);

class SysexBulkTransfer
{
public:
    SysexBulkTransfer(VxShruthi &x);
       
    ~SysexBulkTransfer();
        
    void transferEeprom(uint8_t *data, size_t size);
    void start();
    void stop();
// triggered by the helper thread
    static void qfn(SysexBulkTransfer *x);
    static void memberproc(SysexBulkTransfer *x);
    
    // een callback voor het teruggeven van progress of finished
//    void registerProgressCallback(ProgressCallback fun, VxShruthi* x){
//        x_ = x;
//        progressReporter_ = fun;
//    }
    
    //private:
    void outputSysex(uint8_t* data, uint8_t command, uint8_t argument, size_t size);
    void outputMidi(std::vector<unsigned char> msg);
    
    uint16_t start_;
    uint8_t message_id_;
    uint8_t block_id_;
    int block_counter_;
    uint16_t delay_;
    
    uint8_t *data_;
    size_t size_;
    uint8_t *dataposition_;
    bool isTransferBusy_;
    
    void *transferclock_;
    
//    void *msgOut_;
//    void *midiOut_;
    
    t_systhread         x_systhread;                            // thread reference
	t_systhread_mutex	x_mutex;                                // mutual exclusion lock for threadsafety
	int                 x_systhread_cancel;                     // thread cancel flag
	void				*x_qelem;                               // for message passing between threads
//	void				*x_outlet;                              // our outlet
//	int                 x_foo;                                  // simple data to pass between threads
//	int                 x_sleeptime;                            // how many milliseconds to sleep
    
//    ShruthiMidi &midi_;
//    ProgressCallback progressReporter_;
    
private:
    VxShruthi &parent_;
    
};


    

#endif