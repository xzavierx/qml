import QtQuick
import QtQuick3D
import QtQuick3D.Helpers

Window {
    width: 1280; height: 720; visible: true

    View3D {
        anchors.fill: parent

        environment: SceneEnvironment {
            clearColor: "#111111"
            backgroundMode: SceneEnvironment.Color
            antialiasingMode: SceneEnvironment.MSAA
        }

        PerspectiveCamera {
            position: Qt.vector3d(0, 0, 3000)
            clipNear: 1.0
            NumberAnimation on z {
                from: 3000; to: 0; duration: 8000
            }
        }

        DirectionalLight {
            eulerRotation.y: -70
            ambientColor: Qt.rgba(0.5, 0.5, 0.5, 1.0)
        }

//        InstanceList {
//            id: manualInstancing
//            instances: [
//                InstanceListEntry {
//                    position: Qt.vector3d(-100, 0, -200)
//                    eulerRotation: Qt.vector3d(-10, 0, 30)
//                    color: "red"
//                },
//                InstanceListEntry {
//                    position: Qt.vector3d(50, 100, 100)
//                    eulerRotation: Qt.vector3d(0, 180, 0)
//                    color: "green"
//                }
//            ]
//        }

        RandomInstancing {
            id: randomInstancing
            instanceCount: 1500

            position: InstanceRange {
                from: Qt.vector3d(-3000, -2000, -5000)
                to: Qt.vector3d(3000, 2000, 5000)
            }
            scale: InstanceRange {
                from: Qt.vector3d(0.1, 0.1, 0.1)
                to: Qt.vector3d(1, 1, 1)
                proportional: true
            }
            rotation: InstanceRange {
                from: Qt.vector3d(0, 0, 0)
                to: Qt.vector3d(360, 360, 360)
            }
            color: InstanceRange {
                from: "#222222"; to: "#FFFFFF"
            }

            randomSeed: 2023
        }

        Model {
            instancing: randomInstancing
            source: "#Cube"
            materials: PrincipledMaterial {
                baseColor: "#ffeecc"
                roughness: 0.5
            }

            NumberAnimation on eulerRotation.x {
                from: 0
                to: 360
                duration: 11000
                loops: Animation.Infinite
            }
        }
    }
}


