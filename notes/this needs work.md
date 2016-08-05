# This need work

## Transfer EEPROM to device crash
The midi outlet or data accessed from the transfer queue function results in a crash. I used to successfully use RtMidi directly, but removed that library because of clash with regular Max objects. Now all midi streams through inlets/outlets and is handled by Max standard midi objects.

I'm leaving it for now since it's not a crucial feature. Maybe we should just remove threading all together. See below.

## Threading

I used a seperate thread to output the sysex bulk data to the device. I don't think this is really neccecary and it complicates things massively so in the future we should get rid of it.

I think if we create a thread that acts as an internal clock and let its tick trigger a block transfer function in the main thread, then we're good and we don't have to remember all these data position variables but send midi to the outlet right away.

## Separation of concerns
In a refactoring phase I tried to seperate the midi and transfer classes to seperate concerns, but I only got halfway it seems and it's been a really long time now since I worked on that part.

The transfer class needs a reference to the max object to output progress messages. It also needs a handle to the midi class to output sysex. Currently both are passed in to its constructor. It seems needlessly complex and messy, and can be done in a much cleaner way probably.

## Eeprom transfer
On transfering the eeprom I think we want to skip the internal eeprom part.

