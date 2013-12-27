

Notes
-----------------------
###eeprom
Internal storage is 2048 bytes == 16 blocks of 128 .    

	0x0000 – 0x0010	 System settings   
	0x0010 – 0x05d0	 16 internal patches  
	0x05d0 – 0x07d0	 16 internal sequences  
	0x07f0 – 0x0800	 	 unused*  

(*)The unused part is now holding extra System settings for note triggers



###Special functions
Special functions
While the browse page is displayed, hold S6 and press:
• S1 to revert the current patch to init.
• S2 to program random values into all the parameters of the current patch.
• S3 to dump the current patch to the MIDI output as a SysEx block.
• S4 to bring up the global backup page.
• S5 to enable/disable the “combo” feature. When “combo” is enabled, the loading and saving of
sequences is paired. That is to say, whenever you load sequence 15, patch 15 will be loaded too... Whenever you save patch to location 33, the current sequence will be saved to location 33 too.



###Windows release build
Met standaard settings krijg je linker errors. Je moet linken tegen de static runtime /MT en de preprocessor definitie gebruiken van MAXAPI_USE_MSCRT. Daarnaast moet je nog de exclude library weghalen voor libcmt.lib.



XT doesn't work
-----------------
* shruthi/makefile still has 0.97 version in it
* knobs are echoed as ctl. grab from input and monitor\


XT Report to Olivier
--------------------------


XT changes
------------------
* warp knop -> midi clock divider
* tempo, change range to max 240
* split mode -> startscreensplash/filter/preset, removed from interface
* latch mode (hold encoder) make sysex for this?
* knob moves are transmitted as CC rather then NRPN
* midi out mode less setings no ctl
* Seq mode, remove impro and rec modes
* Link loading and saving of patch/seq
* Remove seq+lt and arp+lt seq modes
* Arpeggiator, portamento/legato and sequencer settings are now saved with the patch.
* Output midi clock when using internal tempo
* single cycle lfo mode
* modulation destinations add adsr parameters
* triggers are removed, so also from modulation source

  
Bugs
------------------
* upload klopt niet bytes = 35200 ipv 18432
* Shreditor stuurt regelmatig 2 byte messages wat is dat?

TODO
--------------------------
* als er geen mididevices zijn wordt rtmidiin en out ook niet aangemaakt. Zorg dat altijd een check is voor je funtie aanroept
* zorg dat aux port niet hetzelfde kan zijn als input, anders krijg je een loop. Ignore sysex?
* pgm change + bank select moet nu in object geregeld worden.

* opnemen in manual: In xtmode the editor does not know when the sequence is running. If the sequence is running and you send a program change, the sequencer settings in the device will not be touched. Since the editor has no way of knowing, it will always display the sequencer settings from the loaded patch. So it might not correspond to what is currently running on the device.






audiosupport 0, database 0, searchformissingfiles 0, usesearchpath 0
...leads to:

MSP/ad: no ad folder
Core Audio: No such object
pattr_obex: no such file in collective
DevicePresets.json: no such file in collective
DevicePresets.xml: no such file in collective

en nu:

No midi driver folder or default driver
MSP/ad: no ad folder
Core Audio: No such object
maxzlib: no such file in collective
maxzlib: no such file in collective
maxzlib: no such file in collective
maxzlib: no such file in collective
maxzlib: no such file in collective
maxzlib: no such file in collective
maxzlib: no such file in collective
maxzlib: no such file in collective
maxzlib: no such file in collective
maxzlib: no such file in collective
maxzlib: no such file in collective
maxzlib: no such file in collective
maxzlib: no such file in collective
pattr_obex: no such file in collective
maxzlib: no such file in collective
maxzlib: no such file in collective
maxzlib: no such file in collective
maxzlib: no such file in collective
maxzlib: no such file in collective
maxzlib: no such file in collective
maxzlib: no such file in collective
maxzlib: no such file in collective
maxzlib: no such file in collective
maxzlib: no such file in collective
maxzlib: no such file in collective
maxzlib: no such file in collective


on windows:

MSP/ad: no ad folder
ad_mme: No such object
pattr_obex: no such file in collective





overdrive is not on by default

project is showing implicit dependencies that are not correct anymore like an old pattrstorage file named ShreditorDevices.json. 


license tekst? moet er nog iets bij van een licenswe?
http://www.binpress.com/license/generator

###Test
* test editing through cirklon
* test midi clock sync

###TBI

panic / all notes off

user feedback for import export failures

maak een dirty flag voor elke working copy. output naar interface als indicatie dat een patch geedit is.

undo buffer original patch when fetched from eeprom. for each working slot. so we can reset it...

maak switch om eeprom mirror uit te schakelen, voor als mensen alleen midi in willen gebruiken 

maak defaults voor sequencer note vel ctl using tables die in preset opgeslagen worden. zoals in helpfile dumping data in live.seq
>> of makkelijke fill empty steps met waardes van de laatste

make loadPatch and loadSequence start at 1. Easier and clearer to implement in patcher

implement pgm change voor patch en sequence (zelfde als firmware met banks?)
program change output from shruthi -> request patch in editor. Gebruik != / change om feedback lloop te voorkomen.

fontawesome voor icoontjes

###M4L
Als we mirror data gaan delen tussen max en live, wat doen we dan met edit->save. File watch en reload? Als je in M4L een preset saved, hoe wordt die dan geupdate in de editor? Als workaround gewoon een handmatige mirror reload?

sequencer settings opslaan als extra eeprom on disk? Sequencer settings worden nergens opgeslagen ook niet in device. Voor M4L kan dit in instrument?

import eeprom zonder file naam te veranderen -> overwrite slot eeprom
cache / niet cache, clear eeprom 



###Later
* globale config met 1 slot in top patcher voor config file enzo

* splits de patch lijst in banks
* reset knop voor modulation
* wavetable transfer from buffer
* backup and import voor mirrors, is dit nodig?
* forward debug log to void post(C74_CONST char *fmt, ...);
* reset click op dials vooral matrix 
* default settings functie: lpf, 0 0 0 0 0 1
* json i/o of bson?
* extrasystemsettings request (note triggers)