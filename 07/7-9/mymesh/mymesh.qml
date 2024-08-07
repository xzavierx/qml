import QtQuick
import QtQuick3D
import QtQuick3D.Helpers

Window {
    width: 600; height: 400
    visible: true

    View3D {
        anchors.fill: parent
        environment: SceneEnvironment {
            clearColor: "#333333"
            backgroundMode: SceneEnvironment.Color
            antialiasingMode: SceneEnvironment.MSAA
        }

        Monkey {}
    }
}


