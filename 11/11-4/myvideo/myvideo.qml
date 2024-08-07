import QtQuick
import QtMultimedia
import QtQuick.Controls

Window {
    width : 800; height : 600; visible: true

    Item {
        id:item; anchors.fill: parent

        MediaPlayer {
            id: player
            source: "video.wmv"
            audioOutput: AudioOutput {}
            videoOutput: videoOutput
        }

        VideoOutput { id: videoOutput; anchors.fill: parent }

        focus: true
        Keys.onSpacePressed: player.playbackState === MediaPlayer.PlayingState
                             ? player.pause() : player.play()
        Keys.onLeftPressed: player.position = player.position - 5000
        Keys.onRightPressed: player.position = player.position + 5000
    }

    Slider {
        width: parent.width; anchors.bottom: item.bottom
        to: player.duration; value: player.position
    }
}

