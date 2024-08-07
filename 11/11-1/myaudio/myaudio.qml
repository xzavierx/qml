import QtQuick
import QtMultimedia

Window {
    width: 640; height: 480
    visible: true

    MediaPlayer {
        audioOutput: AudioOutput {}
        source: "music.mp3"
        Component.onCompleted: { play() }
    }
}


