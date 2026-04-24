import Quickshell.Io
import QtQuick
import QtQuick.Controls

Text {
    id: root

    property string memPercent: "0"
    property string memUsed: "0"
    property string memTotal: "0"

    text: "󰍛   " + memPercent + "%"
    font.family: "SF Pro Regular"
    font.pixelSize: 14
    color: "#cdd6f4"

    ToolTip.visible: hoverArea.containsMouse
    ToolTip.text: memUsed + "GiB / " + memTotal + "GiB"
    ToolTip.delay: 500

    Process {
        id: memProc
        command: ["sh", "-c", "free | awk '/^Mem:/ {printf \"%d %.1f %.1f\", $3/$2*100, $3/1024/1024, $2/1024/1024}'"]
        stdout: SplitParser {
            onRead: data => {
                const parts = data.trim().split(" ")
                if (parts.length >= 3) {
                    root.memPercent = parts[0]
                    root.memUsed = parts[1]
                    root.memTotal = parts[2]
                }
            }
        }
    }

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: memProc.running = true
    }

    Component.onCompleted: memProc.running = true

    MouseArea {
        id: hoverArea
        anchors.fill: parent
        hoverEnabled: true
    }
}
