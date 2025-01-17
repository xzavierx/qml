import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    width: 300; height: 300

    Image {
        id: butterfly; source: "images/butterfly.png"
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true; visible: false
    }

    LevelAdjust {
        anchors.fill: butterfly; source: butterfly
        minimumOutput: "#00ffffff"; maximumOutput: "#ff000000"
    }
}



