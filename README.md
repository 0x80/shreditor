# Shreditor

An editor for the [Shruthi-1](http://mutable-instruments.net/shruthi1) DIY synthesizer.

The editor itself is built with [Max](https://cycling74.com/products/max). The core of the software is a custom Max object written in C++ called vx.shruthi which takes care of the MIDI communication and data management.

The patches and externals should work with both Max v6 and v7

## Requirements
Shruthi-1 with firmware >= v1.0

## Features
* Control all relevant parameters including matrix, sequencer and settings
* Bidirectional communication. Active update of patch and sequence data in the interface
* Edit up to 8 devices simultaneously
* Copy and paste patches and sequences between devices
* Quick patch browsing and naming
* Import and export of eeprom data

There are also some things you can not do on a Shruthi without the Shreditor:

* Load/browse a sequence of one patch while keeping the sound of the current one (xt)
* Copy-paste patches and sequences between slots and different devices
* Scramble sequence notes (keeping the pitch and velocity but randomize its position)
* Rotate sequence notes within the loop

## Usage
Build instructions for OSX and Windows are given below. The documentation on how to use the software can be fount in __build/doc__.

## Folder Structure
.
├── build : Prebuilt documentation and Shruthi-1 firmware
├── c74support : Max object SDK
├── documentation
├── notes
├── objects : XCode & VS projects for building the vx.shruthi object
└── shreditor : Max Shreditor project files

## Build the Shreditor for OSX

1) Build the vx.shruthi object using the project at __objects/Shreditor.xcodeproj__. If you hit cmd+b should output __vx.shruthi.mxo__ at __objects/bin__.

2) Copy the vx.shruthi.mxo file to shreditor/externals. This makes it available to the Max project

3) Open shreditor/Shreditor.maxproj (requires Max 6 or 7). Hit cmd + m to open the Max console. It should not display any errors.

At this point you are already able to use the Shreditor, but if you want to build a standalone application proceed to the next step.

4) Export the standalone application by going to __File > Build Collective / Application__. In the next window select __Application__ from the "File Format" menu at the bottom. Save the application somewhere on your system.

The resulting file should be an .app bundle containing an export of all the files plus the runtime core of Max to form a standalone application.

## Build the Shreditor for Windows


## Build Documentation


## Editing the Shreditor patch
The patch (and all of its abstractions) opens in __presentation mode__. Hit __cmd + alt + e__ to switch to patching mode.

In order to prevent window resizing by the user, the maximum window dimensions are limited to 980x830 to neatly contain just the UI. You can increase the maximum size by clicking on the message in the top right corner saying `window constrain 200 200 1500 1500, window exec` which sets the maximum dimensions to 1500x1500.
