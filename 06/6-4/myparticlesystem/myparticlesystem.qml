import QtQuick
import QtQuick.Particles

Rectangle {
    width: 240; height: 280; color: "#222222"

    ParticleSystem {
        anchors.fill: parent

        ImageParticle {
            groups: ["smoke"]; color: "#11111111"
            source: "qrc:///particleresources/glowdot.png"
        }
        ImageParticle {
            groups: ["flame"]
            source: "qrc:///particleresources/glowdot.png"
            color: "#11ff400f"; colorVariation: 0.1
        }
        Emitter {
            id: emitter
            anchors.centerIn: parent; group: "flame"
            emitRate: 120; lifeSpan: 1200
            size: 20; endSize: 10; sizeVariation: 10
            acceleration: PointDirection { y: -40 }
            velocity: AngleDirection {
                angle: 270; magnitude: 20;
                angleVariation: 22; magnitudeVariation: 5
            }
        }
        TrailEmitter {
            group: "smoke"; follow: "flame"
            emitRatePerParticle: 1; lifeSpan: 2400; lifeSpanVariation: 400
            size: 16; endSize: 8; sizeVariation: 8
            acceleration: PointDirection { y: -40 }
            velocity: AngleDirection {
                angle: 270; magnitude: 40;
                angleVariation: 22; magnitudeVariation: 5
            }
        }
        Image {
            source: "match.png"
            sourceSize: Qt.size(100, 100)
            anchors.top: emitter.bottom; anchors.topMargin: -25
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: -20
        }
    }
}
