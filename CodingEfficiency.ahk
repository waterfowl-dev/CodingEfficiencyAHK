#Requires AutoHotkey v2.0

; makes right alt act as backspace. I find it to be much more ergonomic, and I never use right alt anyways
RAlt::Backspace

CapsLock::return                 ; disable normal caps lock
SetCapsLockState "AlwaysOff"     ; try to keep LED off

;arrow keys on EDSF while capslock held
CapsLock & e:: Send "{Up}"
CapsLock & d:: Send "{Down}"
CapsLock & s:: Send "{Left}"
CapsLock & f:: Send "{Right}"

;word jump (control+arrow) with WR while capslock held
CapsLock & w:: Send "^{Left}"
CapsLock & r:: Send "^{Right}"

; smooth scroll (kinda like pageup/down) with TG while capslock held
CapsLock & t::
{
    Loop 5
    {
        Send "{Up}"
        Sleep 10
    }
}

CapsLock & g::
{
    Loop 5
    {
        Send "{Down}"
        Sleep 10
    }
}

; Optional extras
CapsLock & q:: Send "{Home}"       ; start of line
; CapsLock & a:: Send "^{Home}"      ; start of document
; CapsLock & v:: Send "{Delete}"     ; forward delete
; CapsLock & b:: Send "{PgUp}"       ; full page up
; CapsLock & Space:: Send "{PgDn}"   ; full page down

;numpad area
;replaces numpad functionality when numlock is off
;win + number is a hotkey for launching programs on the task bar
#HotIf !GetKeyState("NumLock", "T")

*NumpadEnd::    Send "#1"
*NumpadDown::   Send "#2"
*NumpadPgDn::   Send "#3"
*NumpadLeft::   Send "#4"
*NumpadClear::  Send "#5"
*NumpadRight::  Send "#6"
*NumpadHome::   Send "#7"
*NumpadUp::     Send "#8"
*NumpadPgUp::   Send "#9"
*NumpadIns::    Send "#0"

;operator keys
*NumpadAdd::    Send "#{Tab}" ;shows all open programs for easy switching
*NumpadSub::    Send "{Media_Play_Pause}" ;this is personal. my keyboard is lacking a button for it)
*NumpadMult::   Send "#m" ;quick minimize all programs
*NumpadDiv::    Send "!{F4}" ;alt f4 - closes focused program
*NumpadDel::    Send "!{Space}" ;this is personal. Opens powertools launcher

#HotIf