import QtQuick
import QtQuick3D
import QtQuick3D.Helpers

Window {
    width: 600; height: 400
    visible: true

    Node {
        id: myScene

        DirectionalLight {
            ambientColor: Qt.rgba(0.5, 0.5, 0.5, 1.0)
            brightness: 1.0
            eulerRotation.x: -25; eulerRotation.y: -45
        }

        Model {  // 浅灰色平面
            source: "#Cube"
            position: Qt.vector3d(0, -60, -200)
            scale: Qt.vector3d(5, 0.2, 5)
            eulerRotation.y: 45
            materials: [
                DefaultMaterial {
                    diffuseColor: "lightgrey"
                }
            ]
        }

        Model {  // 近处蓝色球体
            source: "#Sphere"
            z: 100
            materials: [
                PrincipledMaterial {
                    baseColor: "blue"
                    roughness: 0.1
                }
            ]
        }

        Model { // 远处红色球体
            source: "#Sphere"
            z: -500

            materials: [
                PrincipledMaterial {
                    baseColor: "red"
                    roughness: 0.1
                }
            ]
        }

        PerspectiveCamera {
            id: camera
            position: Qt.vector3d(0, 100, 300)
            eulerRotation.x: -18
        }
    }

    View3D {
        camera: camera
        importScene: myScene
        anchors.fill: parent
        environment: SceneEnvironment {
            clearColor: "skyblue"
            backgroundMode: SceneEnvironment.Color
            antialiasingMode: SceneEnvironment.MSAA
        }
    }

    WasdController {
        controlledObject: camera
    }
}


