#include "maxcpp6.h"

#define CC_DATA_MSB 6
#define CC_DATA_LSB 38
#define CC_NRPN_LSB 98
#define CC_NRPN_MSB 99

static t_symbol *ps_nrpn = gensym("nrpn");
static t_symbol *ps_cc = gensym("cc");
static t_symbol *ps_empty = gensym("");



class NrpnToControl : public MaxCpp6<NrpnToControl> {
public:
	NrpnToControl(t_symbol * sym, long ac, t_atom * av)
    :   filterMsb_(true),
        lastNrpnIndex(-1),
        last_data_msb(-1),
        mode_(kTwosComplement)
    {
		setupIO(1, 1); // inlets / outlets
	}
	~NrpnToControl() {}

	void nrpn(long inlet, long nrpn_index, long nrpn_value) {
    
        data_msb = 0;
        data_lsb = 0;
       
        switch(mode_){
            case kTwosComplement:
                if(nrpn_value < 0){
                    // conversion to two's complement
                    // http://www.cs.cornell.edu/~tomf/notes/cps104/twoscomp.html
                    
                    // For shruthi we can assume that nrpn value is 8 bits
                    // For other synths this might not work!!
                    data_msb = 1; // msb is only ever 1 or 0 for shruthi
                    
                    int8_t sbyte = static_cast<int8_t>(nrpn_value);
                    data_lsb = sbyte ^ 0x80; // twos complement using xor msb
                    
                } else if(nrpn_value > 127){
                    data_msb = nrpn_value >> 7;
                    data_lsb = nrpn_value & 127;
                }else{
                    data_lsb = static_cast<uint8_t>(nrpn_value);
                }
                break;
            case k14bit:
                data_msb = nrpn_value >> 7;
                nrpn_lsb = nrpn_value & 127;
            default:
                return; // invalid return do nothing no output
            
        }
                
        
        // only send out nrpn index if it differs from last
        if(lastNrpnIndex != nrpn_index){
            last_data_msb = -1; // sowieso invalid maken
            nrpn_msb = nrpn_index >> 7;
            nrpn_lsb = nrpn_index & 127;
            
            if(!filterMsb_ || nrpn_msb){
                atom_setlong(atoms_, CC_NRPN_MSB);
                atom_setlong(atoms_+1, nrpn_msb);
                outlet_list(m_outlet[0], ps_empty, 2,  atoms_);
            }
            
            atom_setlong(atoms_, CC_NRPN_LSB);
            atom_setlong(atoms_+1, nrpn_lsb);
            outlet_list(m_outlet[0], ps_empty, 2,  atoms_);
            
            // remember to avoid redundant nrpn messages
            lastNrpnIndex = nrpn_index;
        }
        
        // filter redundant data msb.
        if(!filterMsb_ || data_msb != last_data_msb){
            atom_setlong(atoms_, CC_DATA_MSB);
            atom_setlong(atoms_+1, data_msb);
            outlet_list(m_outlet[0], ps_empty, 2,  atoms_);
        }
        
        atom_setlong(atoms_, CC_DATA_LSB);
        atom_setlong(atoms_+1, data_lsb);
        outlet_list(m_outlet[0], ps_empty, 2,  atoms_);
        
        // save data_msb for redundancy check
        last_data_msb = data_msb;
    }
    
    void listInput(t_symbol *s, long ac, t_atom *av){
        if(ac != 2){
            error("nrpn2cc expects 2-integer list input");
            return;
        }
        
        long nrpn_index = atom_getlong(av);
        long nrpn_value = atom_getlong(av+1);
        // forward
        nrpn(0, nrpn_index, nrpn_value);
    }
    
    void filterMsb(long inlet, long v){
        filterMsb_ = (v > 0) ? true : false;
    }
    
    void setNrpnMode(long inlet, t_symbol *mode){
        if(mode == gensym("TwosComplement")){
            mode_ = kTwosComplement;
        }else if(mode == gensym("14bit")){
            mode_ = k14bit;
        }else{
            mode_ = kInvalid;
        }
    }
    
private:
    t_atom atoms_[4];
    bool filterMsb_;
    long lastNrpnIndex;
    
    uint8_t nrpn_msb;
    uint8_t nrpn_lsb;
    uint8_t data_msb;
    uint8_t data_lsb;
    
    uint8_t last_data_msb;
    
    enum NrpnMode {
        kInvalid = -1,
        kTwosComplement = 0,
        k14bit
    };
    
    NrpnMode mode_;
    
};

extern "C" int main(void) {
	// create a class with the given name:
	NrpnToControl::makeMaxClass("vx.nrpn2cc");
    REGISTER_METHOD_LONG(NrpnToControl, filterMsb);
	REGISTER_METHOD_LONG2(NrpnToControl, nrpn);
    REGISTER_METHOD_LIST_DEF(NrpnToControl, listInput);
    REGISTER_METHOD_SYMBOL(NrpnToControl, setNrpnMode);
}