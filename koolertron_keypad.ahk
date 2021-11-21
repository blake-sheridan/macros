;; Bindings for https://www.amazon.com/dp/B076LYKPX4?ref=ppx_yo2_dt_b_product_details&th=1

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

; Only ever activate a single instance of this script
#SingleInstance Force

#Include lib\windows.ahk

windows := new Windows()


;; I've configured the keypad to send keypresses as hotkeys with Ctrl+Alt+Shift+
;; a character (issues with function keys)
;;
;; ____  ____  first row is reserved
;; 7890  -=[]
;; YZ12  3456
;;
;; QRST  UVWX
;; IJKL  MNOP
;; ABCD  EFGH


;; This layout has the keypad just left of the keyboard and the keypad is
;; used exclusively with the left hand.

^!+A:: windows.assign_mouse("win4")
^!+B:: windows.assign_mouse("win3")
^!+C:: windows.assign_mouse("win2")
^!+D:: windows.assign_mouse("win1")

^!+E:: windows.get("win4").activate()
^!+F:: windows.get("win3").activate()
^!+G:: windows.get("win2").activate()
^!+H:: windows.get("win1").activate()

^!+M:: windows.get("win4").refresh()
^!+N:: windows.get("win3").refresh()
^!+O:: windows.get("win2").refresh()
^!+P:: windows.get("win1").refresh()
