import QtQuick
import QtQuick.Controls

Window {
    id: root
    property bool changed: true

    width: 640; height: 480
    x: 100; y:100
    visible: true
    title: qsTr("My Window")
    opacity: 0.7
    color: "lightblue"

    onClosing: (close) => {
                   if (changed) {
                       close.accepted = false
                       dialog.show()
                   }
               }

    Window {
        id: dialog
        width: 300; height: 200
        flags : Qt.Dialog
        modality : Qt.WindowModal

        Label {
            text: qsTr("确定要退出吗？")
            x: 120; y: 50
        }

        Row {
            spacing: 10
            x:120; y:80

            Button {
                text: qsTr("确定")
                onClicked: {
                    root.changed = false
                    dialog.close()
                    root.close()
                }
            }
            Button {
                text: qsTr("取消")
                onClicked: {
                    dialog.close()
                }
            }
        }
    }
}



