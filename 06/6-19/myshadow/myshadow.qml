import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    width: 300; height: 300

    Image {
        id: butterfly; source: "images/butterfly.png"
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true; visible: false
    }

    DropShadow {
        anchors.fill: butterfly; source: butterfly
        horizontalOffset: 5; verticalOffset: 5
        radius: 8.0; samples: 16; color: "#80000000";
    }
}
