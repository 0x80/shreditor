#include "maxcpp6.h"

#define CC_DATA_MSB 6
#define CC_DATA_LSB 38
#define CC_NRPN_MSB 99
#define CC_NRPN_LSB 98

static t_symbol *ps_nrpn = gensym("nrpn");
static t_symbol *ps_cc = gensym("cc");
static t_symbol *ps_empty = gensym("");

class ControlToNrpn : public MaxCpp6<ControlToNrpn> {
public:
	ControlToNrpn(t_symbol * sym, long ac, t_atom * av) :
        index_lsb(0),
        index_msb(0),
        value_lsb(0),
        value_msb(0),
        valid(false),
        mode_(kTwosComplement)
    {
		setupIO(1, 2); // inlets / outlets
	}
	~ControlToNrpn() {}
    
    void cc(long inlet, long cc_index, long cc_value){

        switch(cc_index){
            // ******************** INDEX ************* //
            case CC_NRPN_MSB: 
                // Save 7 high bits
                index_msb = cc_value << 7;
                valid = false;
                break;
            case CC_NRPN_LSB: // 98
                // Save 7 low bits
                index_lsb = cc_value;
                valid = true;
                break;
            // ******************** VALUE **************//
            case CC_DATA_MSB:
                // WARNING
                // Officially LSB is optional, but since Max provides us only separate messages and not a buffer
                // we have no way of knowing if LSB will be provided or not. Apart from buffering ourself but that
                // would impose a delay.
                
                value_msb = cc_value << 7;
                value_lsb = 0; // lsb is optional
                // sends value directy in case LSB is not used
//                if(valid){ // only if value is 
//                    send_nrpn();
//                }
                break;
            case CC_DATA_LSB:  // OPTIONAL
                value_lsb = cc_value;
                if(valid){
                    send_nrpn();
                }
                break;
            default:
                send_cc(cc_index, cc_value);
        }
    }
    
    inline void send_nrpn(){

        
        switch(mode_){
            case kTwosComplement:
//                long value = value_msb | value_lsb;
//                uint8_t value_msb
                if(value_msb && value_lsb > 63){
                    // negative
//                    post("lsb %x", value_lsb);
//                    
//                    long invert = ~value_lsb; // invert
//                    post("invert %x", invert);
//                    invert += 1; // add one
//                    uint8_t truncated = static_cast<uint8_t>(invert);
//                    post("truncated + 1 %x", truncated);
//                    long v = -truncated;
//                    post("v %i", v);
                    long v = value_lsb - 0x80;
                    post("v %i", v);
                    atom_setlong(atoms_, index_msb | index_lsb);
                    atom_setlong(atoms_+1, v);
                    outlet_list(m_outlet[0], ps_empty, 2, atoms_);
                    
                }else{
                    // range 0-127 or >127 positive
                    long v = value_msb | value_lsb;
                    post("v %i", v);
                    atom_setlong(atoms_, index_msb | index_lsb);
                    atom_setlong(atoms_+1, value_msb | value_lsb);
                    outlet_list(m_outlet[0], ps_empty, 2, atoms_);
                }
                break;
            case k14bit:
                atom_setlong(atoms_, index_msb | index_lsb);
                atom_setlong(atoms_+1, value_msb | value_lsb);
                outlet_list(m_outlet[0], ps_empty, 2, atoms_);
                break;
            case kInvalid:
                break;
        }
       
    }
    
    inline void send_cc(long index, long nrpn_value){
        atom_setlong(atoms_, index);
        atom_setlong(atoms_+1, nrpn_value);
        outlet_list(m_outlet[1], ps_empty, 2, atoms_);
    }
    
    
    void listInput(t_symbol *s, long ac, t_atom *av){
        if(ac != 2){
            error("cc2nrpn expects 2-integer list input");
            return;
        }
        
        long cc_index = atom_getlong(av);
        long cc_value = atom_getlong(av+1);
        // forward
        cc(0, cc_index, cc_value);
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
    long index_lsb;
    long index_msb;
    long value_lsb;
    long value_msb;
    bool valid;
    t_atom atoms_[2];
    
    enum NrpnMode {
        kInvalid = -1,
        kTwosComplement = 0,
        k14bit
    };
    
    NrpnMode mode_;
};

extern "C" int main(void) {
	ControlToNrpn::makeMaxClass("vx.cc2nrpn");
    REGISTER_METHOD_LONG2(ControlToNrpn, cc);
    REGISTER_METHOD_LIST_DEF(ControlToNrpn, listInput);
    REGISTER_METHOD_SYMBOL(ControlToNrpn, setNrpnMode);
}