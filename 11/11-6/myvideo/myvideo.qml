import QtQuick
import QtMultimedia
import Qt5Compat.GraphicalEffects

Item {
    width: 250; height: 170

    MediaPlayer {
        id: player
        source: "video.wmv"
        audioOutput: AudioOutput {}
        videoOutput: videoOutput
    }

    VideoOutput {
        id: videoOutput; anchors.fill: parent
        fillMode: VideoOutput.Stretch
        visible: false
    }

    Image {
        id: mask; source: "mask.png"
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true; visible: false
    }

    ThresholdMask {
        anchors.fill: parent
        source: videoOutput; maskSource: mask
        threshold: 0.45; spread: 0.2
    }

    MouseArea {
        anchors.fill: parent
        onClicked: player.play()
    }
}


