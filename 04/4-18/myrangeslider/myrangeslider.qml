import QtQuick
import QtQuick.Controls

Window {
    width: 640; height: 480
    visible: true

    RangeSlider {
        from: 1; to: 100
        first.value: 25; second.value: 75

        first.onMoved: console.log(first.value + "," + second.value)
        second.onMoved: console.log(first.value + "," + second.value)
    }

    Slider {
        x: 200
        from: 1; to: 100; value: 25; stepSize: 10
        onMoved: console.log(value)
    }
}
