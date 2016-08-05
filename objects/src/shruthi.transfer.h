
#ifndef MutableSysex_shruthi_transfer_h
#define MutableSysex_shruthi_transfer_h

#include "ext.h"
#include "shruthi.types.h"

class ShruthiMidi;
class VxShruthi;

class SysexBulkTransfer {
public:
  SysexBulkTransfer(VxShruthi &maxob, ShruthiMidi &midi);

  ~SysexBulkTransfer();

  void transferEeprom(uint8_t *data, size_t size);
  void start();
  void stop();

  static void qfn(SysexBulkTransfer *x);
  static void memberproc(SysexBulkTransfer *x);

  void outputSysex(uint8_t *data, uint8_t command, uint8_t argument,
                   size_t size);
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

  t_systhread x_systhread;   // thread reference
  t_systhread_mutex x_mutex; // mutual exclusion lock for threadsafety
  int x_systhread_cancel;    // thread cancel flag
  void *x_qelem;             // for message passing between threads

private:
  VxShruthi &parent_;
  ShruthiMidi &midi_;
  uint8_t *midiBuffer_;
};

#endif
