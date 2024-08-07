import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Image {
        id: logo
        source: "qrc:/images/logo.png"
        anchors.centerIn: parent
    }

    MyText {
        anchors.top: logo.bottom
        anchors.horizontalCenter: logo.horizontalCenter
    }
}
