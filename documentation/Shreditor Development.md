app bouwen
* remove resources/max/clang
* remove externals/msp + jitter


Waar was ik
-------------------
bij selectie uit lijst of numbox

selected: 4 virgin  patchname: virginFetch patch 4 from eeprom cacheFetch sequence 4 from eeprompatchname: virginxpn: virginselected: 4 virgin  patchname: virginignored cc 0 0
* check hoe je strak program changes kunt sturen, waarom lijkt m4l zo traag?* init van cellblock zorgt nog steeds dat patches geladen worden. 0 32 64 96 etc.

* maakt een dirty flag, voor elke device simultaan, handig om te weten of je patch geedit is, maar vooral handig om te weten of een device via M4L geedit is terwijl we in Shreditor niet dat device geselecteerd hadden. Dan komen de updates namelijk niet door.

* reload button oranje maken als dirty flag gezet is.
* is reload voor sequence nu gekoppeld aan patch bij XT, zo ja button weghalen. Sowieso is locatie verwarrend met de matrix ernaast.

* implement rapidjson library
* neem autozoom op in pattr van device presets

* test pgmchange
* note sequencer -> pgm change :)


Bugs
----------
* sequencer tempo en mode worden niet opgeslagen/teruggehaald
* er gaat niet niet goed met rotation in sequencer settings. You lijkt niet opgeslagen te worden, en na terughalen is de sequence niet zelfde. Rotate zou altijd bij laden op 0 gezet moeten worden denk ik, want hij wordt gebruikt bij het vormen van de sequence die wordt opgeslagen, maar daarna is de sequence vast als je hem terughaalt.
* matrix keuze beinvloed de lfo sync setting wat vreemd?






Notes
-----------------------
###eeprom
Internal storage is 2048 bytes == 16 blocks of 128 .

	0x0000 – 0x0010	 System settings
	0x0010 – 0x05d0	 16 internal patches  
	0x05d0 – 0x07d0	 16 internal sequences  
	0x07f0 – 0x0800	 	 unused*  

(*)The unused part is now holding extra System settings for note triggers




###Windows release build
Met standaard settings krijg je linker errors. Je moet linken tegen de static runtime /MT en de preprocessor definitie gebruiken van MAXAPI_USE_MSCRT. Daarnaast moet je nog de exclude library weghalen voor libcmt.lib.



Betaalde versie
------------------------------

# wat is er nodig

