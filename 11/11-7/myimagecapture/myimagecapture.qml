import QtQuick
import QtMultimedia
import QtQuick.Controls
import Qt.labs.platform

Rectangle {
    width: 480; height: 360; color: "black"

    MediaDevices { id: mediaDevices }
    Camera { id: camera; cameraDevice: mediaDevices.defaultVideoInput }
    ImageCapture { id: imageCapture }
    VideoOutput { id: videoOutput; anchors.fill: parent }

    CaptureSession {
        imageCapture: imageCapture
        camera: camera
        videoOutput: videoOutput
    }

    Button {
        id: openBtn
        text: camera.active ? qsTr("关闭") : qsTr("打开")
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: camera.active ? camera.stop() : camera.start()
    }

    Button {
        id: imageCaptureBtn
        text: qsTr("拍照")
        visible: camera.active
        anchors.left: openBtn.right
        anchors.verticalCenter: openBtn.verticalCenter
        onClicked: {
            imageCapture.capture()
            popup.open()
        }
    }

    Popup {
        id: popup
        width: 400; height: 300
        modal: true; focus: true
        anchors.centerIn: Overlay.overlay

        Image {
            anchors.fill: parent
            source: imageCapture.preview
        }

        Button {
            text: qsTr("保存")
            onClicked: fileDialog.open()
        }

        FileDialog {
            id: fileDialog
            folder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)
            fileMode: FileDialog.SaveFile
            currentFile: "untitled.png"
            onAccepted: imageCapture.saveToFile(file)
        }
    }
}



