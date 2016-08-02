#include "shruthi.midi.h"
#include "vx.shruthi.h"

#include <cstdlib>
#include <cstring>
#include <iostream>
#include <map>

class VxShruthi;
static t_symbol *ps_invalid = gensym("invalid");
static t_symbol *ps_empty = gensym("");

ShruthiMidi::ShruthiMidi(VxShruthi &x)
    : x_(x),
      transfer_(x),
      channelOut_(0),
      lastDataMsb_(-1),
      lastNrpnIndex_(-1),
      indexLsb_(0),
      indexMsb_(0),
      valueLsb_(0),
      valueMsb_(0),
      isNrpnValid_(false) {
  // Create an api map.
  std::map<int, std::string> apiMap;
  apiMap[RtMidi::MACOSX_CORE] = "OS-X CoreMidi";
  apiMap[RtMidi::WINDOWS_MM] = "Windows MultiMedia";
  apiMap[RtMidi::WINDOWS_KS] = "Windows Kernel Streaming";
  apiMap[RtMidi::UNIX_JACK] = "Jack Client";
  apiMap[RtMidi::LINUX_ALSA] = "Linux ALSA";
  apiMap[RtMidi::RTMIDI_DUMMY] = "RtMidi Dummy";

  std::vector<RtMidi::Api> apis;
  RtMidi::getCompiledApi(apis);

  DPOST("Compiled APIs:");
  for (unsigned int i = 0; i < apis.size(); i++) {
    DPOST("%s", apiMap[apis[i]].c_str());
  }
}

ShruthiMidi::~ShruthiMidi() {
  try {
    if (midiInput_) {
      midiInput_->closePort();
      delete midiInput_;
    }
    if (midiAuxInput_) {
      midiAuxInput_->closePort();
      delete midiAuxInput_;
    }
    if (midiOutput_) {
      midiOutput_->closePort();
      delete midiOutput_;
    }

  } catch (RtError err) {
    error("Failed to clean up midi ports, %s", err.what());
  }
}

bool ShruthiMidi::validateSysexChecksum(const std::vector<uint8_t> &msg,
                                        uint8_t checksum) {
  size_t size = msg.size();
  uint8_t msb = msg.at(size - 3);
  uint8_t lsb = msg.at(size - 2);
  uint8_t target = (msb << 4) | lsb;
  return target == checksum;
}

void ShruthiMidi::testMidiOut() {
  std::vector<uint8_t> msg;

  try {
    // Control Change: 176, 7, 100 (volume)
    msg.push_back(176 | channelOut_);
    msg.push_back(7);
    msg.push_back(100);
    sendMessage(msg);

    // Note On: 144, 64, 90
    msg[0] = 144 | channelOut_;
    msg[1] = 64;
    msg[2] = 90;
    sendMessage(msg);
  } catch (RtError &err) {
    error("%s", err.what());
  }
}

bool ShruthiMidi::isValidSysex(const std::vector<uint8_t> &msg) {
  if (msg.size() < 11) {  // sysex zonder payload is 11 bytes
    error("Received invalid sysex message, length %i", msg.size());
    return false;
  }

  // validate header
  return (std::memcmp(&sysex_rx_header, &msg[0], 6) == 0);

  // TODO validate checksum
}

