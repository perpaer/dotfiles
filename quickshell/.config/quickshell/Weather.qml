import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Controls

Item {
    id: root
    implicitWidth: label.implicitWidth
    implicitHeight: 36

    property string tooltipContent: ""

    Process {
        id: weatherProc
        command: ["bash", Quickshell.shellDir + "/scripts/wttr.sh", "Zagreb+Croatia"]
        stdout: SplitParser {
            onRead: data => {
                try {
                    const json = JSON.parse(data)
                    label.text = json.text ?? "?"
                    root.tooltipContent = json.tooltip ?? ""
                } catch(e) {}
            }
        }
    }

    Timer {
        interval: 3600000
        running: true
        repeat: true
        onTriggered: weatherProc.running = true
    }

    Component.onCompleted: weatherProc.running = true

    Text {
        id: label
        anchors.centerIn: parent
        text: "..."
        font.family: "SF Pro Regular"
        font.pixelSize: 14
        color: "#cdd6f4"

        ToolTip.visible: hoverArea.containsMouse && root.tooltipContent !== ""
        ToolTip.text: root.tooltipContent
        ToolTip.delay: 500
    }

    MouseArea {
        id: hoverArea
        anchors.fill: parent
        hoverEnabled: true
    }
}
