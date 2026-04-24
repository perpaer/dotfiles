import Quickshell
import Quickshell.Hyprland
import QtQuick

Text {
    required property ShellScreen screen

    readonly property HyprlandMonitor monitor: Hyprland.monitorFor(screen)

    text: {
        const ws = monitor?.activeWorkspace
        if (!ws) return ""
        const wins = ws.toplevels
        if (!wins || wins.length === 0) return ""
        // Show active toplevel title if on this monitor
        const active = Hyprland.activeToplevel
        if (active && active.workspace === ws) return active.title ?? ""
        return ""
    }

    font.family: "SF Pro Regular"
    font.pixelSize: 14
    color: "#cdd6f4"
    elide: Text.ElideRight
    maximumLineCount: 1
}
