#ifndef MutableSysex_shruthi_types_h
#define MutableSysex_shruthi_types_h

#include "maxcpp6.h"
#include "shruthi/patch.h"
#include "shruthi/sequencer_settings.h"
#include "shruthi/system_settings.h"
#include <functional>
//#include <boost/tr1/functional>
#include "stdint.h"

const uint16_t kUserWavetableSize = 8 * 129;
const uint8_t kSysExBulkDumpBlockSize = 128;
const uint16_t kInternalEepromSize = 0x0800;
const uint16_t kBankSize = 0x2000;
const uint16_t kMaxNumBanks = 7;


// have to make this uint8_t for max
static const uint8_t sysex_rx_header[] = {
    0xf0,               // <Sysex>
    0x00, 0x21, 0x02,   // Mutable Instruments manufacturer ID.
    0x00, 0x02,         // Product ID for Shruthi-1.
};

// have to make this uint8_t for max
static const uint8_t sysex_rx_header_old[] = {
    0xf0,               // <Sysex>
    0x00, 0x20, 0x77,
    0x00, 0x02,         // Product ID for Shruthi-1.
};


#define SYSEX_START 0xF0
#define SYSEX_END 0xF7
#define SYSEX_CHUNK_SIZE 32

#define CC_DATA_MSB 6
#define CC_DATA_LSB 38
#define CC_NRPN_LSB 98
#define CC_NRPN_MSB 99

#define STATUS_NOTE_ON 0x90
#define STATUS_NOTE_OFF 0x80
#define STATUS_MONO_PRESSURE 0xd0
#define STATUS_POLY_PRESSURE 0xa0
#define STATUS_PROGRAM_CHANGE 0xc0
#define STATUS_PITCH_BEND 0xe0
#define STATUS_CC 0xb0
#define STATUS_SYSEX 0xf0


enum SysexCommand {
    
    kPatch = 0x01,
    kSequence,
    kWavetable,
    kSystemSettings,
    kSequenceStep,
    kPatchName,
    kSequencerState,
    kPatternSize ,
    kPatternRotation,
    kNumbers = 0x0a,
    
    kPatchRequest = 0x11,
    kSequenceRequest,
    
    kSystemSettingsRequest = 0x14,
    kSequenceStepRequest,
    kPatchNameRequest,
    kSequencerStateRequest,
    kNumbersRequest = 0x1a,
    
    kRandomizePatchRequest = 0x31,
    kRandomizeSequenceRequest,
    
    kWritePatchRequest = 0x21,
    kWriteSequenceRequest = 0x22,
    kRawDataDumpA = 0x40,
    kRawDataDumpB = 0x41,
    kRawDataDumpC = 0x42,
    kRawDataDumpD = 0x43,
    kRawDataDumpRequest = 0x50
};

//const size_t SYSTEM_SETTINGS_SIZE = sizeof(SystemSettings)-1;
const size_t SYSTEM_SETTINGS_SIZE = sizeof(SystemSettings);

template<typename T>
class StorageConfiguration { };

template<> class StorageConfiguration<Patch> {
public:
    enum {
        num_internal = 16,
        num_external = 64,
        offset_internal = 16,
        offset_external = 0,
        size = PATCH_SIZE,
        sysex_object_id = 0x01,
        undo_buffer_offset = 0,
    };
};

template<> class StorageConfiguration<SequencerSettings> {
public:
    enum {
        num_internal = 16,
        num_external = 64,
        offset_internal = StorageConfiguration<Patch>::offset_internal + \
        StorageConfiguration<Patch>::num_internal * PATCH_SIZE,
        offset_external = StorageConfiguration<Patch>::offset_external + \
        StorageConfiguration<Patch>::num_external * PATCH_SIZE,
        size = sizeof(SequenceStep) * kNumSteps,
        sysex_object_id = 0x02,
        undo_buffer_offset = PATCH_SIZE,
    };
};




#endif