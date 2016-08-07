Shreditor User Manual
=================

![screenshot](images/shreditor-ui.png)

Overview
------------------

### Features
* Control every parameter and setting including matrix, sequencer and settings
* Bidirectional communication updates the software when you tweak the hardware
* Edit up to 8 devices simultaneously
* Copy and paste patches and sequences between devices
* Quick patch browsing and naming
* Import and export of eeprom data
* Support for different filter boards

There are also some things you can not do on a Shruthi device without the Shreditor:

* Load/browse a sequence of one patch while keeping the sound of the current one (xt)
* Copy-paste patches and sequences between slots and different devices
* Scramble sequence notes (keeping the pitch and velocity but randomize its position)
* Rotate sequence notes within the loop


###Firmware
Shreditor only supports firmware 1.0 and up.

Setting Up
------------------
These are the steps to get you up and running quickly. You typically only have to go through these steps once.

###Step 1: Update Firmware to >1.0
Make sure your Shruthi runs firmware version 1.0 or greater. You can update with a free tool like Elektron's C6 (win/osx) or Sysex Manager (osx). The firmware releases can be found here: [http://mutable-instruments.net/static/firmware/](http://mutable-instruments.net/static/firmware/)

###Step 2: Configure MIDI Ports
A lot of functionality in the Shreditor uses midi sysex commands. Sysex is not tied to a specific channel, which means that all devices with the same device id (like multiple Shruthi's) connected to a port will all respond to the sysex messages passed on that port. So _make sure each of your Shruthi devices is connected to a different midi port_ when using the Shreditor.

In the Shreditor *Devices* tab, configure the connections to your device. The midi in/out ports should be connected to your Shruthi. The optional "Ctrl in" is an extra input to the Shruthi and can be used to connect a keyboard or other midi source to play the device.

###Step 3: Store the Device Settings
In the *Devices* tab enter a label for your Shruthi, for example "4 Pole Mission". This label is only used by the editor to remind you what device you are editing, which is useful since you can edit up to 8 different Shruthi's simultaneously.

Now you are ready to store the device settings in one of the 8 available slots. At first all of the slots will appear white, indicating that they are empty. Store the preset in one of the slots by hitting [shift-click]. The slot color will change to dark grey (meaning it is filled) and then blue (which means it is active). Up to 8 different devices can be configured this way.

###Step 4: Download the data from the device
In order to minimize transfer of data and to keep the UI responsive, the Shreditor keeps a copy of the device internal eeprom storage at all time. This way, when you load a patch, the editor knows all of the settings instantly and you can navigate without having to request the data from the device.

You can request the data from the Shruthi by going to the *Data* tab and click on the [request] button. You will see a progress bar indicating the status of the data transfer.

After the transfer has completed you should see all of your patches show up in the banks on the left side. You can now start tweaking!

###Optional: Add More Devices
If you own more than one Shruthi, and you have enough physical midi ports, you can repeat steps 2-4 for each device. The Shreditor will let you edit these devices simultaneously. You can switch back and forth and it will keep track of your edits. Please note that you *can not* connect multiple devices to the same midi port, since the editor communicates with sysex and sysex messages are not tied to any midi channel.


Caveats
------------
Listed here are some things worth knowing when using the Shreditor, because they might function differently from what you would expect.

###Shruthi MIDI Channel
You may have noticed the lack of a midi channel setting in the device midi configuration at the top. That is because the Shreditor can read and control the midi channel setting of the device via sysex. So when you set the correct ports, the Shreditor is already able to get the current midi channel on which the device is listening. You can change the midi channel from the editor by setting the [Channel] parameter in the [System Settings] section of the Shreditor main UI.

###Editing on Device
The editor will reflect most edits you make using the knobs on the device, as long as you have the midi output setting set to CTRL or FULL. I suggest you use CTRL to prevent sysex to be echoed to the output. Beware that system and sequencer settings are not echoed to the output, so you better only edit those from the Shreditor interface or the mirror data will get out of sync.

###Patch Names
Patch names can be maximum 8 character long, the rest will be truncated. The Shreditor and Shruthi don't use the same character set for patch names, special characters might show up blank on with a different character on the device.
