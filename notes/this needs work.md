# This need work

## Separation of concerns

The midi class should not have to depend on VxShruthi being passed into its constructor.

`parseControlChange` could return data directly since it's synchronous.

`transferEeprom` should have a callback for progress output.

## Eeprom transfer
On transfering the eeprom I think we want to skip the internal eeprom part.

