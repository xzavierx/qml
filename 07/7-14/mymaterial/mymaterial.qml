import QtQuick
import QtQuick3D

Window {
    width: 600; height: 300
    visible: true

    Node {
        id: myScene

        DirectionalLight {}

        Node {
            PerspectiveCamera {
                id: camera
                z: 200
            }

//            PropertyAnimation on eulerRotation.y {
//                loops: Animation.Infinite
//                to: 0; from: -360; duration: 18000
//            }
        }

        Model {
            source: "#Rectangle"
            x: -150
            materials: [
                PrincipledMaterial {
                    baseColorMap: Texture {
                        source: "side.png"
                    }
                }
            ]
        }

        Model {
            source: "#Sphere"
            materials: [
                PrincipledMaterial {
                    baseColorMap: Texture {
                        source: "side.png"
                    }
                }
            ]
        }

        Model {
            source: "#Cube"
            x: 130
            eulerRotation.x: 45
            scale: Qt.vector3d(0.6, 0.6, 0.6)
            materials: [
                PrincipledMaterial {
                    baseColorMap: Texture {
                        source: "side.png"
                    }
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










