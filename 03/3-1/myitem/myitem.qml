import QtQuick

//Item {
//    Rectangle {
//        color: "lightgrey"
//        width: 100; height: 100
//        Rectangle {
//            color: "black"
//            x: 50; y: 50; width: 100; height: 100
//        }
//    }
//}

Item {
    Rectangle {
        opacity: 0.5
        color: "red"
        width: 100; height: 100
        Rectangle {
            color: "blue"
            x: 50; y: 50; width: 100; height: 100
        }
    }
}