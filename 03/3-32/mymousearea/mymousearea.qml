import QtQuick

Rectangle {
    color: "yellow"
    width: 100; height: 100

    MouseArea {
        anchors.fill: parent
        onClicked: console.log("clicked yellow")
        onDoubleClicked: console.log("double clicked yellow")
    }

    Rectangle {
        color: "blue"
        width: 50; height: 50

        MouseArea {
            anchors.fill: parent
            propagateComposedEvents: true
            onClicked: (mouse)=> {
                console.log("clicked blue")
                mouse.accepted = false
            }
            onDoubleClicked: (mouse)=> {
                console.log("double clicked blue")
                mouse.accepted = false
            }
        }
    }
}
