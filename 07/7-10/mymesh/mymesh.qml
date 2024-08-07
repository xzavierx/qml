import QtQuick
import QtQuick3D
import QtQuick3D.Helpers

Window {
    width: 600; height: 400
    visible: true

    Node {
        id: myScene

        PointLight {
            position: Qt.vector3d(0, 100, -30)
        }

        DirectionalLight {}

        Node {
            PerspectiveCamera {
                id: camera
                z: 50
            }

            PropertyAnimation on eulerRotation.y {
                loops: Animation.Infinite
                to: 0; from: -360; duration: 18000
            }
        }

        Model {
            source: "monkey.mesh"
            z: -30
            scale: Qt.vector3d(10, 10, 10)
            eulerRotation.x: -90
            materials: [
                PrincipledMaterial {
                    baseColor: "gold"
                    metalness: 0.2
                }
            ]
        }
    }

    View3D {
        camera: camera
        importScene: myScene
        anchors.fill: parent
        environment: SceneEnvironment {
            clearColor: "#333333"
            backgroundMode: SceneEnvironment.Color
            antialiasingMode: SceneEnvironment.MSAA
        }
    }
}





