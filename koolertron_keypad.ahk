;; Bindings for https://www.amazon.com/dp/B076LYKPX4?ref=ppx_yo2_dt_b_product_details&th=1

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

; Only ever activate a single instance of this script
#SingleInstance Force

#Include lib\WindowReference.ahk

browser := new WindowReference("Google Chrome")
editor := new WindowReference("Sublime Text")
terminal := new WindowReference("wsl")

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

^!+A:: terminal.set_from_mouse()
^!+B:: save_command(3)
^!+C:: save_command(2)
^!+D:: save_command(1)

^!+E:: run_command(3)
^!+F:: run_command(2)
^!+G:: run_command(1)
^!+H:: terminal.activate()


^!+I:: editor.set_from_mouse()
;;
^!+P:: editor.activate()


^!+Q:: browser.set_from_mouse()
;;
^!+W:: browser.send("^r")
^!+X:: browser.activate()
