Shreditor
=================
Version: beta1  
Author: Thijs Koerselman

### Disclaimer
Yes back up your stuff. This thing is in beta. I will never feel responsible for you loosing your patches, although I will try to make sure eventually this thing is completely safe and stable. 


!! Important
------------------

###Use Correct Firmware
This object will only work with Shruthi-1 firmware versions >= 0.98. At the time of writing this version is not yet released, but you can grab a working pre-0.98 version from here: 

There were numerous changes made to the previous firmware in order to allow the level of control that this object offers. Some of the firmware updates that are essential to this editor are:
- transfer / write system settings
- program change for sequence presets
- transfer of individual sequence step data
- request for bulk data transfer

###One Shruthi Per Port
Beware that sysex is not tied to a specific channel. All devices with the same device id connected to a port will respond, so **make sure** each of your Shruthi devices has its own midi port when using the Shreditor.

###Editing on Device
While the editor is open it will reflect most edits you make using the knobs on the device, as long as you have the midi output setting set to CTRL or FULL. I suggest you use CTRL to prevent sysex to be echoes to the output. Beware that system settings are not echoed to the output, so you better only edit those from the Shreditor interface. When you edit settings from Shreditor, there is no confirmation as with the hardware interface. Every parameter change is immediately transferred and stored on the device. 


Feature Summary
-------------------
- Control over every (*) available parameter including matrix, sequencer and settings.
- Bidirectional communication. Active update of patch and sequence data in the interface.
- Edit up to 8 devices simultaneously
- Direct low level communication with hardware, bypassing standard Max MIDI objects.
- Device data transfer and mirroring
- Correctly labeled parameters and ranges
- Copy-paste patches between devices
- Patch list for fast browsing with renaming
- Import and export of backups and patches


(*) Some settings are deliberately ignored because I don't think they make sense to expose in an editor, like display pause and parameter snap. Also note triggers and cv input are not exposed atm. 





Getting Started
------------------------



Caveats
-----------------------
### System Settings
All of the system settings are configurable from the editor, and edits are immediately stored without the confirmation you normally have to give when editing these parameters on the device directly. 

### Sequencer Settings
The sequencer settings are not stored anywhere in the Shruthi eeprom. This means that the settings are always going to be reset to defaults when you power off the device.

* Parameters are echoed as ctl messages, system settings and sequencer are not. If you use the editor you better not use the physical interface.
* Patch names are max 8 character long. The rest will be truncated.

Object Function Reference
------------------------
Hoe maak je een object reference zodat ie past in het stramien van C74?



Notes
-----------------------
###eeprom
Internal storage is 2048 bytes == 16 blocks of 128 .    

	0x0000 – 0x0010	 System settings   
	0x0010 – 0x05d0	 16 internal patches  
	0x05d0 – 0x07d0	 16 internal sequences  
	0x07f0 – 0x0800	 	 unused*  

(*)The unused part is now holding extra System settings for note triggers


Sequences stored in presets are only the 16 step data. No size or rotation. All other sequencer settings are global and not stored anywhere in eeprom. Moeten size en rotation dan niet buiten seq interface geplaatst worden?


### Known issues
* Max and shruthi firmware don't use the same character set for patch names, special characters might differ.
* When switching devices any playing notes will hang on the previous device
* Note trigger settings are not handled at the moment
* Sometimes device presets don't load, and slots stay empty. Restart app.
* 

Bugs
------------------
* storing patch changes doestn't write to eeprom
* Sequence rotation doesn't work
* helft van de modulation matrix doet niks?
* copy/paste sequence doesn't work


TODO
--------------------------

###Test
* test editing through cirklon
* wanneer gebeurt er een eeprom save naar disk? closebang? timer?
* test midi clock sync

###Implement
!! store a working copy for patch and sequence for each device. When devices are switched, request numbers but output patch and sequencer data from working copy. That way you can edit two patches without loosing the changes. Because changes are not stored in eeprom yet.



nrpn for pattern rotation 

maak switch om eeprom mirror uit te schakelen, voor als mensen alleen midi in willen gebruiken 

windows versie voor eeprom pad in eepromFilepath in pEepromData

lichte kleur cursor in name veld

implement pgm change voor patch en sequence (zelfde als firmware met banks?)
program change output from shruthi -> request patch in editor. Gebruik != / change om feedback lloop te voorkomen.

channel message c0 is bank select

sequence data wordt opgevraagd bij device switch. dat zou gewoon alleen eeprom moeten zijn toch? Nou misschien ontkomen we er niet aan. requestSequencerSettings vraagt alles op incl pattern. Maar we kunnen sequencer settings in de preset opslaan samen met de mirror. Of binair bij de mirror data.

cache eeprom voor alle device slots intern (in memory) zodat we geen files hoeven uit te lezen bij switch?

midi merge input weghalen? is eigenlijk niet nodig toch?

fontawesome voor icoontjes

###M4L
Als we mirror data gaan delen tussen max en live, wat doen we dan met edit->save. File watch en reload? Als je in M4L een preset saved, hoe wordt die dan geupdate in de editor? Als workaround gewoon een handmatige mirror reload?

sequencer settings opslaan als extra eeprom on disk? Sequencer settings worden nergens opgeslagen ook niet in device. Voor M4L kan dit in instrument?

import eeprom zonder file naam te veranderen -> overwrite slot eeprom
cache / niet cache, clear eeprom 

* worden de operators opgeslagen in patch nu?
* Save internal mirror + preset bij het store van shruthi patch en sluiten app
* edits van parameters en sequence ook naar internal eeprom mirror. 
* program change from aux input  -> load patch
* seq pattern_size parameter
* seq rotation?
* eens in de zoveel tijd moet nrpm msb cache gereset worden. in iedergeval bij device switch
* msb filter timewindow reset
* midilock output 1/0 when transferring eeprom
* replace post met DPOST

###Later
* globale config met 1 slot in top patcher voor config file enzo
* implement firmware request for version string (read splash screen)
* splits de patch lijst in banks
* implement command in firmware to signal transfer finished.
* credits/about
* reset knop voor modulation
* wavetable transfer from buffer
* backup and import voor mirrors, is dit nodig?
* forward debug log to void post(C74_CONST char *fmt, ...);
* reset click op dials vooral matrix 
* default settings functie: lpf, 0 0 0 0 0 1
* json i/o of bson?
* extrasystemsettings request (note triggers)
