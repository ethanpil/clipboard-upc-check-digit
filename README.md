# clipboard-upc-check-digit.ahk
Generate UPC-A Check Digit From Clipboard

Version 1.0

This [autohotkey](https://www.autohotkey.com/) script will generate a the 12th digit of a UPC (check digit) from the other 11 digits in the clipboard and append it back into the number already in the clipboard.

## Usage
Requires clean plain text of 11 numbers in the clipboard to function. 

Default hotkey is **CTRL SHIFT \`**

Once you press the hotkey the program will will generate a the 12th digit of a UPC (check digit) from the other 11 digits in the clipboard and append it back into the number already in the clipboard. You can then paste it wherever its needed.

You can edit the verbose and silent variable values to change default functionality.

## Defaults

`global verbose := false`

By default there are no visual indicators to the script functioning. It silently will work on the clipbpard of there is valid data. If the `verbose` variable is `true` the script will display a message box with detailed error information and/or the final UPC in a messagebox. (In addition to copying to clipboard.

`global silent := false`

By default there are no visual indicators to the script functioning. However the script plays a audio cue indicating success or failure. If the `silent` variable is `true` then the script will not play any audio cues.

## Copyright

(C) 2022 Ethan Piliavin
Released under GNU GPL v3 License
