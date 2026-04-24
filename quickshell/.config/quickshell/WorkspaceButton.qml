import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Item {
    required property HyprlandWorkspace workspace

    implicitWidth: label.implicitWidth + 12
    implicitHeight: 36

    readonly property string romanNumeral: {
        const map = {1: "I", 2: "II", 3: "III", 4: "IV", 5: "V",
                     6: "VI", 7: "VII", 8: "VIII", 9: "IX"}
        return map[workspace.id] ?? "O"
    }

    Rectangle {
        id: bg
        anchors.fill: parent
        color: workspace.urgent ? "#f38ba8"
             : (workspace.focused || workspace.active) ? "#45475a"
             : "transparent"
        Behavior on color { ColorAnimation { duration: 150 } }
    }

    // Bottom underline for focused/active/hover
    Rectangle {
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
        height: 3
        color: "#cdd6f4"
        visible: workspace.focused || workspace.active || hoverArea.containsMouse
    }

    Text {
        id: label
        anchors.centerIn: parent
        text: romanNumeral
        font.family: "SF Pro Regular"
        font.pixelSize: 14
        color: "#cdd6f4"
    }

    MouseArea {
        id: hoverArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: workspace.activate()

        Rectangle {
            anchors.fill: parent
            color: Qt.rgba(0, 0, 0, 0.2)
            visible: parent.containsMouse && !workspace.focused && !workspace.active
        }
    }
}
