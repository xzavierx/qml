import QtQuick
import QtMultimedia

Text {
    text: "Click Me!";
    font.pointSize: 24;
    width: 150; height: 50;

    SoundEffect {
        id: playSound
        source: "soundeffect.wav"
    }

    MouseArea {
        id: playArea; anchors.fill: parent
        onPressed: { playSound.play() }
    }
}


