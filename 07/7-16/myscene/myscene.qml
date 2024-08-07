import QtQuick
import QtQuick3D

Window {
    width: 600; height: 400
    visible: true

    Image {
        anchors.fill: parent
        source: "bg.png"
    }

    Text {
        text: "2D Scene"
        font.pointSize: 32; color: "red"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Item {
        width: 300; height: 200
        anchors.centerIn: parent

        View3D {
            anchors.fill: parent
            environment: SceneEnvironment {
                backgroundMode: SceneEnvironment.Color
                clearColor: "#00000000"
                antialiasingMode: SceneEnvironment.MSAA
            }

            PerspectiveCamera { z: 100 }

            PointLight {
                position: Qt.vector3d(0, 300, 0)
                brightness: 50
            }

            Model {
                Node { // 在3D场景中添加2D内容
                    y: 5; z: 80
                    Rectangle {
                        anchors.horizontalCenter: parent.horizontalCenter
                        color: "#44444488"
                        width: text3d.width; height: text3d.height
                        Text {
                            id: text3d; text: "3D Scene";
                            font.pointSize: 4; color: "white"
                        }
                    }
                    eulerRotation.y: 45
                }

                source: "#Sphere"
                materials: PrincipledMaterial {
                    baseColor: "red"; metalness: 0.7
                }

                NumberAnimation on y {
                    from: 80; to: 0
                    duration: 2000
                    easing.type: Easing.InOutBack
                }
            }
        }
    }
}



