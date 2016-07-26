//
//  patch.cpp
//  Shreditor
//
//  Created by Thijs Koerselman on 11/17/13.
//
//

#include "patch.h"
#include "sequencer_settings.h"
#include "system_settings.h"
#include "vx.shruthi.h"


void Patch::PrepareForWriteOrig() {
    version_ = '!';
    filter_topology_ = (filter_1_mode_ << 4) | filter_2_mode_;
    op_data_[0] = ops_[0].operands[0];
    op_data_[1] = (ops_[0].operands[1] << 3) | (ops_[0].op & 0x7);
    op_data_[2] = ops_[1].operands[0];
    op_data_[3] = (ops_[1].operands[1] << 3) | (ops_[1].op & 0x7);
    if (ops_[0].op & 0x8) {
        op_data_[0] |= 0x80;
    }
    if (ops_[1].op & 0x8) {
        op_data_[2] |= 0x80;
    }
    if (ops_[0].operands[1] & 0x20) {
        op_data_[0] |= 0x40;
    }
    if (ops_[1].operands[1] & 0x20) {
        op_data_[2] |= 0x40;
    }
    
}

uint8_t Patch::CheckBufferOrig(uint8_t* buffer) {
    for (uint8_t i = 8; i < 24; ++i) {
        if (buffer[i] >= 128) {
            memset(name, '-', 8);
            return 0;
        }
    }
    if (buffer[91] != '!') {
        memset(name, '-', 8);
        return 0;
    }
    return 1;
}

void Patch::UpdateOrig() {
    // Horrible hack to set the HPF to 0 on patches saved with previous
    // versions of the firmware.
    if (op_data_[2] == 'n' && op_data_[3] == 'g') {
        memset(saved_data() + 84, 0, 8);
    }
    ops_[0].operands[0] = op_data_[0] & 0x3f;
    ops_[0].operands[1] = op_data_[1] >> 3;
    ops_[0].op = op_data_[1] & 0x7;
    if (op_data_[0] & 0x80) {
        ops_[0].op |= 0x8;
    }
    if (op_data_[0] & 0x40) {
        ops_[0].operands[1] |= 0x20;
    }
    
    ops_[1].operands[0] = op_data_[2] & 0x3f;
    ops_[1].operands[1] = op_data_[3] >> 3;
    ops_[1].op = op_data_[3] & 0x7;
    if (op_data_[2] & 0x80) {
        ops_[1].op |= 0x8;
    }
    if (op_data_[2] & 0x40) {
        ops_[1].operands[1] |= 0x20;
    }
    
    filter_2_mode_ = filter_topology_ & 0xf;
    filter_1_mode_ = filter_topology_ >> 4;
}


void Patch::PrepareForWriteXt(const SystemSettings &sys, const SequencerSettings &seq) {
    version_ = '%';
    filter_topology_ = (filter_1_mode_ << 4) | filter_2_mode_;
    op_data_[0] = ops_[0].operands[0];
    op_data_[1] = (ops_[0].operands[1] << 3) | (ops_[0].op & 0x7);
    op_data_[2] = ops_[1].operands[0];
    op_data_[3] = (ops_[1].operands[1] << 3) | (ops_[1].op & 0x7);
    if (ops_[0].op & 0x8) {
        op_data_[0] |= 0x80;
    }
    if (ops_[1].op & 0x8) {
        op_data_[2] |= 0x80;
    }
    if (ops_[0].operands[1] & 0x20) {
        op_data_[0] |= 0x40;
    }
    if (ops_[1].operands[1] & 0x20) {
        op_data_[2] |= 0x40;
    }
    
    // Copy sequencer settings data into patch data.
//    const SystemSettings system_settings = part.system_settings();
//    const SequencerSettings sequencer_settings = part.sequencer_settings();
    
    extra_data_[0] = sys.legato ? 0x40 : 0x00;
    extra_data_[0] |= sys.portamento;
    
    extra_data_[1] = seq.seq_mode;
    extra_data_[2] = seq.seq_tempo;
    extra_data_[3] = seq.seq_groove_template;
    extra_data_[4] = seq.seq_groove_amount;
    extra_data_[5] = (seq.arp_direction << 4) | seq.arp_range;
    extra_data_[6] = seq.arp_pattern;
    extra_data_[7] = seq.arp_clock_division;
}

void Patch::UpdateXt(SystemSettings &sys, SequencerSettings &seq) {
    // Horrible hack to set the HPF to 0 on patches saved with previous
    // versions of the firmware.
    if (op_data_[2] == 'n' && op_data_[3] == 'g') {
        memset(saved_data() + 84, 0, 8);
    }
    ops_[0].operands[0] = op_data_[0] & 0x3f;
    ops_[0].operands[1] = op_data_[1] >> 3;
    ops_[0].op = op_data_[1] & 0x7;
    if (op_data_[0] & 0x80) {
        ops_[0].op |= 0x8;
    }
    if (op_data_[0] & 0x40) {
        ops_[0].operands[1] |= 0x20;
    }
    
    ops_[1].operands[0] = op_data_[2] & 0x3f;
    ops_[1].operands[1] = op_data_[3] >> 3;
    ops_[1].op = op_data_[3] & 0x7;
    if (op_data_[2] & 0x80) {
        ops_[1].op |= 0x8;
    }
    if (op_data_[2] & 0x40) {
        ops_[1].operands[1] |= 0x20;
    }
    
    filter_2_mode_ = filter_topology_ & 0xf;
    filter_1_mode_ = filter_topology_ >> 4;
    
    if (version_ == '%') {
//        SystemSettings* system_settings = part.mutable_system_settings();
//        SequencerSettings* sequencer_settings = part.mutable_sequencer_settings();
        
        sys.legato = extra_data_[0] & 0x40 ? 1 : 0;
        sys.portamento = extra_data_[0] & 0x3f;
        
        //if (!part.running()) {
            seq.seq_mode = extra_data_[1];
            seq.seq_tempo = extra_data_[2];
            seq.seq_groove_template = extra_data_[3];
            seq.seq_groove_amount = extra_data_[4];
            seq.arp_direction = extra_data_[5] >> 4;
            seq.arp_range = extra_data_[5] & 0xf;
            seq.arp_pattern = extra_data_[6];
            seq.arp_clock_division = extra_data_[7];
        //}
    }
}

uint8_t Patch::CheckBufferXt(uint8_t* buffer) {
    for (uint8_t i = 8; i < 24; ++i) {
        if (buffer[i] >= 128) {
            memset(name, '-', 8);
            return 0;
        }
    }
    if (buffer[91] != '!' && buffer[91] != '%') {
        memset(name, '-', 8);
        return 0;
    }
    return 1;
}
