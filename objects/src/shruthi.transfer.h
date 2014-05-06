
#ifndef MutableSysex_shruthi_transfer_h
#define MutableSysex_shruthi_transfer_h

#include "shruthi.types.h"
#include "ext.h"
class ShruthiMidi;

typedef void (*ProgressCallback)(bool, int);

class SysexBulkTransfer
{
public:
    SysexBulkTransfer(ShruthiMidi &device);
       
    ~SysexBulkTransfer();
        
    void transferEeprom(uint8_t *data, size_t size);
    void start();
    void stop();
// triggered by the helper thread
    static void qfn(SysexBulkTransfer *x);
    static void memberproc(SysexBulkTransfer *x);
    
    // een callback voor het teruggeven van progress of finished
    void registerProgressCallback(ProgressCallback fun){
        progressReporter_ = fun;
    }
    
    //private:
    
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
    
    t_systhread         x_systhread;                            // thread reference
	t_systhread_mutex	x_mutex;                                // mutual exclusion lock for threadsafety
	int                 x_systhread_cancel;                     // thread cancel flag
	void				*x_qelem;                               // for message passing between threads
//	void				*x_outlet;                              // our outlet
//	int                 x_foo;                                  // simple data to pass between threads
//	int                 x_sleeptime;                            // how many milliseconds to sleep
    
    ShruthiMidi &device_;
    ProgressCallback progressReporter_;
    
};


    

#endif