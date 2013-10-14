Shreditor User Manual
=================
Revision: 1  
Author: Thijs Koerselman

###!! Disclaimer
Please back up your data first. This is beta software. I will not feel responsible for corrupting or loosing your patches.

Getting Started
------------------
These are the nessecary steps to get you started quickly.

###Step 1: Update Firmware
The Shreditor will only work with Shruthi-1 firmware versions >= 0.98. At the time of writing this version is not yet released. The correct firmware should be included in the Shreditor software bundle. 

There were numerous additions made to the 0.97 firmware in order to allow the level of control that this object offers. Some of the firmware updates that are essential to this editor are:
- transfer / write system settings
- program change for sequence presets
- transfer of individual sequence step data
- request for bulk data transfer

###Step 2: One Shruthi Per Port
A lot of functionality in the Shreditor uses midi sysex commands. Sysex is not tied to a specific channel, which means that all devices with the same device id (like Shruti's) connected to a port will respond to all sysex messages passed on that port. So **make sure** each of your Shruthi devices is connected to a different midi port when using the Shreditor.

###Step 3: Initializing
Shreditor minimiz



Overview
-------------------
###Introduction


###Feature Summary
* Control over every (*) available parameter including matrix, sequencer and settings.
* Bidirectional communication. Active update of patch and sequence data in the interface.
* Edit up to 8 devices simultaneously
* Direct low level communication with hardware, bypassing standard Max MIDI objects.
* Device data transfer and mirroring
* Correctly labeled parameters and ranges
* Copy-paste patches between devices
* Patch list for fast browsing with renaming
* Import and export of backups and patches


(*) Some settings are deliberately ignored because I don't think they make sense to expose in an editor, like display pause and parameter snap. Also note triggers and cv input are not exposed atm. 




Caveats
-----------------------
###System Settings
All of the system settings are configurable from the editor, and edits are immediately stored without the confirmation you normally have to give when editing these parameters on the device directly. 

###Sequencer Settings
The sequencer settings are not stored anywhere in the Shruthi eeprom. This means that the settings are always going to be reset to defaults when you power off the device.

* Parameters are echoed as ctl messages, system settings and sequencer are not. If you use the editor you better not use the physical interface.
* Patch names are max 8 character long. The rest will be truncated.

###Editing on Device
While the editor is open it will reflect most edits you make using the knobs on the device, as long as you have the midi output setting set to CTRL or FULL. I suggest you use CTRL to prevent sysex to be echoes to the output. Beware that system settings are not echoed to the output, so you better only edit those from the Shreditor interface. When you edit settings from Shreditor, there is no confirmation as with the hardware interface. Every parameter change is immediately transferred and stored on the device. 



### Known Issues & Caveats
* Max and shruthi firmware don't use the same character set for patch names, special characters might differ.
* When switching devices any playing notes will hang on the previous device
* Note trigger settings are not handled at the moment


