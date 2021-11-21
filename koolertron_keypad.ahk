;; Bindings for https://www.amazon.com/dp/B076LYKPX4?ref=ppx_yo2_dt_b_product_details&th=1

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

; Only ever activate a single instance of this script
#SingleInstance Force

#Include lib\windows.ahk

windows := new Windows()


;; I've configured the keypad to send keypresses as hotkeys with Ctrl+Alt+Shift+ ...
;;
;; X   R   L   F    F24 F18 F12 F6
;; W   Q   K   E    F23 F17 F11 F5
;; V   P   J   D    F22 F16 F10 F4
;;
;; U   O   I   C    F21 F15 F9  F3
;; T   N   H   B    F20 F14 F8  F2
;; S   M   G   A    F19 F13 F7  F1

^!+X:: windows.assign_mouse("F6")
^!+W:: windows.assign_mouse("F5")
^!+V:: windows.assign_mouse("F4")
^!+U:: windows.assign_mouse("F3")
^!+T:: windows.assign_mouse("F2")
^!+S:: windows.assign_mouse("F1")

^!+F12:: windows.get("F6").refresh()
^!+F11:: windows.get("F5").refresh()
^!+F10:: windows.get("F4").refresh()
^!+F9::  windows.get("F3").refresh()
^!+F8::  windows.get("F2").refresh()
^!+F7::  windows.get("F1").refresh()

^!+F6::  windows.get("F6").activate()
^!+F5::  windows.get("F5").activate()
^!+F4::  windows.get("F4").activate()
^!+F3::  windows.get("F3").activate()
^!+F2::  windows.get("F2").activate()
^!+F1::  windows.get("F1").activate()
