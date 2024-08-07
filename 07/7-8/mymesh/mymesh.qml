import QtQuick
import QtQuick3D
import QtQuick3D.Helpers

Window {
    width: 600; height: 250
    visible: true

    Node {
        id: myScene

        DirectionalLight {
        }

        PerspectiveCamera {
            id: camera
            position: Qt.vector3d(0, 80, 100)
            eulerRotation.x: -10
        }

        Model {  // 矩形
            source: "#Rectangle"
            position: Qt.vector3d(-300, 0, -200)
            materials: [
                PrincipledMaterial {
                    baseColor: "red"; roughness: 0.1
                }
            ]
        }

        Model {  // 球体
            source: "#Sphere"
            position: Qt.vector3d(-150, 0, -200)
            materials: [
                PrincipledMaterial {
                    baseColor: "blue"; roughness: 0.1
                }
            ]
        }

        Model { // 立方体
            source: "#Cube"
            position: Qt.vector3d(0, 0, -200)
            eulerRotation.y: 30
            materials: [
                PrincipledMaterial {
                    baseColor: "green"; roughness: 0.1
                }
            ]
        }

        Model {  // 圆柱体
            source: "#Cylinder"
            position: Qt.vector3d(150, 0, -200)
            materials: [
                PrincipledMaterial {
                    baseColor: "yellow"; roughness: 0.1
                }
            ]
        }

        Model {  // 圆锥体
            source: "#Cone"
            position: Qt.vector3d(300, -50, -200)
            materials: [
                PrincipledMaterial {
                    baseColor: "grey"; roughness: 0.1
                }
            ]
        }
    }

    View3D {
        importScene: myScene
        anchors.fill: parent
        environment: SceneEnvironment {
            clearColor: "#333333"
            backgroundMode: SceneEnvironment.Color
            antialiasingMode: SceneEnvironment.MSAA
        }
    }
}



