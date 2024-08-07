import QtQuick
import QtQuick3D
import QtQuick3D.Particles3D

Window {
    width: 1280; height: 720; visible: true

    View3D {
        anchors.fill: parent

        environment: SceneEnvironment {
            backgroundMode: SceneEnvironment.SkyBox
            lightProbe: Texture {
                source: "snow.hdr"
            }
        }

        PerspectiveCamera {
            position: Qt.vector3d(0, 100, 500)
        }

        PointLight {
            position: Qt.vector3d(200, 600, 400)
            brightness: 40
            ambientColor: Qt.rgba(0.2, 0.2, 0.2, 1.0)
        }

        Model {
            source: "#Sphere"; y: 100; z: -200
            scale: Qt.vector3d(3.0, 3.0, 3.0)
            materials: PrincipledMaterial {
                metalness: 0.8
            }
        }

        ParticleSystem3D { // 粒子系统
            startTime: 15000

            SpriteParticle3D {
                id: snowParticle
                sprite: Texture {
                    source: "snowflake.png"
                }
                maxAmount: 15000
                color: "#ffffff"
                colorVariation: Qt.vector4d(0.0, 0.0, 0.0, 0.5);
                fadeInDuration: 1000
                fadeOutDuration: 1000
            }

            ParticleEmitter3D {
                particle: snowParticle
                position: Qt.vector3d(0, 500, -500)
                depthBias: -100
                scale: Qt.vector3d(15.0, 0.0, 15.0)
                shape: ParticleShape3D {
                    type: ParticleShape3D.Sphere
                }
                particleRotationVariation: Qt.vector3d(180, 180, 180)
                particleRotationVelocityVariation: Qt.vector3d(50, 50, 50);
                particleScale: 2.0
                particleScaleVariation: 0.5
                velocity: VectorDirection3D {
                    direction: Qt.vector3d(0, -200, 0)
                    directionVariation: Qt.vector3d(0, -200 * 0.4, 0)
                }
                lifeSpan: 6000
                lifeSpanVariation: 3000
                emitRate: 600
            }
        }
    }
}
