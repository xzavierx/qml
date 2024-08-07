import QtQuick
import QtQuick3D
import QtQuick3D.Helpers
import QtQuick3D.Effects 6.4

Window {
    width: 640; height: 480
    visible: true

    View3D {
        anchors.fill: parent
        environment: SceneEnvironment {
            backgroundMode: SceneEnvironment.SkyBox
            lightProbe: Texture {
                source: "island.ktx"
            }

            // 使用场景效果
            effects: [
                Blur { amount: 0.003 },
                DistortionSphere { distortionHeight: 0.8; radius: 0.5 }
            ]
        }

        Model {
            source: "#Sphere"
            scale: Qt.vector3d(3, 3, 3)
            materials: [
                PrincipledMaterial {
                    metalness: 0.9
                }
            ]
        }

        Node {
            PerspectiveCamera {
                id: camera
                z: 500
            }

            PropertyAnimation on eulerRotation.y {
                loops: Animation.Infinite
                to: 0; from: -360; duration: 18000
            }
        }
    }

    WasdController {
        controlledObject: camera
    }
}




