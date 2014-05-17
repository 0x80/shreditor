Waar was ik
-------------------
bij selectie uit lijst of numbox

selected: 4 virgin  patchname: virgin   Fetch patch 4 from eeprom cacheFetch sequence 4 from eeprompatchname: virgin xpn: virgin selected: 4 virgin  patchname: virgin   ignored cc 0 0


* maakt een dirty flag, voor elke device simultaan, handig om te weten of je patch geedit is, maar vooral handig om te weten of een device via M4L geedit is terwijl we in Shreditor niet dat device geselecteerd hadden. Dan komen de updates namelijk niet door.

* verify connection button, doe firmware check
* reload button oranje maken als dirty flag gezet is. 
* is reload voor sequence nu gekoppeld aan patch bij XT, zo ja button weghalen. Sowieso is locatie verwarrend met de matrix ernaast.

* implement rapidjson library
* neem autozoom op in pattr van device presets

* is maximum for xt still 7 banks?


Het is fijn als devices niet perse sysex of een output connectie nodig hebben nadat je de eeprom hebt geladen. Daarvoor moeten er een paar dingen anders:
* geen firmware check bij switch. Doe firmware check ook als preflight voor eeprom request
* geen numbanks check bij switch. Numbanks moeten we ergens opslaan, in de device presets denk ik.

* test pgmchange
* loadmess wordt niet opnieuw afgevuurd als je een bestaande patch edit en savet, loadbang wel??

* note sequencer -> pgm change :)

binnenkort
--------------------
* sla eeprom op als json, dan hebben we numbanks er ook meteen inzitten, en firmware kan er ook bij
* implement banks in patchlist




beta 6 changes
-------------------

* replaced internal midi ports with max native midi handling
* removed <1.0 support
* fixed sysex headers and validation
* removed firmware check on device switch
* moved numbanks and version checks to eeprom transfer request
* improved device switching
* implemented banks instead to replace single scrolling list
* fixed bug in patch naming when hitting enter
* fast autozoom for sequencer notes
* 





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
Store alleen edits van presets < 32; Je kunt altijd op device store functie gebruiken, maar als we de reload knoppen disablen dan betekend dit dat je eeprom en device uit elkaar lopen en je opnieuw een download moet doen als je weer wil editen. Is dit irritant genoeg?

We kunnen evt ook nog eeprom leeggooien als je de applicatie afsluit of opstart. Maar dat is misschien weer TE irritant.





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

Hoe gaan we om met meerder m4l plugins voor verschillende slots. Laden we de slot data in de plugin ook? Dan moet je als je wil saven dus een "fetch live" doen in de editor.


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

GIT

git@gitlab.hku.nl:thijs.koerselman/shreditor.git
username git
pw ?

id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCij+psIu/zTxgf15gYy2p4k5aOlI+eECHD8H0whMUFc+4/FnrZovIhanVrqV+4xuT6FSCT7m81h9RwxeLg5q9l0L8H2wPYem92cd96fJhL1ofXZzmE+xvrefU1E7B9GHnEk0bkQuEmDmX8JOXZ2b+fGlkhp5qqKgVpkMHJ+kyRY0bzgFDoiYkcX6XGrU10gu0UENo8P66R9R+P3B7guuUAcbj8MCloud3uZ1LQNBG7XXTDOp+PM8Y4eNDZuizyfbcYFGKsJagAIAWPD1talWiBHPv8zbnyKP+vSIOgr3oNIeLIRR0/vi8nen4Ju3SpI0MzXmBU7tdQQquyTUvwViqT thijs.koerselman@kmt.hku.nl

Bugs
------------------
* pattr_obex: no such file in collective bij opstarten standalone




TODO
--------------------------
* gebruik live.line
* vervang toggle met live.toggle
* live.tabs?

* pgm change + bank select moet nu in object geregeld worden.

* opnemen in manual: In xtmode the editor does not know when the sequence is running. If the sequence is running and you send a program change, the sequencer settings in the device will not be touched. Since the editor has no way of knowing, it will always display the sequencer settings from the loaded patch. So it might not correspond to what is currently running on the device.




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

maak defaults voor sequencer note vel ctl using tables die in preset opgeslagen worden. zoals in helpfile dumping data in live.seq
>> of makkelijke fill empty steps met waardes van de laatste

make loadPatch and loadSequence start at 1. Easier and clearer to implement in patcher

implement pgm change voor patch en sequence (zelfde als firmware met banks?)
program change output from shruthi -> request patch in editor. Gebruik != / change om feedback lloop te voorkomen.

fontawesome voor icoontjes


###Later
* globale config met 1 slot in top patcher voor config file enzo
* splits de patch lijst in banks
* backup and import voor mirrors, is dit nodig?
* reset click op dials vooral matrix 
* json i/o?
* extrasystemsettings request (note triggers)