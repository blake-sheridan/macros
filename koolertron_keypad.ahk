;; Bindings for https://www.amazon.com/dp/B076LYKPX4?ref=ppx_yo2_dt_b_product_details&th=1

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

; Only ever activate a single instance of this script
#SingleInstance Force

#Include lib\WindowReference.ahk

browser := new WindowReference("chrome.exe")
editor := new WindowReference("sublime_text.exe")
terminal := new WindowReference("WindowsTerminal.exe")

saved_commands := ["", "", "", ""]

save_command(index) {
    global saved_commands
    InputBox, command, Save command, Enter command %index%, , 400, 130
    saved_commands[index] := command
}

run_command(index) {
    global saved_commands, terminal
    if (saved_commands[index]) {
        terminal.send_command(saved_commands[index])
    }
}

save_and_run_last_command() {
    global editor, terminal
    editor.send("^xs")
    Sleep 100
    terminal.run_last_command()
}

;; I've configured the keypad to send keypresses as hotkeys with Ctrl+Alt+Shift+
;; a character (issues with function keys)
;;
;; ____  ./;'
;; 7890  -=[]
;; YZ12  3456
;;
;; QRST  UVWX
;; IJKL  MNOP
;; ABCD  EFGH

;; This layout has the keypad just left of the keyboard and the keypad is
;; used exclusively with the left hand.

^!+':: Send {Volume_Up}
^!+;:: Send {Volume_Down}
^!+/:: Send {Volume_Mute}


;^!+7::
;^!+8::
;^!+9::
;^!+0::

;^!+-::
;^!+=::
;^!+[::
;^!+]::

^!+A:: terminal.set_from_mouse()
;^!+B:: save_command(3)
^!+C:: save_command(1)
^!+D:: run_command(1)

^!+E:: editor.send("^xs")
;^!+F:: 
^!+G:: terminal.activate()
^!+H:: save_and_run_last_command()

^!+I:: editor.set_from_mouse()
;;
^!+P:: editor.activate()

^!+Q:: browser.set_from_mouse()
;;
^!+W:: browser.send("^r")
^!+X:: browser.activate()
