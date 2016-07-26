Shreditor Change Log
=====================

1.0
-------------------
* Released as open source

Beta 8
-------------------
* Removed demo expiration. Shreditor will be free.
* Bumped Max version to 7.0.3

Beta 7
-------------------
* Windows version is back
* Updated to Max7
* Fixed "pattr_obex: no such file in collective" error

Beta 6
-------------------
* Implemented patch banks to replace single scrolling list
* Replaced vx.shruthi internal midi ports with external Max native midi handling
* Removed <1.0 support
* Fixed sysex headers and validation
* Removed firmware check on device switch
* Moved numbanks and version checks to eeprom transfer mechanism
* Implemented banks to replace patch scrolling list
* Fixed bug in patch naming when hitting enter
* Faster autozoom for sequencer interface

Beta 5
----------------
* New data root for Windows, solving user permission issues.
* Now supports OS 10.5 and 10.6. Use of c++0x features made it >=10.7
* GUI improvements
* Expired and init fail alert popups
* Printing version and expiration date from code
* Added mapping of incoming CC from knob movements for xt firmware.
* List option --none-- for midi ports
* Throttle system setting sysex updates to prevent overloading device on mouse drag.
* Fixed feedback of system settings sysex when selecting midi poly chain modes.
* Added labels for DigitalFx mode and program parameters
* Fixed NRPN sending two invalid 2 byte messages on parameter index change
* Corrected midi out modes for xt
* Added support for Steiner Parker filter board (xt only)

Beta 4
----------------
* Implemented XT compatibility mode, supporting firmware 1.0.
* Firmware version checks through sysex.
* Fixed bug where invalid sysex from Shruthi could corrupt editor midi handling.
* Fixed crash when sending NRPN to invalid midi port.
* User confirm popup warning when uploading data to device.
* Fixed bug in sequencer velocity data interpretation.
* Additional filter settings correctly stored locally.
* Operator settings correctly stored locally.
* Sequencer pgm change now uses MSB in 0.98 to match 1.0.
* Matrix modulation reset buttons.
* Fixed crashes when using the interface without first selecting a device slot.

Beta 3
---------------
* Windows XP support
* OSX Mavericks support (Max 6.1.5)

Beta 2
-------------
* Initial Windows release.
* Integrated midi aux input.
* Implemented midiinfo like behavior for populating port menus.
* Refactored midi port handling to adapt to Windows MM behavior.
* Fixed reversed midi in out port selection.
* More compact UI to fit Macbook Air screen.
* Minor UI tweaks.
* Fixed patch names to proper zero terminate.
* Limit sequence load/save to device capacity.

Beta 1
-------------
* Initial release for OSX
