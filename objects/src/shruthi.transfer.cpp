#include "shruthi.transfer.h"
#include "shruthi.midi.h"
#include "vx.shruthi.h"

SysexBulkTransfer::SysexBulkTransfer(VxShruthi &maxob, ShruthiMidi &midi)
    : parent_(maxob), midi_(midi), start_(0), message_id_(0x40), block_id_(0), delay_(100),
      data_(0), size_(0), dataposition_(0), isTransferBusy_(false) {
  x_systhread = NULL;
  x_systhread_cancel = false;
  systhread_mutex_new(&x_mutex, 0);
  x_qelem = qelem_new(this, (method)qfn);

  midiBuffer_ = new uint8_t[kSysExBulkDumpBlockSize];
}

SysexBulkTransfer::~SysexBulkTransfer() {
  // free our qelem
  if (x_qelem)
    qelem_free(x_qelem);

  // free out mutex
  if (x_mutex)
    systhread_mutex_free(x_mutex);
};

void SysexBulkTransfer::transferEeprom(uint8_t *data, size_t size) {
  stop(); // kill thread if, any

  data_ = data;
  size_ = size;

  x_systhread_cancel = false;

  // // create new thread + begin execution
  // if (x_systhread == NULL) {
  //   DPOST("starting a new thread");
  //   systhread_create((method)memberproc, this, 0, 0, 0, &x_systhread);
  // }
  start();
}


void SysexBulkTransfer::start() {
  stop(); // kill thread if, any
  // create new thread + begin execution
  if (x_systhread == NULL) {
    DPOST("starting a new thread");
    isTransferBusy_ = true;
    systhread_create((method)memberproc, this, 0, 0, 0, &x_systhread);
  }
}

void SysexBulkTransfer::stop() {
  unsigned int ret;

  if (x_systhread) {
    DPOST("stopping transfer thread");
    x_systhread_cancel = true;         // tell the thread to stop
    systhread_join(x_systhread, &ret); // wait for the thread to stop
    x_systhread = NULL;
    DPOST("thread stopped and returned %i", ret);
    x_systhread_cancel = false;
  }
}

// triggered by the helper thread
void SysexBulkTransfer::qfn(SysexBulkTransfer *x) {
  int block_counter, message_id;
  // uint8_t buf[kSysExBulkDumpBlockSize];

  uint8_t *dataposition, block_id;
  bool isTransferBusy;

  systhread_mutex_lock(x->x_mutex);
  block_counter = x->block_counter_;
  block_id = x->block_id_;
  // access shared data
  message_id = x->message_id_;
  dataposition = x->dataposition_;
  isTransferBusy = x->isTransferBusy_;

  // TODO this copy should probably happen in the memberproc function
  std::memcpy(x->midiBuffer_, x->dataposition_, kSysExBulkDumpBlockSize);

  systhread_mutex_unlock(x->x_mutex);

  DPOST("dataposition %x, messid %x, nblock %i, size %i", dataposition,
        message_id, block_counter, kSysExBulkDumpBlockSize);

  x->midi_.sendSysex(x->midiBuffer_, message_id, block_id, kSysExBulkDumpBlockSize);
  x->parent_.outputProgress(block_id);
}


void SysexBulkTransfer::memberproc(SysexBulkTransfer *x) {

  x->message_id_ = 0x40;
  uint16_t delay = 250; // 100;

  // TODO figure out how to skip system settings / internal eeprom
  x->block_id_ = 0; // skip first 16
  uint16_t pos = 0; // start at external eeprom

  x->block_counter_ = 0;
  // x->dataposition_ = x->data_;

  // skip internal eeprom
  for (; pos < x->size_; pos += kSysExBulkDumpBlockSize) {

    if (x->x_systhread_cancel)
      break;

    x->dataposition_ = x->data_ + pos;

    // output midi and progress in the queue thread
    qelem_set(x->x_qelem);

    // wait for object to output its stuff
    systhread_sleep(delay);

    // systhread_mutex_lock(x->x_mutex);


    // output block data as sysex
    // x->outputSysex(x->dataposition_, x->message_id_, x->block_id_,
    //                kSysExBulkDumpBlockSize);

    // is this possible directly or do we need to output this from the queue thread just like the progress
    // x->midi_.sendSysex(x->dataposition_, x->message_id_, x->block_id_,
    //                kSysExBulkDumpBlockSize);


    // continue with lock to update counters
    systhread_mutex_lock(x->x_mutex);

    x->block_id_++;
    x->block_counter_++;

    // every 128 blocks we increase the message id
    if (x->block_id_ == 128) {
      x->block_id_ = 0;
      x->message_id_ += 1;
    }

    systhread_mutex_unlock(x->x_mutex);
  }

  x->x_systhread_cancel = false; // reset cancel flag for next time, in case

  x->isTransferBusy_ = false;

  qelem_set(x->x_qelem); // nog 1x om finished door te geven.

  // the thread is created again
  systhread_exit(0); // this can return a value to systhread_join();
}

// void SysexBulkTransfer::outputSysex(uint8_t *data, uint8_t command,
//                                     uint8_t argument, size_t size) {
//   std::vector<unsigned char> msg;
//   uint8_t checksum = 0;

//   DPOST("outputSysex() size %i", size);

//   // header
//   msg.push_back(0xf0);
//   msg.push_back(0x00);
//   msg.push_back(0x20);
//   msg.push_back(0x77);
//   msg.push_back(0x00);
//   msg.push_back(0x02);

//   // cmd
//   msg.push_back(command);
//   msg.push_back(argument);

//   // payload
//   for (size_t i = 0; i < size; ++i) {
//     checksum += data[i];
//     msg.push_back(data[i] >> 4);
//     msg.push_back(data[i] & 0x0f);
//   }

//   // footer
//   msg.push_back(checksum >> 4);
//   msg.push_back(checksum & 0x0f);
//   msg.push_back(0xf7);

//   try {
//     outputMidi(msg);
//   } catch (RtError &err) {
//     error("Midi error: %s", err.what());
//   }
// }

// // TODO get rid of thread all together.
// void SysexBulkTransfer::outputMidi(std::vector<unsigned char> msg) {
//   parent_.

// }
