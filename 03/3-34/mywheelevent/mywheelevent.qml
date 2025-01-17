import QtQuick

Rectangle {
    width: 360; height: 360
    Text { id:myText; anchors.centerIn: parent; text: "Qt" }
    MouseArea {
        anchors.fill: parent
        onWheel: (wheel)=> {
            if (wheel.modifiers & Qt.ControlModifier) {
                if (wheel.angleDelta.y > 0)
                    myText.font.pointSize += 1
                else
                    myText.font.pointSize -= 1
            }
        }
    }
}
