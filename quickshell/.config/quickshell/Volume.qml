import Quickshell.Io
import QtQuick
import QtQuick.Controls

Item {
    id: root
    implicitWidth: label.implicitWidth
    implicitHeight: 36

    property int volPercent: 0
    property bool muted: false
    property string nodeName: ""

    function refresh() {
        volProc.running = true
    }

    function setVolume(delta) {
        const sign = delta > 0 ? "+" : "-"
        const pct = Math.abs(Math.round(delta * 100))
        adjustProc.command = ["wpctl", "set-volume", "@DEFAULT_AUDIO_SINK@", pct + "%" + sign]
        adjustProc.running = true
    }

    function toggleMute() {
        muteProc.running = true
    }

    // Watch for sink/volume change events
    Process {
        id: watchProc
        command: ["pactl", "subscribe"]
        running: true
        stdout: SplitParser {
            onRead: data => {
                if (data.includes("sink") || data.includes("server")) {
                    root.refresh()
                }
            }
        }
    }

    // Read volume + mute state
    Process {
        id: volProc
        command: ["sh", "-c", "wpctl get-volume @DEFAULT_AUDIO_SINK@"]
        stdout: SplitParser {
            onRead: data => {
                // Output: "Volume: 0.63" or "Volume: 0.63 [MUTED]"
                const match = data.match(/Volume:\s+([\d.]+)(\s+\[MUTED\])?/)
                if (match) {
                    root.volPercent = Math.round(parseFloat(match[1]) * 100)
                    root.muted = match[2] !== undefined
                }
            }
        }
    }

    // Read sink name once
    Process {
        id: nameProc
        command: ["sh", "-c", "wpctl inspect @DEFAULT_AUDIO_SINK@ | awk -F'\"' '/node.nick/{print $2; exit} /node.description/{print $2; exit}'"]
        stdout: SplitParser {
            onRead: data => {
                if (data.trim()) root.nodeName = data.trim()
            }
        }
    }

    Process {
        id: adjustProc
        onExited: root.refresh()
    }

    Process {
        id: muteProc
        command: ["wpctl", "toggle-mute", "@DEFAULT_AUDIO_SINK@"]
        onExited: root.refresh()
    }

    Text {
        id: label
        anchors.centerIn: parent
        text: {
            if (root.muted) return "󰖁"
            const vol = root.volPercent
            const icon = vol === 0 ? "" : vol < 33 ? "" : vol < 66 ? "" : ""
            return icon + "  " + vol + "%" + (root.nodeName ? "  " + root.nodeName : "")
        }
        font.family: "SF Pro Regular"
        font.pixelSize: 14
        color: "#cdd6f4"
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        hoverEnabled: true
        onClicked: root.toggleMute()
        onWheel: wheel => {
            const delta = wheel.angleDelta.y > 0 ? 0.05 : -0.05
            root.setVolume(delta)
        }
    }

    Component.onCompleted: {
        root.refresh()
        nameProc.running = true
    }
}
