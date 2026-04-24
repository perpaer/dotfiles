import QtQuick
import Quickshell.Services.Mpris

Text {
    readonly property var player: Mpris.players.values[0] ?? null

    visible: true

    text: {
        if (!player)
            return "";
        const icon = player.isPlaying ? "▶" : "⏸";
        const name = player.identity ?? player.desktopEntry ?? "player";
        const title = player.trackTitle ?? "";
        const artist = player.trackArtist ?? "";
        if (player.isPlaying) {
            return icon + " " + name + " | " + title + (artist ? " - " + artist : "");
        } else {
            return "⏸ " + title + (artist ? " - " + artist : "");
        }
    }

    font.family: "SF Pro Regular"
    font.pixelSize: 14
    color: "#cdd6f4"
    elide: Text.ElideRight
}
