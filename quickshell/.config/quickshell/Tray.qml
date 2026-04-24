import Quickshell
import Quickshell.Services.SystemTray
import QtQuick
import QtQuick.Layouts

RowLayout {
    spacing: 8

    Repeater {
        model: SystemTray.items

        delegate: TrayItem {
            required property SystemTrayItem modelData
            item: modelData
        }
    }
}
