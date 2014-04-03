

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

Demo restricties
------
* store alleen edits van presets < 32; nadeel dit kan je altijd op device doen, misschien in combinatie met recall. Dus ook niet opvragen van presets 
* stuur parameter glitch elke zoveel seconden; hier heb je geen last van als je klaar bent met editen
* force new mirror download na elke application restart; irritant voor gebruikers en kan clashen met m4l versie



Shreditor4Live Version
----------
Hou het simpel. Zorg dat live en standalone samen kunnen werken. Alleen parameters die je zou willen kunnen moduleren; de nrpns. Zo kunnen we altijd later nog een windows versie maken als de nrpns gestuurd worden door normale max objecten.

De mirror wordt gebruikt om de parameters weer te geven.

save functie?? dit kan problemen geven:
* de save functie is sysex
* wat als de sequence geedit wordt in de standalone en de patch in de m4l.

oplossing:
Exclude save functie in m4l. Edits opslaan gebeurt alleen in Shreditor. Maak een "fetch live" knop die de huidige ongesavede stand opvraagt van parameters en sequence, met de juiste index nummers en patch name.


Maak de xt non xt switch manual. 

Kan evt een udp poort gebruiken om te communiceren vanaf m4l naar schreditor voor specifieke dingen zoals store patch

?? Wat doen we als de shreditor preset switcht? Hoe pikken we dat op in m4l, of niet? Via een textfile met autowatch? Of een udp connectie?


### Include
* alle nrpns incl matrix
* mirror selector
* preset dropdown


### Exclude
* save functie
* sequencer
* system settings
* eeprom down/upload
* patchlist
* serial 

### Extra
* eeprom filewatch -> auto reload, om te zorden dat als edits gesaved worden in shreditor ze ook opgepikt worden in m4l mirror




XT doesn't work
-----------------
* shruthi/makefile still has 0.97 version in it
* knobs are echoed as ctl. grab from input and monitor\


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
* pattr_obex: no such file in collective bij opstarten standalone



Process:         Shreditor beta4 [9010]
Path:            /Users/USER/Documents/*/Shreditor beta4.app/Contents/MacOS/Shreditor beta4
Identifier:      com.cycling74.MaxRuntime
Version:         6.1.7 [db5f11a] (6.1.7)
Code Type:       X86 (Native)
Parent Process:  launchd [155]
Responsible:     Shreditor beta4 [9010]
User ID:         505

Date/Time:       2014-04-03 21:30:09.426 +0200
OS Version:      Mac OS X 10.9.2 (13C64)
Report Version:  11
Anonymous UUID:  9D694D1B-27FC-7738-3435-C412929CDD24

Sleep/Wake UUID: 78685549-2D08-4923-85B3-F2CE05A89EE4

Crashed Thread:  0  Dispatch queue: com.apple.main-thread

Exception Type:  EXC_BAD_ACCESS (SIGBUS)
Exception Codes: KERN_PROTECTION_FAILURE at 0x0000000000000004

VM Regions Near 0x4:
--> __PAGEZERO             0000000000000000-0000000000001000 [    4K] ---/--- SM=NUL  /Users/USER/Documents/*/Shreditor beta4.app/Contents/MacOS/Shreditor beta4
    __TEXT                 0000000000001000-00000000005e3000 [ 6024K] r-x/rwx SM=COW  /Users/USER/Documents/*/Shreditor beta4.app/Contents/MacOS/Shreditor beta4

Thread 0 Crashed:: Dispatch queue: com.apple.main-thread
0   vx.shruthi                    	0x0d5f91bc VxShruthi::populateMidiPortMenus(long) + 170 (vx.shruthi.cpp:249)
1   vx.shruthi                    	0x0d5ff9e2 MaxCppBase<VxShruthi>::MaxMethod<&(VxShruthi::populateMidiPortMenus(long))>::call(VxShruthi*) + 30 (maxcpp6.h:161)
2   com.cycling74.MaxRuntime      	0x0000c009 ob_funcall + 74
3   com.cycling74.MaxRuntime      	0x0001be0e typedmess_fun + 326
4   com.cycling74.MaxRuntime      	0x000602b8 outlet_anything + 914
5   com.cycling74.MaxRuntime      	0x0001bd2f typedmess_fun + 103
6   com.cycling74.MaxRuntime      	0x000602b8 outlet_anything + 914
7   com.cycling74.MaxRuntime      	0x00050a06 through_sendit + 193



TODO
--------------------------
* gebruik live.line
* vervang toggle met live.toggle
* vervangt buttons met textbutton
* redetect firmware button?
* live.tabs?
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