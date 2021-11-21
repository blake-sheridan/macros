;; Bindings for the ...

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

; Only ever activate a single instance of this script
#SingleInstance Force

#Include lib\windows.ahk

windows := new Windows()

;; The keypad is configured to send events as all modifiers + ...
;;
;; X   W   V   U     T   S   R   Q
;; P   O   N   M     L   K   J   I
;; H   G   F   E     D   C   B   A
;;
;; F24 F23 F22 F21   F20 F19 F18 F17
;; F16 F15 F14 F13   F12 F11 F10 F9
;; F8  F7  F6  F5    F4  F3  F2  F1

#^!+F1:: windows.get("F1").activate()
#^!+F2:: windows.get("F2").activate()
#^!+F3:: windows.get("F3").activate()
#^!+F4:: windows.get("F4").activate()

#^!+F9::  windows.get("F1").refresh()
#^!+F10:: windows.get("F2").refresh()
#^!+F11:: windows.get("F3").refresh()
#^!+F12:: windows.get("F4").refresh()

#^!+F17:: windows.assign_mouse("F1")
#^!+F18:: windows.assign_mouse("F2")
#^!+F19:: windows.assign_mouse("F3")
#^!+F20:: windows.assign_mouse("F4")
