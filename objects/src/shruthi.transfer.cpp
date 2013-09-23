

#include "shruthi.transfer.h"
#include "shruthi.midi.h"

SysexBulkTransfer::SysexBulkTransfer(ShruthiMidi &device) :
    start_(0),
    message_id_(0x40),
    block_id_(0),
    delay_(100),
    data_(0),
    size_(0),
    dataposition_(0),
    isTransferBusy_(false),
    device_(device)
    
{
    x_systhread = NULL;
    x_systhread_cancel = false;
    systhread_mutex_new(&x_mutex,0);
    x_qelem = qelem_new(this,(method)qfn);
//    x_foo = 0;
//    x_sleeptime = 1000;
}

SysexBulkTransfer::~SysexBulkTransfer(){
    // free our qelem
    if (x_qelem)
        qelem_free(x_qelem);
    
    // free out mutex
    if (x_mutex)
        systhread_mutex_free(x_mutex);
};

void SysexBulkTransfer::transferEeprom(uint8_t *data, size_t size){
    stop();								// kill thread if, any
    
    // init variables
    
    data_ = data;
    size_ = size;
    
    x_systhread_cancel = false;
        
    // create new thread + begin execution
    if (x_systhread == NULL) {
        post("starting a new thread");
        systhread_create((method) memberproc, this, 0, 0, 0, &x_systhread);
    }
}

void SysexBulkTransfer::start(){
    stop();								// kill thread if, any
    // create new thread + begin execution
    if (x_systhread == NULL) {
        post("starting a new thread");
        isTransferBusy_ = true;
        systhread_create((method) memberproc, this, 0, 0, 0, &x_systhread);
    }
}

void SysexBulkTransfer::stop(){
    unsigned int ret;
    
    if (x_systhread) {
        post("stopping transfer thread");
        x_systhread_cancel = true;                                              // tell the thread to stop
        systhread_join(x_systhread, &ret);                                      // wait for the thread to stop
        x_systhread = NULL;
        post("thread stopped and returned %i", ret);
        x_systhread_cancel = false;
        device_.unlock();

    }
}

// triggered by the helper thread
void SysexBulkTransfer::qfn(SysexBulkTransfer *x)
{
    int block_counter, message_id;
    uint8_t *dataposition, block_id;
    bool isTransferBusy;
    
    systhread_mutex_lock(x->x_mutex);
    block_counter = x->block_counter_;
    block_id = x->block_id_;
    // access shared data
    message_id = x->message_id_;
    dataposition = x->dataposition_;
    isTransferBusy = x->isTransferBusy_;
    systhread_mutex_unlock(x->x_mutex);
    
    // *never* wrap outlet calls with systhread_mutex_lock()
    //        outlet_int(x->x_outlet, myfoo);
//    post("transfer block %i", block);
    post("dataposition %x, messid %x, nblock %i, size %i", dataposition, message_id, block_counter, kSysExBulkDumpBlockSize);
    
    if(x->progressReporter_){
        x->progressReporter_(isTransferBusy, block_id);
    }
}


// TODO figure out how to skip system settings / internal eeprom
void SysexBulkTransfer::memberproc(SysexBulkTransfer *x)
{
//    start_ = 0;
    
    // refactor naar local vars
    x->message_id_ = 0x40;
    uint16_t delay = 250;//100;
    
    /// first is system settings 
 //   x->block_id_ = 16; // skip first 16
 //   uint16_t pos = kInternalEepromSize; // start at external eeprom
   
    
    x->block_id_ = 0; // skip first 16
    uint16_t pos = 0; // start at external eeprom
    
    x->block_counter_ = 0;
    x->dataposition_ = 0;

    //!!! Is dit wel nodig, sysex zijn blocks met header en footer
//    x->device_.lock();
    
//    for (uint16_t start = 0; start < x->size_; start += kSysExBulkDumpBlockSize) {
    
    // skip internal eeprom
    for (; pos < x->size_; pos += kSysExBulkDumpBlockSize) {
        
        if (x->x_systhread_cancel)
            break;
        
        
        systhread_mutex_lock(x->x_mutex);
        
//        if (start < kInternalEepromSize) {
////            delay = 500;
//            
//            delay = 0;
//            
//            // skip internal eeprom entirely
//
//        } else {
//            delay = 100;
        
            
            // First between 0x00 and 0x10 are system settings!!
            //        if(start < 0x10){
            // output block data as sysex
            x->device_.sendSysexSafe(x->data_ + pos, x->message_id_, x->block_id_ , kSysExBulkDumpBlockSize);
            
            
//        }
        
        x->dataposition_ = x->data_ + pos;
        x->block_id_++;
        x->block_counter_++;

        // elke 128 blocks gaan we een message id omhoog
        if (x->block_id_ == 128) {
            x->block_id_ = 0;
            x->message_id_ += 1;
        }
        
        systhread_mutex_unlock(x->x_mutex);
        
        qelem_set(x->x_qelem);
        
        // TODO use clock wacht even om de boel te laten
        systhread_sleep(delay);
    }
    
    x->x_systhread_cancel = false;                                                 // reset cancel flag for next time, in case
    
    x->device_.unlock();
    
    x->isTransferBusy_ = false;
    
    qelem_set(x->x_qelem); // nog 1x om finished door te geven.
    
    // the thread is created again
    systhread_exit(0);															// this can return a value to systhread_join();
}