void ShruthiMidi::parseSysex(const std::vector<uint8_t> &msg) {
  // header and checksum
  if (!isValidSysex(msg)) {
    DPOST("Failed to identify as valid MI sysex, n: %i", msg.size());
    return;
  }

  SysexCommand cmd = (SysexCommand)msg.at(6);
  uint8_t arg = msg.at(7);

  long payload = (msg.size() - 11) >> 1;
  long expected_payload = expectedSysexPayload(cmd);

  if (expected_payload < 0) {
    DPOST("Sysex command is not implemented: %x", cmd);
    return;
  }

  if (payload != expected_payload) {
    error("Expected sysex payload for cmd %x is %i, not: %i", cmd,
          expected_payload, payload);
    return;
  }

  std::vector<uint8_t>::const_iterator it =
      msg.begin() + 8;  // first 8 bytes are not payload
  int counter = 0;
  std::vector<uint8_t> data;

  uint8_t msb, lsb, byte;
  uint8_t checksum = 0;

  for (; it != msg.end() - 3; ++it) {
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

  if (!validateSysexChecksum(msg, checksum)) {
    error("Checksum didn't match %#4x", checksum);

    return;
  }

  x_.processSysexInput(cmd, arg, data);
}

void ShruthiMidi::sendMessage(const std::vector<uint8_t> &msg) {
  std::vector<uint8_t>::const_iterator it;
  t_atom *a = atoms_;

  for (it = msg.begin(); it != msg.end(); ++it) {
    atom_setlong(a++, *it);
  }

  outlet_list(midiOutlet_, ps_empty, msg.size(), atoms_);
}

void ShruthiMidi::sendSysex(uint8_t *data, uint8_t command, uint8_t argument,
                            size_t size) {
  std::vector<uint8_t> msg;
  uint8_t checksum = 0;

  // header
  msg.push_back(sysex_rx_header[0]);
  msg.push_back(sysex_rx_header[1]);
  msg.push_back(sysex_rx_header[2]);
  msg.push_back(sysex_rx_header[3]);
  msg.push_back(sysex_rx_header[4]);
  msg.push_back(sysex_rx_header[5]);

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

  sendMessage(msg);
}

void ShruthiMidi::sendSysexCommand(uint8_t command, uint8_t argument) {
  std::vector<uint8_t> msg;

  // header
  msg.push_back(sysex_rx_header[0]);
  msg.push_back(sysex_rx_header[1]);
  msg.push_back(sysex_rx_header[2]);
  msg.push_back(sysex_rx_header[3]);
  msg.push_back(sysex_rx_header[4]);
  msg.push_back(sysex_rx_header[5]);

  // cmd
  msg.push_back(command);
  msg.push_back(argument);

  // footer
  msg.push_back(0);
  msg.push_back(0);
  msg.push_back(0xf7);

  sendMessage(msg);
}

int ShruthiMidi::expectedSysexPayload(SysexCommand cmd) {
  //    SysexCommand cmd = (SysexCommand) msg->at(6);
  //    size_t size = (msg->size() - 11) >> 1; // sysex overhead is 11 bytes,
  //    bytes are transferred in nibblets

  switch (cmd) {
    case kNumbers:
      return sizeof(uint16_t) * 2;
      break;

    case kNumBanks:
      return 0;
      break;

    case kVersion:
      return 2;
      break;

    case kPatch:  // Patch transfer
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

    case kSequenceStep:  // sequence step transfer
      return 2;
      break;

    case kPatchName:
      return kPatchNameSize;
      break;

    case kSequencerState:  // Full sequencer state transfer
      return sizeof(SequencerSettings);
      break;

    case kRawDataDumpA:  // Bulk transfer
    case kRawDataDumpB:
    case kRawDataDumpC:
    case kRawDataDumpD:
      return kSysExBulkDumpBlockSize;
      break;

    default:
      return -1;  // command not supported
      break;
  }
}

void ShruthiMidi::parseControlChange(long cc_index, long cc_value) {
  switch (cc_index) {
    case CC_NRPN_MSB:
      // Save 7 high bits
      indexMsb_ = cc_value << 7;
      isNrpnValid_ = false;
      break;
    case CC_NRPN_LSB:
      // Save 7 low bits
      indexLsb_ = cc_value;
      isNrpnValid_ = true;
      break;
    case CC_DATA_MSB:
      valueMsb_ = cc_value << 7;
      valueLsb_ = 0;  // lsb is optional
      break;
    case CC_DATA_LSB:
      valueLsb_ = cc_value;
      if (isNrpnValid_) {
        parseControlChangeAsNrpn();
      }
      break;
    default:
      // process cc coming from xt knob movements
      x_.processCcInput(cc_index, cc_value);
      break;
  }
}

void ShruthiMidi::parseControlChangeAsNrpn() {
  if (valueMsb_ && valueLsb_ > 63) {
    // negative
    long v = valueLsb_ - 0x80;
    x_.processNrpnInput(indexMsb_ | indexLsb_, v);

  } else {
    // range 0-127 or positive >127
    long v = valueMsb_ | valueLsb_;
    x_.processNrpnInput(indexMsb_ | indexLsb_, v);
  }
}

void ShruthiMidi::sendNrpn(long nrpn_index, long nrpn_value) {
  std::vector<uint8_t> msg;

  uint8_t status = STATUS_CC | channelOut_;
  dataMsb_ = 0;
  dataLsb_ = 0;

  if (nrpn_value < 0) {
    dataMsb_ = 1;  // msb is only ever 1 or 0 for shruthi
    int8_t sbyte = static_cast<int8_t>(nrpn_value);
    dataLsb_ = sbyte ^ 0x80;  // twos complement using xor msb
  } else if (nrpn_value > 127) {
    dataMsb_ = 1;
    dataLsb_ = nrpn_value & 0x7f;
  } else {
    dataLsb_ = static_cast<uint8_t>(nrpn_value);
  }

  try {
    // only send out nrpn index if it differs from last
    if (lastNrpnIndex_ != nrpn_index) {
      lastDataMsb_ = -1;
      nrpnMsb_ = nrpn_index >> 7;
      nrpnLsb_ = nrpn_index & 0x7f;

      msg.push_back(status);
      msg.push_back(CC_NRPN_MSB);
      msg.push_back(nrpnMsb_);
      sendMessage(msg);
      msg.clear();
      //            }
      msg.push_back(status);
      msg.push_back(CC_NRPN_LSB);
      msg.push_back(nrpnLsb_);
      sendMessage(msg);
      msg.clear();

      // remember to avoid redundant nrpn messages
      lastNrpnIndex_ = nrpn_index;
    }

    // filter redundant data msb.
    if (dataMsb_ != lastDataMsb_) {
      msg.push_back(status);
      msg.push_back(CC_DATA_MSB);
      msg.push_back(dataMsb_);
      sendMessage(msg);
      msg.clear();
    }

    msg.push_back(status);
    msg.push_back(CC_DATA_LSB);
    msg.push_back(dataLsb_);

    sendMessage(msg);
    // save dataMsb_ for redundancy check
    lastDataMsb_ = dataMsb_;

  } catch (RtError &err) {
    error("%s", err.what());
  }
}

void ShruthiMidi::sendPatchProgramChange(long slot) {
  uint8_t bank = slot / 128;
  uint8_t patch = (slot - bank * 128) & 0x7f;
  if (bank > 8) return;

  std::vector<uint8_t> msg;

  // Bank select CC
  msg.push_back(0xb0 | channelOut_);
  msg.push_back(0);     // bank MSB
  msg.push_back(bank);  // since 0.98 sent in msb
  sendMessage(msg);
  msg.clear();

  // Program Change
  msg.push_back(0xc0 | channelOut_);
  msg.push_back(patch);
  sendMessage(msg);
}

void ShruthiMidi::sendSequenceProgramChange(long slot) {
  uint8_t bank = slot / 128;
  uint8_t patch = (slot - bank * 128) & 0x7f;
  if (bank > 8) return;

  std::vector<uint8_t> msg;

  // Bank select CC
  msg.push_back(0xb0 | channelOut_);
  msg.push_back(0);  // bank MSB
  msg.push_back(bank + 0x40);
  sendMessage(msg);
  msg.clear();

  // Program Change
  msg.push_back(0xc0 | channelOut_);
  msg.push_back(patch & 0x7f);
  sendMessage(msg);
}