* m4l device met udp sync verbinding
* manier vinden om multiple devices te supporten. mogelijk weer extra code voor get request van willekeurige patch in
* decrypt in windows en mac external
(http://stackoverflow.com/questions/12306956/example-of-aes-using-crypto)
* paypal opzetten met hook naar serial generator / mail server
* demo restrictie zetten op de shreditor (save helemaal disabled, max 1 device)
* gedoe met VAT voor buitenland
* instructie videos maken

# wat levert het op
* 5000?


# Moeilijkheden
* M4L is simultaan, maar shreditor kan maar 1 bijhouden. Hoe ga je dan de eeprom updaten van degene die niet in focus zijn? Misschien helemaal niet updaten: bij switch in shreditor vraag je de huidige parameters op van M4L? Maar als je nu nog niet in focus bent geweest dan weet M4L ook nog niet de juiste parameter standen-> in andere woorden hoe kan M4L de parameters opvragen van een device die niet in de Shreditor focus is? Dat kan dus niet. Moet M4L dan toch zijn eigen vx.shruthi instance hebben voor iedere track? Of maken we een get request voor vx.shruthi waarbij je de patch van iedere eeprom slot kan opvragen ongeacht de device focus.
* editen m4l + shreditor is misschien niet heel intuitief voor andere gebruikers. Lastig om goede workflow te creeren
* editor naast m4l draaien als must ook niet echt lekker
* ga je de patch index koppelen tussen shreditor en m4l? Misschien ook niet echt praktisch.
* (zie alt 2) edits die vanaf live gestreamed komen moeten wel eeprom aanpassen maar niet ook nog voor de tweede keer naar device gestuurd worden. Dan moet er wellicht een aparte input message komen voor vx.shruthi die dan de eeprom en ui update zonder midi uit te sturen. Een "sync" message ofzo.



# Alternatief
* wachten tot m4l sysex aankan en dan een device maken die gewoon 1 op 1 communiceert wel zo makkelijk
* een mac only m4l versie met rtmidi intern
* verder gaan met je leven en niet meer omkijken

# Alternatief 2
een uitgekleede m4l versie maken die niet samen met shreditor gebruikt hoeft te worden:

* je gaat uit van eeprom zoals die al op disk is, dus je moet eerst in shreditor eeprom downloaden.
* midi gaat gewoon rechtstreeks naar device
* je kiest een preset en begint te tweaken
* geen save in m4l
* in schreditor maak een "fetch from device" zodat je getweakte patches wel weer kan saven daar. (misschien zelfde als huidige refresh kop?) (als device in focus is zou je de veranderingen kunnen streamen over udp)
* je maakt een eeprom "refresh" knop in m4l zodat je een geedite patch van schreditor kunt "ophalen" (dit kan ook via udp getriggered worden)
* je zou zelfs de device focus van live kunnen koppelen aan de slot selectie in shreditor, zodat als je in live editing de veranderingen altijd opgepikt worden in shreditor. Dat geldt dan niet voor modulatie van devices die niet in focus zijn in live maar is dat erg?




Shreditor4Live Version
----------
* Alleen parameters die je zou willen kunnen moduleren. Evt matrix ook, maar dan de mapping niet moduleerbaar.
*

De mirror wordt gebruikt om de parameters weer te geven.

*  


### device selection
In live selecteer je per instrument maar 1 device.


### save
Save functie is alleen beschikbaar vanuit de editor omdat het sysex is. Exclude save functie in m4l. Edits opslaan gebeurt alleen in Shreditor. Maak een "reload / fetch live" knop die de huidige stand opvraagt van parameters

### Comminicatie
UDP poort is een idee. Maar moet niet verplicht zijn. Live instrumenten moeten ook gewoon op zichzelf kunnen draaien. Een apart device maken voor de communicatie met de shreditor, die kan dan 1 server hebben en via s/r communiceren met de devices.

Elke parameter modulatie in live zou doorgestuurd kunnen worden naar shreditor, alles is meteen zichtbaar. De dirty state is dan nog steeds nodig om te weten of je een patch opnieuw wil opslaan of niet. Wel een throttle op zetten wellicht omdat modulatie in live heel snel kan gaan en dat is niet nodig voor weergave in shreditor. Andersom zou ook kunnen. Dat als je edit in shreditor de parameter in live ook meegaat.

### dirty state
De dirty vlag zou ook intelligent geimplementeerd kunnen worden. Dan moet je voor elke patch bijhouden welke parameter er verandert is en vergelijken met de preset. Als de parameter dan, na modulatie of editing weer terug staat op de originele waarde, dan zou je de dirty vlag dus weer uit kunnen zetten. Dit is wel meer werk uiteraard maar voor toekomst misschien wel tof omdat de modulatie van live dan niet perse altijd lijkt op edits.

### Live output
* device x preset switch
*


### Nice to have
* De reload knop moet oplichten als de patch in live verandert. Dit zou kunnen door in vx.shruthi een dirty flag bij te houden. Het is alleen wel zo dat je in live meerdere shruthis kan aansturen, dus de dirty flag van elk instrument moet in een array opgeslagen worden in de shreditor. Zodat als je in de shreditor van device switched de reload knop aan of uit kan gaan voor dat device. De dirty state kan gecommuniceerd worden over udp maar evt ook gewoon een file die gepolled wordt.
* Kan evt een udp poort gebruiken om te communiceren vanaf m4l naar schreditor voor specifieke dingen zoals store patch

### ??
* Wat doen we als de shreditor preset switcht? Hoe pikken we dat op in m4l, of niet? Via een textfile met autowatch? Of een udp connectie?

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
