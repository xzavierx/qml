import QtQuick
import QtQuick3D
import QtQuick3D.Helpers

Window {
    width: 640; height: 480
    visible: true

    View3D {
        anchors.fill: parent
        camera: camera

        environment: SceneEnvironment {
            antialiasingMode: SceneEnvironment.MSAA
        }

        PerspectiveCamera {
            id: camera
            position: Qt.vector3d(600, 600, 600)
            eulerRotation.x: -45
            eulerRotation.y: 45
        }

        DirectionalLight {
            position: Qt.vector3d(-500, 500, -100)
            color: Qt.rgba(0.4, 0.2, 0.6, 1.0)
        }

        Model {
            source: "#Sphere"
            materials: [ DefaultMaterial { } ]
            position: Qt.vector3d(0, 0, 0)
        }

        AxisHelper {
        }
    }

    WasdController {
        controlledObject: camera
    }
}


