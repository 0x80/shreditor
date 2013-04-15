//
//  vx.shruthi.h
//  MutableSysex
//
//  Created by Thijs Koerselman on 11/30/12.
//
//

#ifndef MutableSysex_vx_shruthi_h
#define MutableSysex_vx_shruthi_h


#include "shruthi.types.h"
#include "shruthi.midi.h"
#include "shruthi.transfer.h"







class VxShruthi : public MaxCpp6<VxShruthi> {
public:
	VxShruthi(t_symbol * sym, long ac, t_atom * av);
    ~VxShruthi();
    
    
//    void midiInput(long v);
    
    static void onTick(VxShruthi *x);
    
    void outputProgress(long v);
    void outputPatchData();
    void outputAllSequencerData();
    void outputSettingsData();
    inline void outputNrpn(long index, long value);
    void outputSequence();

    void acceptSysexData(SysexCommand cmd, uint8_t arg, std::vector<uint8_t> &data);
    
    void transferPatch(long inlet = 0);
    void transferSequence(long inlet = 0);
    void transferWavetable(long inlet = 0);
    void transferSystemSettings(long inlet = 0);
    void transferSystemSettingsToEeprom(long inlet = 0);
    
    void transferSequenceStep(long index);
    void transferPatchName(long inlet = 0);
    void transferSequencerSettings(long inlet = 0);
    void transferRom(long inlet = 0);
   
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
    void setSequenceNote(long inlet, long step, long value);
    void setSequenceController(long inlet, long step, long value);
    void setSequenceGate(long inlet, long step, long value);
    void setSequenceLegato(long inlet, long step, long value);
    void setSequenceVelocity(long inlet, long step, long value);
    void setPatchName(long inlet, t_symbol *name);
    void setSettingsFilter(long inlet, t_symbol *name);
    void setSettingsOctave(long inlet, long v);
    void setSettingsRaga(long inlet, long v);
    void setSettingsPortamento(long inlet, long v);
    void setSettingsLegato(long inlet, long v);
    void setMidiIn(long inlet, t_symbol* portName, long channel);
    void setMidiOut(long inlet, t_symbol* portName, long channel);
    void setSystemSettings(long inlet, t_symbol *s, long ac, t_atom *av);
        
    void enableFilterMsb(long inlet, long v);
    void enableEepromCache(long inlet, long v);
    void liveStep(long inlet, t_symbol* s, long ac, t_atom *av);
    void liveGrid(long inlet, t_symbol* s, long ac, t_atom *av);
    
    void loadPatch(long inlet, long slot);
    void sendPatchProgramChange(long slot);
    void loadSequence(long inlet, long slot);
    void sendSequenceProgramChange(long slot);
    
    void storePatch(long inlet, long slot);
    void storeSequence(long inlet, long slot);
    
    void importEeprom(long inlet, t_symbol* filepath);
    void exportEeprom(long inlet, t_symbol* filepath);
    
    void importUserData(long inlet, t_symbol* filepath);
    void exportUserData(long inlet, t_symbol* filepath);
    
    void storePatchToEeprom(long slot);
    void loadPatchFromEeprom(long slot);
    void storeSequenceToEeprom(long slot);
    void loadSequenceFromEeprom(long slot);
    
    void clearEepromCache(long inlet = 0);
    
    void nrpn(long inlet, long nrpn_index, long nrpn_value);
    void panic(long inlet=0);
    
    void listPatchNames(long inlet = 0);
     
    template<typename T>
    uint8_t* getAddress(uint16_t slot) {
        if (slot < StorageConfiguration<T>::num_internal) {
            return (uint8_t*)(eeprom_ +
                              StorageConfiguration<T>::offset_internal + \
                              StorageConfiguration<T>::size * slot);
        } else {
            slot -= StorageConfiguration<T>::num_internal;
            uint16_t base = StorageConfiguration<T>::offset_external + kInternalEepromSize;
            while (slot >= StorageConfiguration<T>::num_external) {
                slot -= StorageConfiguration<T>::num_external;
                base += kBankSize;
            }
            return (uint8_t*)(eeprom_ + base + StorageConfiguration<T>::size * slot);
        }
    }

    void *m_clock;
    bool sequence_dirty_;
    
private:

    uint16_t addressable_space_size();

    Patch patch_;
    SequencerSettings sequencer_;
    
    uint8_t wavetable_[kUserWavetableSize+1]; // waarom +1?
    t_atom atoms_[128];
    
    SystemSettings* settings_; // settings are stored at beginning of eeprom
    uint8_t *eeprom_;
    uint8_t load_buffer_[sizeof(Patch)];
    
    ShruthiMidi device_;
    SysexBulkTransfer transfer_;
    
    uint8_t num_accessible_banks_;
    bool useEepromCache_;
    bool hasEepromCache_;
};
    
#endif
