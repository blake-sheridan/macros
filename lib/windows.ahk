;; A library for window management

;; An object encapsulating operations on a window
class GenericWindow {
    __New(my_id) {
        this._id := my_id
    }

    ;; Activate the window
    activate() {
        my_id := this._id
        WinActivate, ahk_id %my_id%
    }

    ;; Refresh the window
    refresh() {
        WinGet saved_id, , A
        this.activate()
        this._send_refresh()
        WinActivate ahk_id %saved_id%
    }

    ;; Send inputs to perform a “refresh” as the activated window
    _send_refresh() {
        ; Generic implementation — do nothing
    }
}


class GenericBrowserWindow extends GenericWindow {
    _send_refresh() {
        Send ^R
    }
}


class GenericTerminalWindow extends GenericWindow {
    _send_refresh() {
        Send ^a^k{Up} ; kill the current line then press up
        Sleep 50      ; wait for terminal to process history
        Send {Enter}  ; run the command
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