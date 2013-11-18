

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
* midi clock negeren? noten hangen
* sysex cmd 04 is echoed to output with length 1?
* knobs are echoed as ctl. grab from input and monitor\
* portamento/legato saved with patch data?? ipv system settings
* rename osc balance to mix


XT Report to Olivier
--------------------------
* sysex message n=1 
* no progress lights during upload on the shruthi device?? 
* random bits of 256 byte sysex messages when switching midi out parameter
* programmer mode messes up whoe thing
* why midi out ctl mode dissapear?
* where is Output midi clock on/off setting
* Individual ADSR parameters are modulation destinations. Can't find them.
* als patch en sequence gekoppeld zijn. is het dan nog logisch om een program change te sturen voor sequence of alleen voor patch? (remove from firmware evt) Zelfde voor write patch/sequence. In editor zijn ze samengevoegd. Moet writeSequence nu ook bij writePatch in de sysex request?
* what is the param ctl mapping


XT changes
------------------
* warp knop -> midi clock divider
* tempo, change range to max 240
* split mode -> startscreensplash/filter/preset ?? relevant??
* latch mode (hold encoder) make sysex for this?
* knob moves are transmitted as CC rather then NRPN
* midi out mode less setings no ctl
* Seq mode, remove impro and rec modes
* Link loading and saving of patch/seq
* Remove seq+lt and arp+lt seq modes
* Arpeggiator, portamento/legato and sequencer settings are now saved with the patch.
* Output midi clock on/off setting
* single cycle lfo mode
* modulation destinations add adsr parameters


/* static */
void Editor::OnLoadSaveClick() {
  if (action_ == ACTION_LOAD) {
    action_ = ACTION_COMPARE;
    RestoreEditBuffer();
  } else if (action_ == ACTION_COMPARE) {
    action_ = ACTION_LOAD;
    OnLoadSaveIncrement(0);
  } else {
    if (!is_cursor_at_valid_position()) {
      display_mode_ = DISPLAY_MODE_OVERVIEW;
    }
    if (cursor_ >= kLcdWidth - 4) {
      Storage::WritePatch(edited_item_number());
      Storage::WriteSequence(edited_item_number());
      action_ = ACTION_LOAD;
    }
  }
}

  
Bugs
------------------
* upload klopt niet bytes = 35200 ipv 18432
* sequence verliest kleur bij editen 
* velocity wordt opgeslaten als 0. get_velocity is NIET range 0-7 maar 0-127 geen scale up dus!!

TODO
--------------------------
* als er geen mididevices zijn wordt rtmidiin en out ook niet aangemaakt. Zorg dat altijd een check is voor je funtie aanroept
* zorg dat aux port niet hetzelfde kan zijn als input, anders krijg je een loop. Ignore sysex?
* pgm change + bank select moet nu in object geregeld worden.

* opnemen in manual: In xtmode the editor does not know when the sequence is running. If the sequence is running and you send a program change, the sequencer settings in the device will not be touched. Since the editor has no way of knowing, it will always display the sequencer settings from the loaded patch. So it might not correspond to what is currently running on the device.



can I detect if a patcher is run as M4L?

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