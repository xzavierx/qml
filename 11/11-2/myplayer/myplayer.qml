import QtQuick
import QtMultimedia
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.platform

ApplicationWindow {
    id: window; width: 250; height: 200; visible: true

    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            ToolButton { text: qsTr("播放"); onClicked: player.play() }
            ToolButton { text: qsTr("暂停"); onClicked: player.pause() }
            ToolButton { text: qsTr("停止"); onClicked: player.stop() }
            ToolButton { text: qsTr("打开"); onClicked: fileDialog.open() }
        }
    }

    Frame {
        anchors.fill: parent

        ColumnLayout {
            spacing: 10; anchors.fill: parent

            RowLayout {
                Text { text: qsTr("进度：") }
                Slider {
                    Layout.fillWidth: true
                    to: player.duration; value: player.position
                    onMoved: player.position = value
                }
            }

            RowLayout {
                Text { text: qsTr("音量：") }
                Slider {
                    Layout.fillWidth: true
                    to: 1.0; value: audio.volume
                    onMoved: audio.volume = value
                }
            }

            RowLayout {
                Layout.alignment: Qt.AlignHCenter
                Text { text: qsTr("循环次数：") }
                SpinBox { value: 1; onValueChanged: player.loops = value }
            }

            RowLayout {
                Layout.alignment: Qt.AlignHCenter
                Text { text: qsTr("播放速度：") }
                SpinBox { value: 1;  stepSize: 1
                    onValueChanged: player.playbackRate = value }
            }
        }
    }

    MediaPlayer {
        id: player
        audioOutput: AudioOutput { id: audio }
        source: fileDialog.file
    }

    FileDialog {
        id: fileDialog
        folder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)
    }
}
