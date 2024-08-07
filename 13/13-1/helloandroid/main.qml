import QtQuick

Window {
    visible: true
    width: 640; height: 480

    Text {
        anchors.centerIn: parent
        text: qsTr("Hello Android")
    }

    MouseArea {
        anchors.fill: parent
        onClicked: Qt.quit()
    }
}
