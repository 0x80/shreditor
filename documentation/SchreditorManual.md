#vx.shruthi
####Connecting Max to the Shruthi-1 DIY synthesizer
Version: beta1  
Author: Thijs Koerselman

## Disclaimer
Yes back up your stuff. This thing is in beta. I will never feel responsible for you loosing your patches, although I will try to make sure eventually this thing is completely safe and stable. 

### !!
This object will only work with Shruthi-1 firmware versions >= 0.98. At the time of writing this version is not yet released, but you can grab a working pre-0.98 version from here: 

There were numeous changes made to the previous firmware in order to allow the level of control that this object offers. Some of the firmware updates that are essential to this editor are:
- transfer / write system settings
- program change for sequence presets
- transfer of individual sequence step data
- request for bulk data transfer

### !!
Beware that sysex is not tied to a specific channel. All devices with the same device header will respond. Having multple Shruthi devices on the same midi port is something you want to **prevent** when using this editor. 

## Feature Summary
- Control over every available parameter of the device including system settings(*), routing matrix and sequence editor.
- Bidirectional communication. Active patch and sequence data is mirrored in the interface.
- Direct internal MIDI communication with device, allows for unfiltered sysex (M4L) and efficient data transfer
- Device EEPROM transfer and mirroring
- Correctly labled parameters and ranges

(*) Some settings are deliberately ignored because I don't think they make sense to expose in an editor, like display pause and parameter snap.

***
## Function Reference
Hoe maak je een object referece zodat ie past in het stramien van C74?


## Notes
###eeprom
Internal storage is 2048 bytes == 16 blocks of 128 .    

	0x0000 – 0x0010	 System settings   
	0x0010 – 0x05d0	 16 internal patches  
	0x05d0 – 0x07d0	 16 internal sequences  
	0x07f0 – 0x0800	 	 unused*  

(*)The unused part is now holding extra System settings for note triggers

### System Settings
All of the system settings are configurable from the editor, and edits are immediately stored without whe confirmation you normally have to give when editing these parameters on the device directly. Keep in mind that some parameters can be a bit tricky. For example if you decide to change the midi channel, the device will stop responding on the previous port. Since sysex is not bound to any channel, you will still be able to able to change the channel from the editor without setting the editor to the newly set channel number.



### Sequencer Settings
The sequencer settings are not stored anywhere in the Shruthi eeprom. This means that the settings are always going to be reset to defaults when you power off the device.

### Known issues
- Note trigger settings are not handled at the moment
- 

#Bugs
Portamento wil niet WTF worden??
Sequence rotation doesn't work

#ToDo
##Sooner
als je nu patch saved onder andere preset en zit spatie in de naam dan kut
editing van patch names-> clip 8 char -> update shruti, eeprom en patchlist

Update de internal mirror bij het saven van nieuwe patch

Save veranderingen in sequence. Nu worden de sequences niet uit cache gehaald?

Auto-save mirror on close

Detect filter board als je device preset switched? Wat als CEM en 4PM combineren?

Settings inklapbaar maken. Die hoef je niet de hele tijd te zien.

Kleuren en lettertypen afkijken van Live9 M4L patches


- transfer moet midi blokkeren zodat er niks gestuurd wordt als de eeprom transfer aan de gang is
- edits van parameters en sequence ook naar internal eeprom mirror. 
- presets met port/channel/eeprom mirror/ name
- autosave poll functie voor eeprom mirror?
- program change from aux input  -> load patch

- wavetable transfer from buffer
- seq pattern_size parameter

msb filter timewindow reset
midilock output 1/0 when transferring eeprom
test midi clock sync

##Later
forward debug log to void post(C74_CONST char *fmt, ...);
reset click op dials vooral matrix 
default settings functie: lpf, 0 0 0 0 0 1
json i/o
extrasystemsettings request (note triggers)
