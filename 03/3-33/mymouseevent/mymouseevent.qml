import QtQuick

Rectangle {
    width: 100; height: 100
    color: "green"

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: (mouse)=> {
            if (mouse.button === Qt.RightButton)
                parent.color = 'blue';
            else
                parent.color = 'red';
        }
        onDoubleClicked: (mouse)=> {
            if ((mouse.button === Qt.LeftButton)
                    && (mouse.modifiers & Qt.ShiftModifier))
                parent.color = "green"
        }
    }
}
