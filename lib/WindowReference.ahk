class WindowReference {
    __New(process_name) {
        this._id := ""
        this._process_name := process_name
    }

    ;; Activate the window
    activate() {
        my_id := this._get_id()
        WinGet prev_id, , A
        WinActivate, ahk_id %my_id%
        this._prev_id := prev_id
    }

    ;; Deactivate the window and return focus to previous window
    deactivate() {
        prev_id := this._prev_id
        WinActivate, ahk_id %prev_id%
    }

    ;; Send input to the window by temporarily activating it
    send(inputs) {
        this.activate()
        Sleep 50
        SendInput %inputs%
        Sleep 50
        this.deactivate()
    }

    ;; Run a command in a terminal window
    send_command(command) {
        this.activate()
        Send ^c
        Sleep 50
        Send %command%
        Send {Enter}
        this.deactivate()
    }

    ;; Re-run the last command in a terminal window
    run_last_command() {
        this.activate()
        Send ^a^k{!}{:}0{Enter}
        Sleep 50
        this.deactivate()
    }

    ;; Manually set the window to the one pointed at by the mouse
    set_from_mouse() {
        MouseGetPos, _, _, my_id
        this._id := my_id
    }

    ;; Return the ID of the window, lazily resolved if not set
    _get_id() {
        my_id := this._id
        if (!my_id) {
            process_name := this._process_name
            SetTitleMatchMode, 2
            WinGet, my_id, ID, ahk_exe %process_name%
            this._id := my_id
            if (!my_id) {
                Throw "no window matched process " . process_name
            }
        }
        return my_id
    }
}
