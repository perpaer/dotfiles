import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
    id: bar

    required property ShellScreen screen

    anchors {
        top: true
        left: true
        right: true
    }

    margins {
        top: 8
        left: 8
        right: 8
    }

    implicitHeight: 36
    aboveWindows: false
    exclusiveZone: 36

    color: "transparent"

    Rectangle {
        anchors.fill: parent
        radius: 12
        color: Qt.rgba(110 / 255, 115 / 255, 141 / 255, 0.1)

        RowLayout {
            anchors {
                fill: parent
                leftMargin: 4
                rightMargin: 4
            }
            spacing: 0

            // LEFT: Workspaces + Active Window
            RowLayout {
                spacing: 8

                Workspaces {
                    screen: bar.screen
                }

                ActiveWindow {
                    screen: bar.screen
                }
            }

            Item {
                Layout.fillWidth: true
            }

            // RIGHT: Media, Volume, Memory, Tray, Clock
            RowLayout {
                spacing: 16

                MediaPlayer {}
                Volume {}
                Memory {}
                Tray {}
                Clock {}
            }
        }

        // CENTER: Weather
        Weather {
            anchors.centerIn: parent
        }
    }
}
