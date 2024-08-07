import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    width: 300; height: 300

    Image {
        id: bug
        source: "images/bug.png"
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true; visible: false
    }

    Image {
        id: butterfly
        source: "images/butterfly.png"
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true; visible: false
    }

    Blend {
        anchors.fill: bug; source: bug
        foregroundSource: butterfly
        mode: "saturation"
    }
}


