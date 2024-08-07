import QtQuick
import QtQuick3D

Window {
    width: 600; height: 400
    visible: true

    Node {
        id: myScene

        DirectionalLight {}

        Node {
            PerspectiveCamera {
                id: camera
                z: 200
            }

            PropertyAnimation on eulerRotation.y {
                loops: Animation.Infinite
                to: 0; from: -360; duration: 18000
            }
        }

        Model {
            source: "#Sphere"
            materials: [
                PrincipledMaterial {
                    metalness: 1.0
                    baseColor: "red"
                    roughness: 0.1
                }
            ]
        }
    }

    View3D {
        camera: camera
        importScene: myScene
        anchors.fill: parent
        environment: SceneEnvironment {
            backgroundMode: SceneEnvironment.SkyBox
            lightProbe: Texture {
                source: "bg.hdr"
            }
            probeExposure: 10
        }
    }
}









