// MIDI CC constants
var CC_DATA_MSB = 6;
var CC_DATA_LSB = 38;
var CC_NRPN_LSB = 98;
var CC_NRPN_MSB = 99;

// inlets and outlets
inlets = 1;
outlets = 2;

// global variables and arrays
var nrpn_index;
var value;
var nrpn_index_lsb;
var nrpn_index_msb = 0;
var value_lsb;
var value_msb = 0;
var cc_index;
var cc_value;

// methods start here

// list - expects a CC Index + Value as argument
// filters out NRPN and RPN values and assigns to variables
// Passes through all other CCs
function list(val)
{
    if(arguments.length==2)
    {
        cc_index = arguments[0];
        cc_value = arguments[1];

        switch(cc_index)
        {
        case CC_DATA_MSB:
            // If we have a valid NRPN index, then the data is valid
            if(nrpn_index)
            {
                value_msb = cc_value << 7;
                if(value_lsb)
                {
                    value = value_msb | value_lsb;
                    // We are now ready to send an index and value out!
                    send_nrpn(nrpn_index, value);
                }
            }
            // If we don't have an index it's invalid
            else
            {
                // So forward the value as a normal CC
                send_cc(cc_index, cc_value);
            }
            break;
        case CC_DATA_LSB:
            // If we have a valid NRPN index, then the data is valid
            if(nrpn_index)
            {
                value_lsb = cc_value;
                value = value_msb | value_lsb;
                // We are now ready to send an index and value out!
                send_nrpn(nrpn_index, value);
            }
            // If we don't have an index it's invalid
            else
            {
                // So forward the value as a normal CC
                send_cc(cc_index, cc_value);
            }
            break;
        // NRPN Index MSB - 7 high bits
        case CC_NRPN_MSB:
            // Save 7 high bits
            nrpn_index_msb = cc_value << 7;
            // Create the 14 bit NRPN index
            nrpn_index = nrpn_index_msb | nrpn_index_lsb;
            break;
       // NRPN Index LSB - 7 low bits
        case CC_NRPN_LSB:
            // Save 7 low bits
            nrpn_index_lsb = cc_value;
            // Create the 14 bit NRPN index
            nrpn_index = nrpn_index_msb | nrpn_index_lsb;
            break;
        default:
            send_cc(cc_index, cc_value);
            break;
        }
    }
}

// Send CC: Forward CC index and value to output 0
function send_cc(i, v)
{
    outlet(0, i, v);
}

// Send NRPN: Send NRPN index and value to output 1
function send_nrpn(i, v)
{
    outlet(1, i, v);
    value = null;        // reset the parsed value
    value_lsb = null;    // reset the LSB of the value
}
