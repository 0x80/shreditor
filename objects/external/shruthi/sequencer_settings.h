// Copyright 2009 Olivier Gillet.
//
// Author: Olivier Gillet (ol.gillet@gmail.com)
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
// -----------------------------------------------------------------------------

#ifndef SHRUTHI_SYSTEM_SEQUENCER_SETTINGS_H_
#define SHRUTHI_SYSTEM_SEQUENCER_SETTINGS_H_

#include "avrlib/base.h"
#include "shruthi/patch.h"

//namespace shruthi {

enum SequencerMode {
  SEQUENCER_MODE_STEP,
  SEQUENCER_MODE_ARP,
  SEQUENCER_MODE_ARP_LATCH,
  SEQUENCER_MODE_RPS,
  SEQUENCER_MODE_RPS_LATCH,
  SEQUENCER_MODE_REC,
  SEQUENCER_MODE_IMPROVISATION,
};

enum ArpeggioVelocitySource {
  ARPEGGIO_VELOCITY_SOURCE_KEYBOARD,
  ARPEGGIO_VELOCITY_SOURCE_SEQUENCE
};

enum Flow {
  WARP_NORMAL,
  WARP_REVERSE,
  WARP_BACK_FORTH_1,
  WARP_BACK_FORTH_2,
  
  WARP_GLASS,
  WARP_KRAMA,
  WARP_JATA,
  WARP_SIKHA,
  WARP_GHANA,

  WARP_GLASS_2,
  WARP_KRAMA_2,
  WARP_JATA_2,
  WARP_SIKHA_2,
  WARP_GHANA_2,

  WARP_GLASS_4,
  WARP_KRAMA_4,
  WARP_JATA_4,
  WARP_SIKHA_4,
  WARP_GHANA_4,
};

enum ArpeggioDirection {
  ARPEGGIO_DIRECTION_UP = 0,
  ARPEGGIO_DIRECTION_DOWN,
  ARPEGGIO_DIRECTION_UP_DOWN,
  ARPEGGIO_DIRECTION_RANDOM,
};

// data[0] bits:
//    1: note
//    2: note
//    3: note
//    4: note
//    5: note
//    6: note
//    7: note
//    8: gate MSB

// data[1] bits:
//    1: ctl
//    2: ctl
//    3: ctl
//    4: ctl
//    5: vel
//    6: vel
//    7: vel
//    8: legato MSB



// data[0] bestaat uit note (eerste 7bit) + gate flag bit #8
class SequenceStep {
 public:

    
    void setGateValue(uint8_t gate) {
        if (gate) {
            // set alleen 8e bit en laat rest staan (note data)
            data_[0] |= 0x80;
        } else {
            // zet alleen 8e bit uit en laat rest staan (&= 0x7f zou zelfde zijn toch?)
            data_[0] &= ~0x80;
        }
    }
    void setNoteValue(uint8_t note) {
        // clear first 7 bits en zet daarna note data erin
        data_[0] = (data_[0] & 0x80) | (note & 0x7f);
    }

    // legato, 8e bit
    void setLegatoValue(uint8_t legato) {
        if (legato) {
            data_[1] |= 0x80;
        } else {
            data_[1] &= ~0x80;
        }
    }

    // velocity, bit 5 6 7 (range 8)
    void setVelocityValue(uint8_t velocity) {
        // clear eerst bit 5 6 7 en vul daarna met velocity gebruik alleen eerste 3 bits
        data_[1] = (data_[1] & 0x8f) | ((velocity & 0x07) << 4);
    }
    // controller bit 1 2 3 4 (range 16)
    void setControllerValue(uint8_t controller) {
        // clear eerst bit 1 2 3 4 en vul daarna met controller waarde
        data_[1] = (data_[1] & 0xf0) | (controller & 0x0f);
    }

    
  void set_raw(uint8_t a, uint8_t b) {
    data_[0] = a;
    data_[0] = b;
  }
  
    uint8_t getGateValue() const {
        return (data_[0] & 0x80) ? 1 : 0;
    }
    uint8_t getNoteValue() const {
        return data_[0] & 0x7f;
    }
    uint8_t getLegatoValue() const {
        return (data_[1] & 0x80) ? 1 : 0;
    }
    uint8_t getVelocityValue() const {
        return (data_[1] & 0x70) >> 4;
    }
    uint8_t getControllerValue() const {
        return data_[1] & 0x0f;
    }

  
  void clear() {
    data_[0] = 0;
    data_[1] = 0;
  }
  uint8_t blank() {
    return (data_[0] == 0) && (data_[1] == 0);
  }

// private:
  uint8_t data_[2];
};

static const uint8_t kNumSteps = 16;

#pragma pack(push, 1)
struct SequencerSettings {
 public:
  uint8_t seq_mode;
  uint8_t seq_tempo;
  uint8_t seq_groove_template;
  uint8_t seq_groove_amount;
  
  uint8_t arp_direction;
  uint8_t arp_range;
  uint8_t arp_pattern;
  uint8_t arp_warp;
  
  uint8_t pattern_size;
  uint8_t pattern_rotation;
  SequenceStep steps[kNumSteps];
  
  void PrintStep(uint8_t step, char* buffer) const;
  
  uint8_t* saved_data() { return (uint8_t*)(&steps[0]); }
  void PrepareForWrite();
  uint8_t CheckBuffer(uint8_t* buffer) { return 1; }
  void Update() {
    pattern_size = kNumSteps;
    for (uint8_t i = 0; i < kNumSteps; ++i) {
      if (steps[i].blank()) {
        pattern_size = i;
        break;
      }
    }
  }
};
#pragma pack(pop)

enum SequencerParameter {
  PRM_SEQ_MODE = sizeof(Patch),
  PRM_SEQ_TEMPO,
  PRM_SEQ_GROOVE_TEMPLATE,
  PRM_SEQ_GROOVE_AMOUNT,

  PRM_ARP_DIRECTION,
  PRM_ARP_RANGE,
  PRM_ARP_PATTERN,
  PRM_ARP_WARP,
  
  PRM_SEQ_PATTERN_SIZE,
  PRM_SEQ_PATTERN_ROTATION,
};

static const uint8_t kNumArpeggiatorPatterns = 15;

//}  // namespace shruthi

#endif // SHRUTHI_SYSTEM_SEQUENCER_SETTINGS_H_
