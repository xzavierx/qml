import QtMultimedia
import QtQuick
import QtQuick.Controls

Item {
    id: rootItem

    MediaDevices {
        id: mediaDevices
    }

    Camera {
        id: camera
        cameraDevice: mediaDevices.defaultVideoInput
    }

    ImageCapture {
        id: imageCapture
    }

    VideoOutput {
        id: videoOutput
        anchors.fill: parent
        fillMode: VideoOutput.PreserveAspectCrop
    }

    CaptureSession {
        imageCapture: imageCapture
        camera: camera
        videoOutput: videoOutput

        onCameraChanged: camera.stop()
    }

    Popup {
        id: photoDialog
        visible: false
        width: parent.width
        height: parent.height

        Image {
            id: photoPreview
            source: imageCapture.preview
            anchors.fill: parent
        }
        MouseArea {
            anchors.fill: parent;
            onClicked: { photoDialog.close() }
        }
    }

    Button {
        id: openBtn
        text: camera.active ? qsTr("关闭") : qsTr("打开")
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: camera.active ? camera.stop() : camera.start()
    }

    Button {
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        text: qsTr("拍照")
        onClicked: {
            imageCapture.capture()
            photoDialog.open()
        }
    }

    Button {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        text: qsTr("切换")
        onClicked: {
            if(camera.cameraDevice.position == 1)
                camera.cameraDevice = mediaDevices.videoInputs[1]
            else camera.cameraDevice = mediaDevices.videoInputs[0]
        }
    }
}


