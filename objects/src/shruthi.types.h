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


#ifndef MutableSysex_shruthi_types_h
#define MutableSysex_shruthi_types_h

#include "patch.h"
#include "sequencer_settings.h"
#include "system_settings.h"
#include <functional>
#include <vector>
#include <string>

#include "stdint.h"

const uint16_t kUserWavetableSize = 8 * 129;
const uint8_t kSysExBulkDumpBlockSize = 128;
const uint16_t kInternalEepromSize = 0x0800;
const uint16_t kBankSize = 0x2000;
const uint16_t kMaxNumBanks = 7;

const size_t kExternalEepromSize = kBankSize * kMaxNumBanks;
const size_t kExternalEepromOffset = kInternalEepromSize;
const size_t kEepromSize = kInternalEepromSize + kExternalEepromSize;

// have to make this uint8_t for max
static const uint8_t sysex_rx_header[] = {
    0xf0,             // <Sysex>
    0x00, 0x21, 0x02, // Mutable Instruments manufacturer ID.
    0x00, 0x02,       // Product ID for Shruthi-1.
};

// a wrapper for cpost() only called for debug builds on Windows
// to see these console posts, run the DbgView program (part of the SysInternals
// package distributed by Microsoft)
#ifdef _DEBUG
#define DPOST post
#else
#define DPOST
#endif

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
#define STATUS_CLOCK 0xf8
#define STATUS_RT_RANGE_START 0xf8
#define STATIS_RT_RANGE_END 0xff

enum SysexCommand {

  kPatch = 0x01,
  kSequence,
  kWavetable,
  kSystemSettings,
  kSequenceStep,
  kPatchName,
  kSequencerState,
  kPatternSize,
  kPatternRotation,
  kNumbers = 0x0a,
  kNumBanks,
  kVersion,

  kPatchRequest = 0x11,
  kSequenceRequest,

  kSystemSettingsRequest = 0x14,
  kSequenceStepRequest,
  kPatchNameRequest,
  kSequencerStateRequest,
  kNumbersRequest = 0x1a,
  kNumBanksRequest,

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

// const size_t SYSTEM_SETTINGS_SIZE = sizeof(SystemSettings)-1;
const size_t SYSTEM_SETTINGS_SIZE = sizeof(SystemSettings);

template <typename T> class StorageConfiguration {};

template <> class StorageConfiguration<Patch> {
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

template <> class StorageConfiguration<SequencerSettings> {
public:
  enum {
    num_internal = 16,
    num_external = 64,
    offset_internal = StorageConfiguration<Patch>::offset_internal +
                      StorageConfiguration<Patch>::num_internal * PATCH_SIZE,
    offset_external = StorageConfiguration<Patch>::offset_external +
                      StorageConfiguration<Patch>::num_external * PATCH_SIZE,
    size = sizeof(SequenceStep) * kNumSteps,
    sysex_object_id = 0x02,
    undo_buffer_offset = PATCH_SIZE,
  };
};

#endif
