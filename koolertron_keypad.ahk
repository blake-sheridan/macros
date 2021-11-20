;; Bindings for the ...

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

; Only ever activate a single instance of this script
#SingleInstance Force

#Include lib\windows.ahk

windows := new Windows()

;; The keypad is configured to send events as all modifiers + ...
;;
;; _ _ _ _   F24 F23 F22 F21
;; _ _ _ _   F20 F19 F18 F17
;; _ _ _ _   F16 F15 F14 F13
;;
;; L K J I   F12 F11 F10 F9
;; H G F E   F8  F7  F6  F5
;; D C B A   F4  F3  F2  F1

#^!+F1:: windows.get("1").activate()
#^!+F2:: windows.get("2").activate()
#^!+F3:: windows.get("3").activate()
#^!+F4:: windows.get("4").activate()

#^!+F5:: windows.get("1").refresh()
#^!+F6:: windows.get("2").refresh()
#^!+F7:: windows.get("3").refresh()
#^!+F8:: windows.get("4").refresh()

#^!+F13:: windows.assign_mouse("1")
#^!+F14:: windows.assign_mouse("2")
#^!+F15:: windows.assign_mouse("3")
#^!+F16:: windows.assign_mouse("4")
