; clipboard-upc-check-digit.ahk
; version 1.0
; Generate a the 12th digit of a UPC (check digit) from the other 11 digits in the clipboard
; Requires clean plain text of 11 numbers in the clipboard to function
; Edit the verbose and silent variable values to change default functionality
; (C) 2022 Ethan Piliavin
; Released under GNU GPL v3 License

; Default hotkey CTRL SHIFT `
^+`::

; Verbose mode will show a Msgbox if the text is malformed or unavailable to the program
global verbose := false

; Silent mode will not play audio indicators of success or failure
global silent := false

ClipCode := clipboard

if (ClipCode is not number) {
	fail("Must have an 11 digit number in the clipboard. Not a number: " ClipCode)
}	

Length := StrLen(ClipCode)
	
if (Length != 11) {
	fail("Must have an 11 digit number in the clipboard. Length is: " Length) 
}

clipboard := UPC_Check_Digit(ClipCode)
success(clipboard)

success(message){
	if (verbose = 1) {
		MsgBox %message%
	}
	if (silent = 0) {
		SoundBeep 350, 100
		SoundBeep 500, 100
	}
	Exit
}

fail(message){
	if (verbose = 1) {
		MsgBox %message%
	}
	if (silent = 0) {
		SoundBeep 500, 100
		SoundBeep 350, 100
	}	
	Exit
}

UPC_Check_Digit(num){ ; https://en.wikipedia.org/wiki/Universal_Product_Code#Check_digit_calculation
    for k, v in StrSplit(num)
        if mod(A_Index, 2)
            odd += v
        else
            even += v
    return num . 10-mod(odd*3+even, 10)
}
