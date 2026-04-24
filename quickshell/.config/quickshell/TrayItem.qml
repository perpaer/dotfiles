import Quickshell
import Quickshell.Services.SystemTray
import QtQuick

Item {
    id: root
    required property SystemTrayItem item

    implicitWidth: 20
    implicitHeight: 20

    readonly property bool needsAttention: item.status === SystemTrayItem.NeedsAttention
    readonly property bool passive: item.status === SystemTrayItem.Passive

    opacity: passive ? 0.5 : 1.0

    Rectangle {
        anchors.fill: parent
        color: "#f38ba8"
        radius: 2
        visible: needsAttention
    }

    Image {
        anchors.fill: parent
        source: item.icon
        fillMode: Image.PreserveAspectFit
        smooth: true
        sourceSize.width: 20
        sourceSize.height: 20
        antialiasing: true
    }

    QsMenuAnchor {
        id: menuAnchor
        menu: item.menu
        anchor.item: root
        anchor.edges: Edges.Bottom
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: mouse => {
            if (mouse.button === Qt.RightButton || item.onlyMenu) {
                menuAnchor.open()
            } else {
                item.activate()
            }
        }
    }
}
