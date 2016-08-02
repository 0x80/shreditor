#ifndef MutableSysex_vx_shruthi_h
#define MutableSysex_vx_shruthi_h

#include "maxcpp6.h"
#include "shruthi.midi.h"
#include "shruthi.transfer.h"
#include "shruthi.types.h"

#define NUM_DEVICE_SLOTS 8

void midiNrpnCallback(VxShruthi *x, long index, long value);
void midiCcCallback(VxShruthi *x, long index, long value);
void midiSysexCallback(VxShruthi *x, SysexCommand cmd, uint8_t arg,
                       std::vector<uint8_t> &data);
void transferProgressCallback(VxShruthi *x, bool finished, uint8_t progress);

class VxShruthi : public MaxCpp6<VxShruthi> {
public:
  VxShruthi(t_symbol *sym, long ac, t_atom *av);
  ~VxShruthi();

  void initializeSystemStoragePath();
  int makePaths(const char *root);

  static void onTick(VxShruthi *x);
  static void onReady(VxShruthi *x, t_symbol *s, short ac, t_atom *av);
  static void onFail(VxShruthi *x, t_symbol *s, short ac, t_atom *av);

  void outputProgress(long progress);
  void outputPatchData();
  void testMidi(long inlet) { midi_.testMidiOut(); }

  void outputSequence();
  void outputSequencerSettings();
  void outputSettingsData();

  void mapCcToNrpn(long index, long v);
  inline void mapNrpnToEeprom(long nrpn_index, long v);
  inline void mapSequencerNrpnToEeprom(long nrpn_index, long v);
  inline void outputNrpn(long index, long value);

  void acceptSysexData(SysexCommand cmd, uint8_t arg,
                       std::vector<uint8_t> &data);

  void transferPatch(long inlet = 0);
  void transferSequence(long inlet = 0);
  void transferWavetable(long inlet = 0);
  void transferSystemSettings(long inlet = 0);
  void transferSystemSettingsToEeprom(long inlet = 0);

  void transferSequenceStep(long index);
  void transferPatchName(long inlet = 0);
  void transferSequencerSettings(long inlet = 0);
  void transferRom(long inlet = 0);

  void requestNumbers(long inlet = 0);  // get current patch/sequence index
  void requestNumBanks(long inlet = 0); // get eeprom bank count
  void requestVersion(long inlet = 0);
  void requestPatch(long inlet = 0);
  void requestSequence(long inlet = 0);
  void requestWavetable(long inlet = 0);
  void requestSystemSettings(long inlet = 0);
  void requestSequenceStep(long inlet, long index);
  void requestPatchName(long inlet = 0);
  void requestSequencerSettings(long inlet = 0);
  void requestRandomizePatch(long inlet = 0);
  void requestRandomizeSequence(long inlet = 0);

  void requestPatchWrite(long slot);
  void requestSequenceWrite(long slot);
  void requestRom(long inlet = 0);

  void setPatternLength(long inlet, long length);
  void setPatternRotation(long inlet, long rotation);

  void setPatchName(long inlet, t_symbol *name);
  void setSettingsFilter(long inlet, t_symbol *name);
  void setSettingsOctave(long inlet, long v);
  void setSettingsRaga(long inlet, long v);
  void setSettingsPortamento(long inlet, long v);
  void setSettingsLegato(long inlet, long v);

  void setSystemSettings(long inlet, t_symbol *s, long ac, t_atom *av);
  void setNumBanks(long inlet, long v);

  void liveStep(long inlet, t_symbol *s, long ac, t_atom *av);
  void liveGrid(long inlet, t_symbol *s, long ac, t_atom *av);

  void loadPatch(long inlet, long slot);
  void loadSequence(long inlet, long slot);
  void sendPatchProgramChange(long slot);

  void sendSequenceProgramChange(long slot);

  void storePatch(long inlet, long slot);
  void storeSequence(long inlet, long slot);

  void loadDeviceEeprom();
  void saveDeviceEeprom();

  void importEeprom(long inlet, t_symbol *filepath);
  void exportEeprom(long inlet, t_symbol *filepath);

  void storePatchToEeprom(long slot);
  void loadPatchFromEeprom(long slot);
  void storeSequenceToEeprom(long slot);
  void loadSequenceFromEeprom(long slot);

  void clearEepromCache(long inlet = 0);

  void calculatePatternSize();

  void nrpn(long inlet, long nrpn_index, long nrpn_value);
  void cc(long inlet, long cc_index, long cc_value);
  void sysex(long inlet, t_symbol *s, long ac, t_atom *av);

  void processNrpnInput(long index, long v);
  void processCcInput(long index, long v);
  void processSysexInput(SysexCommand cmd, uint8_t arg,
                         std::vector<uint8_t> &data);

  void stopTransfer(long inlet = 0);

  void copyPatchToClipboard(long inlet);
  void pastePatchFromClipboard(long inlet);
  void copySequenceToClipboard(long inlet);
  void pasteSequenceFromClipboard(long inlet);

  void listPatchNames(long inlet = 0);
  void clearPatchNames(long inlet = 0);
  void outputDataroot();

  void switchToDevice(long inlet, long v);
  void refreshGui();

  template <typename T> uint8_t *getAddress(uint16_t slot) {
    if (slot < StorageConfiguration<T>::num_internal) {
      return (uint8_t *)(eeprom_ + StorageConfiguration<T>::offset_internal +
                         StorageConfiguration<T>::size * slot);
    } else {
      slot -= StorageConfiguration<T>::num_internal;
      uint16_t base =
          StorageConfiguration<T>::offset_external + kInternalEepromSize;
      while (slot >= StorageConfiguration<T>::num_external) {
        slot -= StorageConfiguration<T>::num_external;
        base += kBankSize;
      }
      return (uint8_t *)(eeprom_ + base + StorageConfiguration<T>::size * slot);
    }
  }

  void *clock_;
  bool isSequenceDirty_;

private:
  long convertControlValue(long v, long nsteps, long min = 0);

  uint16_t addressable_space_size();
  inline long getNumPatches() { return numAccessibleBanks_ * 64 + 16; }

  int slotIndex_;

  struct tm expire_;

  Patch workingPatch_[NUM_DEVICE_SLOTS]; // working patch
  int workingPatchIndex_[NUM_DEVICE_SLOTS];
  Patch clipboardPatch_;

  SequencerSettings workingSequencer_[NUM_DEVICE_SLOTS];
  int workingSequencerIndex_[NUM_DEVICE_SLOTS];
  SequencerSettings clipboardSequencer_;

  uint8_t wavetable_[kUserWavetableSize + 1]; // waarom +1?
  t_atom atoms_[128];

  SystemSettings *settings_; // settings are stored at beginning of eeprom so
                             // no extra memory
                             // is allocated, it is just pointing to eeprom_;

  void *midiOut_;
  void *nrpnOut_;
  void *msgOut_;

  uint8_t *eeprom_;
  uint8_t loadbuffer_[sizeof(Patch)];
  uint8_t firmware_major_, firmware_minor_;

  ShruthiMidi midi_;

  uint8_t numAccessibleBanks_;
  bool useEepromCache_;
  bool hasEepromCache_;
  uint16_t currentPatchNumber_;
  uint16_t currentSequenceNumber_;

  std::string dataroot_;
  std::string presetfile_;

  int progressCounter_;
  bool xtmode_;
};

#endif
