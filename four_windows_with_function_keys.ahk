;; Control four windows using the function keys
;;
;; F1-4: activate window 1-4
;; F5-F8: refresh window 1-4
;; F9-F12: assign window 1-4 from the mouse

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

; Only ever activate a single instance of this script
#SingleInstance Force

#Include lib\windows.ahk

windows := new Windows()

F1::
windows.get("F1").activate()
return
F2::
windows.get("F2").activate()
return
F3::
windows.get("F3").activate()
return
F4::
windows.get("F4").activate()
return

F5::
windows.get("F1").refresh()
return
F6::
windows.get("F2").refresh()
return
F7::
windows.get("F3").refresh()
return
F8::
windows.get("F4").refresh()
return

F9::
windows.assign_mouse("F1")
return
F10::
windows.assign_mouse("F2")
return
F11::
windows.assign_mouse("F3")
return
F12::
windows.assign_mouse("F4")
return
