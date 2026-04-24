//@ pragma UseQApplication
import Quickshell
import QtQuick

Variants {
    model: Quickshell.screens

    delegate: Bar {
        required property ShellScreen modelData
        screen: modelData
    }
}
