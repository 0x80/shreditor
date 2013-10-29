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


Bugs
------------------
* debugger wil niet attachen
* make blank (no input) midi port option default

TODO
--------------------------
* remove locks 
* cache all ports on startup for windows at least
* zorg dat aux port niet hetzelfde kan zijn als input, anders krijg je een loop. Ignore sysex?


can I detect if a patcher is run as M4L?

audiosupport 0, database 0, searchformissingfiles 0, usesearchpath 0
...leads to:

MSP/ad: no ad folder
Core Audio: No such object
pattr_obex: no such file in collective
DevicePresets.json: no such file in collective
DevicePresets.xml: no such file in collective


overdrive is not on by default

project is showing implicit dependencies that are not correct anymore like an old pattrstorage file named ShreditorDevices.json. 


license tekst? moet er nog iets bij van een licenswe?
http://www.binpress.com/license/generator

###Test
* test editing through cirklon
* test midi clock sync
* test of write eeprom on close / exit works

###TBI

limit sequencer max with numbanks

panic / all notes off

user feedback for import export failures

maak een dirty flag voor elke working copy. output naar interface als indicatie dat een patch geedit is.

undoriginal patch when fetched from eeprom. for each working slot. so we can reset it...

maak switch om eeprom mirror uit te schakelen, voor als mensen alleen midi in willen gebruiken 

windows versie voor eeprom pad in eepromFilepath in pEepromData

maak defaults voor sequencer note vel ctl using tables die in preset opgeslagen worden. zoals in helpfile dumping data in live.seq
>> of makkelijke fill empty steps met waardes van de laatste

make loadPatch and loadSequence start at 1. Easier and clearer to implement in patcher

implement pgm change voor patch en sequence (zelfde als firmware met banks?)
program change output from shruthi -> request patch in editor. Gebruik != / change om feedback lloop te voorkomen.

channel message c0 is bank select

sequence data wordt opgevraagd bij device switch. dat zou gewoon alleen eeprom moeten zijn toch? Nou misschien ontkomen we er niet aan. requestSequencerSettings vraagt alles op incl pattern. Maar we kunnen sequencer settings in de preset opslaan samen met de mirror. Of binair bij de mirror data.

midi merge input weghalen? is eigenlijk niet nodig toch?

defer_low op midi port switch?

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