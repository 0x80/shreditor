Shreditor User Manual
=================
*Revision: 3, November 22 2013<br/>*
Author: Thijs Koerselman


###!! Disclaimer
Please back up your data first. This is beta software. I will not feel responsible for corrupting or loosing your precious data.


1. Getting Started
------------------
These are the steps to get you up and running quickly.

###Step 1: Update the Firmware
Update your Shruthi to version 0.98 or greater. The downloads include prebuild firmware that you can use with a tool like Elektron C6 (win/osx) or Sysex Manager (osx). 

###Step 2: Configure the Midi Ports
A lot of functionality in the Shreditor uses midi sysex commands. Sysex is not tied to a specific channel, which means that all devices with the same device id (like multiple Shruthi's) connected to a port will all respond to the sysex messages passed on that port. So __make sure__ each of your Shruthi devices is connected to a different midi port when using the Shreditor.

Configure the connections to your device. The in and out ports are used for all the data traffic from the editor. The aux is an extra input to the Shruthi and can be used to connect a keyboard or other midi source to play the device.

###Step 3: Store the Device Settings
Give the device a label. Use an easy reference to tag this specific Shruthi device like "4 Pole Mission". This label is only used by the editor to remind you what device you are editing.

Now we are ready to save the port and label settings in one of the 8 available device slots. At first all of the slots will white, indicating that they are empty. Store the preset in one of the slots by hitting [shift-click]. The slot color will change to dark grey (meaning it is filled) and then blue (which means it is active). Up to 8 different devices can be configured this way.

###Step 4: Initialize the Data Mirror
In order to minimize transfer of data and to keep the UI responsive, the Shreditor keeps a copy of the device eeprom storage at all time. This way, when you load a patch, the editor knows all of the settings and you can quickly navigate without having to request the data from the device.

To start editing a device you first need to download the internal storage into the editor. You do this by going to the [Data] tab and click on the [download] button. You will see a progress bar indicating status of the data transfer. 

###Extra: Adding More Devices
If you own more than one Shruthi, and you have enough physical midi ports, you can repeat steps 2-4 for each device. The Shreditor will let you edit these devices simultaneously. You can switch back and forth and it will keep track of your edits. Please note that you *can not* connect multiple devices to the same midi port, since the software communicates with sysex and sysex messages are global and therefor not tied to any midi channel.

2. Shreditor User Manual
-------------------
![screenshot](images/shreditor_screenshot1.png)
###2.1 Introduction
...

###2.2 Feature Summary
* Clear and responsive interface.
* Control all relevant parameters including matrix, sequencer and settings.
* Bidirectional communication. Active update of patch and sequence data in the interface.
* Edit up to 8 devices simultaneously
* Copy and paste patches and sequences between devices.
* Patch list for fast preset browsing and naming.
* Import and export of data.
* Compatible with both the current v0.98 and upcoming v1.0 / XT firmware modes

###2.3 Overview
... (describe all the different functions of the interface)


###2.4 Firmware and XT mode
There were numerous additions made to the 0.97 firmware in order to allow the level of control that the Shreditor offers. They will be included in the official 0.98 release when that happens, but until then you can use the supplied firmware files from the Shreditor downloads.

Since beta 4 the application will request the firmware version from the device. When no compatible firmware is detected a message will pop up. The application now includes support for the upcoming XT / 1.0 firmware. Some fundamental changes were introduced in the XT firmware that also impact the user interface. When the application detects firmware 1.0 an orange "XT" will be displayed in the logo and the Shreditor GUI changes:

* matrix source and destination options
* warp mode becomes clock division
* midi split mode dissapeared
* sequence save options are hidden and now linked to patch data
* tempi are limited to 240 bpm
* some midi output modes are removed
* some sequencer modes are removed

###2.5 Caveats
Listed here are some things worth knowing when using the Shreditor, because they might function differently from what you would expect.

####Shruthi Midi Channel
You may have noticed the lack of a midi channel setting in the device midi configuration at the top. That is because the Shreditor can read and control the midi channel setting of the device via sysex. So when you set the correct ports, the Shreditor is already able to get the current midi channel on which the device is listening. You can change the midi channel from the editor by setting the [Channel] parameter in the [System Settings] section of the Shreditor.

####Editing on Device
The editor will reflect most edits you make using the knobs on the device, as long as you have the midi output setting set to CTRL or FULL. I suggest you use CTRL to prevent sysex to be echoed to the output. Beware that system and sequencer settings are not echoed to the output, so you better only edit those from the Shreditor interface or the mirror data will get out of sync. 

####Patch Names
* Patch names are max 8 character long. The rest will be truncated. Also Shreditor and Shruthi don't use the same character set for patch names, special characters might differ or show blank on the device.

###2.6 Known Issues
* When switching devices any playing notes can hang on the previous device

###2.7 To Be Implemented
Here is a list of things I would like to implement in the future. 

* Max4Live version. This will be a slimmed down version with mostly only parameters relevant for realtime modulation.
* JSON support for easy backup and sharing of patches
* User wavetable transfer
* Visual feedback to indicate when a patch has been edited


###2.8 Bugs & Support
Please send any bug reports or support requests to __support@vauxlab.com__