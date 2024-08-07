import QtQuick
import QtQuick3D
import QtQuick3D.Physics

Window {
    width: 720; height: 340; visible: true

    DynamicsWorld {}

    View3D {
        anchors.fill: parent

        environment: SceneEnvironment {
            antialiasingMode: SceneEnvironment.SSAA
            backgroundMode: SceneEnvironment.Color
            clearColor: "#222222"
        }

        PerspectiveCamera {
            position: Qt.vector3d(0, 300, 600)
            eulerRotation.x: -20
        }

        DirectionalLight {
            eulerRotation: Qt.vector3d(-45, 45, 0)
            castsShadow: true; brightness: 2
            shadowMapQuality: Light.ShadowMapQualityVeryHigh
        }

        PhysicsMaterial {  // 材质
            id: physicsMaterial
            staticFriction: 0.7; dynamicFriction: 0.1; restitution: 0.6
        }

        StaticRigidBody {  // 静态地板
            eulerRotation: Qt.vector3d(0, 0, 15)
            scale: Qt.vector3d(20, 0.2, 5)
            physicsMaterial: physicsMaterial
            collisionShapes: BoxShape {}
            Model {
                source: "#Cube"
                materials: DefaultMaterial {
                    diffuseMap: Texture { source: "floor.png" }
                }
            }
        }

        DynamicRigidBody { // 球体
            physicsMaterial: physicsMaterial
            density: 10
            position: Qt.vector3d(700, 300, 0)
            collisionShapes: SphereShape {}
            Model {
                source: "#Sphere"
                materials: PrincipledMaterial {
                    baseColorMap: Texture { source: "sphere.png"}
                    roughness: 0.3
                }
            }
        }

        DynamicRigidBody {  // 立方体
            physicsMaterial: physicsMaterial
            density: 10
            position: Qt.vector3d(100, 50, 0)
            scale: Qt.vector3d(2, 2, 2)
            collisionShapes: BoxShape {}
            Model {
                source: "#Cube"
                materials: DefaultMaterial {
                    diffuseMap: Texture { source: "cube.png"}
                }
            }
        }
    }
}
