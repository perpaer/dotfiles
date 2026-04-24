import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

RowLayout {
    required property ShellScreen screen

    spacing: 0

    // 12px left padding matching waybar
    Item { implicitWidth: 12 }

    Repeater {
        model: Hyprland.workspaces

        delegate: WorkspaceButton {
            required property HyprlandWorkspace modelData
            workspace: modelData
            // Only show workspaces relevant to this monitor
            visible: modelData.monitor === Hyprland.monitorFor(screen)
        }
    }
}
