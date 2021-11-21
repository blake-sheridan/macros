;; A library for window management

;; An object encapsulating operations on a window
class GenericWindow {
    __New(my_id) {
        this._id := my_id
    }

    ;; Activate the window
    activate() {
        WinGet prev_id, , A
        my_id := this._id
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
        this.deactivate()
    }

    ;; Subclass API - refresh the window
    refresh() {
        ; Generic implementation — do nothing
    }
}


class GenericBrowserWindow extends GenericWindow {
    refresh() {
        this.send("^R")
    }
}


class GenericTerminalWindow extends GenericWindow {
    refresh() {
        this.activate()
        Send ^a^k{Up} ; kill the current line then press up
        Sleep 50      ; wait for terminal to process history
        Send {Enter}  ; run the command
        this.deactivate()
    }
}


;; A container mapping keys to windows
class Windows {
    _map := {}

    ;; Return the window assigned to `key`
    get(key) {
        if (!this._map.HasKey(key)) {
            this._map[key] := new GenericWindow(0)
        }
        return this._map[key]
    }

    ;; Assign the active window to `key`
    assign_active(key) {
        MouseGetPos, _, _, id_
        return this._set(key, id_)
    }

    ;; Assign the window under the mouse cursor to `key`
    assign_mouse(key) {
        MouseGetPos, _, _, id_
        return this._set(key, id_)
    }

    _set(key, id_) {
        ; Use the process name to pick the appropriate subclass
        WinGet, process_name, ProcessName, ahk_id %id_%
        Switch process_name {
        case "chrome.exe":
            win := new GenericBrowserWindow(id_)
        case "Hyper.exe":
            win := new GenericTerminalWindow(id_)
        default:
            win := new GenericWindow(id_)
        }
        this._map[key] := win
        return win
    }

    _dump() {
        message := "{"
        for k, v in this._map {
            message .= "`n  " . k . " -> " . v
        }
        message .= "`n}"
        MsgBox %message%
    }
}