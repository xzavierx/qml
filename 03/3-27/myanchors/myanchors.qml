import QtQuick

Rectangle {
    id: window
    width: 160; height: 200
    color: "lightgrey"

    Rectangle { id: myRect; width: 100; height: 100; color: "black" }

    states: State {
        name: "reanchored"

        AnchorChanges {
            target: myRect
            anchors.top: window.top
            anchors.bottom: window.bottom
        }
        PropertyChanges {
            target: myRect
            anchors.topMargin: 10
            anchors.bottomMargin: 10
        }
    }

    transitions: Transition {
        AnchorAnimation { duration: 1000 }
    }

    MouseArea {
        anchors.fill: parent;
        onClicked: window.state = "reanchored"
    }
}
