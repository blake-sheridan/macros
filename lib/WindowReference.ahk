class WindowReference {
    __New(title_match) {
        this._id := ""
        this._title_match := title_match
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
        Sleep 50
        Send {Enter}
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
            title_match := this._title_match
            SetTitleMatchMode, 2
            WinGet, my_id, ID, %title_match%
            this._id := my_id
            if (!my_id) {
                Throw "no window matched title " . title_match
            }
        }
        return my_id
    }
}
