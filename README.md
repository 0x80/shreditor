# Shreditor

An editor for the Shruthi-1 DIY synthesizer.

The editor itself is built with [Max](https://cycling74.com/products/max). The core of the software is a custom Max object written in C++ called vx.shruthi which takes care of the MIDI communication and data management.

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

## Parts

### Shreditor.maxproj
The Max project combining serveral patches

### vx.shuthi.mxo / mxe
These are Max externals

## Build for OSX

1) Build the vx.shruthi object using the project at __objects/Shreditor.xcodeproj__. If you hit cmd+b should output __vx.shruthi.mxo__ at __objects/bin__.

2) Copy the file to shreditor/externals. This makes it available to the Max project

3) Open shreditor/Shreditor.maxproj with Max v7

### Bulid


## Build Windows




## Build Documentation
