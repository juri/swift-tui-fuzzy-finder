import Foundation

struct TerminalSize {
    var height: Int
    var width: Int
}

extension TerminalSize {
    static func current() -> Self {
        var w = winsize()
        _ = ioctl(STDOUT_FILENO, UInt(TIOCGWINSZ), &w)
        return TerminalSize(height: Int(w.ws_row), width: Int(w.ws_col))
    }
}