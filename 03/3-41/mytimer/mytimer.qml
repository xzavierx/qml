import QtQuick

Item {
    Timer {
        interval: 1000; running: true; repeat: true
        onTriggered: time.text = Date().toString()
    }

    Text { id: time }
}
