//  The MIT License
//
//  Copyright (c) 2013-2016 Thijs Koerselman, http://vauxlab.com
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#ifndef MutableSysex_shruthi_midi_h
#define MutableSysex_shruthi_midi_h

#ifdef _DEBUG
#define __RTMIDI_DEBUG__ 0
#else
#define __RTMIDI_DEBUG__ 0
#endif

#include "ext.h"
#include "maxcpp6.h"
#include "shruthi.types.h"

class VxShruthi;

struct TransferState {
  uint8_t messageId;
  uint8_t blockId;
  int blockCounter;
  size_t size;
  size_t dataPosition;
};

class ShruthiMidi {
public:
  ShruthiMidi(VxShruthi &x);
  ~ShruthiMidi();

  void parseSysex(const std::vector<uint8_t> &msg);
  void parseControlChange(long cc_index, long cc_value);

  int expectedSysexPayload(SysexCommand cmd);
  bool validateSysexChecksum(const std::vector<uint8_t> &msg, uint8_t checksum);
  void sendSysex(uint8_t *data, uint8_t command, uint8_t argument, size_t size);
  void sendSysexCommand(uint8_t command, uint8_t argument = 0);

  void sendSequenceProgramChange(long slot);
  void sendPatchProgramChange(long slot);

  

  void clearCache() { lastNrpnIndex_ = -1; }

  void sendMessage(const std::vector<uint8_t> &msg);
  void sendNrpn(long nrpn_index, long nrpn_value);

  void setOutputChannel(long v) {
    channelOut_ = CLAMP(v - 1, 0, 15); // 0 en 1 zijn beiden 1 op shruthi
    DPOST("Set output channel %d", v);
  }

  void testMidiOut();
  bool isValidSysex(const std::vector<uint8_t> &sysex);

  void setOutlets(void *midiOutlet) {
    midiOutlet_ = midiOutlet;
  }

  void startEepromTransfer(uint8_t *data, size_t size);
  void stopEepromTransfer();
  static void onTransferTick(ShruthiMidi *x);
  void initTransferState(size_t size);
  void incrementTransferState();

  void*         transferClock;
  TransferState transferState;
  bool          isTransferBusy;
  uint8_t*      transferEepromBuffer;
  
  t_atom atoms_[280]; // sysex dump blocksize is 128 = 256 atoms + sysex wrapper
  
private:
  void parseControlChangeAsNrpn();
  
  VxShruthi &maxobj_; // dirty hack

  
  uint8_t channelOut_;

  uint8_t nrpnMsb_;
  uint8_t nrpnLsb_;
  uint8_t dataMsb_;
  uint8_t dataLsb_;
  uint8_t lastDataMsb_;

  long lastNrpnIndex_;

  long indexLsb_;
  long indexMsb_;
  long valueLsb_;
  long valueMsb_;
  bool isNrpnValid_;

  void *midiOutlet_;
  
  
};

#endif
