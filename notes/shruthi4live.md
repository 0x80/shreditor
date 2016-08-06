# Shruthi4Live

It was my intention to release an instrument for Ableton Live to control the Shruthi using the same core vx.shruthi object. I ran into several unforseen difficulties and eventually out of time.

It should be quite easy now to take parts of the Shreditor interface and place them in a Max4Live patch. Beware that M4L doesn't support sysex so you're limited to the parts that use CC communication.

I initially used the RtMidi library to have more control over midi, and have full sysex control which (at the time of writing) wasn't supported by the Max4Live MIDI API.

The use of the low level RtMidi library in vx.shruthi seemed to clash with the use of standard Max midi object in the same environment. One would block access to midi ports for the other.

To work around this I decided to only expose the bare minimum CC for the instrument leaving out all sysex, and output all midi as messages from vx.shruthi to pass on to the standard midi objects.


