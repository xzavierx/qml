import QtQuick
import QtMultimedia
import Qt5Compat.GraphicalEffects

Item {
    width: 500; height: 170

    MediaPlayer {
        id: player
        source: "video.wmv"
        audioOutput: AudioOutput {}
        videoOutput: videoOutput
    }

    VideoOutput {
        id: videoOutput; y:10; width: 240; height: 150
    }

    FastBlur {
        x:250; y:10; width: 240; height: 150;
        source: videoOutput; radius: 32
    }

    MouseArea {
        anchors.fill: parent
        onClicked: player.play()
    }
}


