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
                z: 120
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
                    baseColorMap: Texture {
                        source: "basecolor.jpg"
                    }
                    metalness: 0.6
                    metalnessMap: Texture {
                        source: "metallic.jpg"
                    }
                    roughness: 0.7
                    roughnessMap: Texture {
                        source: "roughness.jpg"
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
            probeExposure: 5
        }
    }
}










