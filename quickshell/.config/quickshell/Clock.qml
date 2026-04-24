import Quickshell
import QtQuick
import QtQuick.Controls

Text {
    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    // Format: Mon Apr 21 02:30 PM  (matching waybar: {:%a %b %d %I:%M %p})
    text: Qt.formatDateTime(clock.date, "ddd MMM dd hh:mm AP")

    font.family: "SF Pro Regular"
    font.pixelSize: 14
    color: "#cdd6f4"
    rightPadding: 16

    ToolTip.visible: hoverArea.containsMouse
    ToolTip.text: Qt.formatDateTime(clock.date, "yyyy MMMM\n") + Qt.formatDateTime(clock.date, "yyyy-MM-dd")
    ToolTip.delay: 500

    MouseArea {
        id: hoverArea
        anchors.fill: parent
        hoverEnabled: true
    }
}
