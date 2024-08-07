import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material

ApplicationWindow {
    id: window
    visible: true
    width: 360; height: 480

    header: ToolBar {
        Material.primary: "#41cd52"
        Material.foreground: "white"

        RowLayout {
            spacing: 20
            anchors.fill: parent

            ToolButton {
                contentItem: Image {
                    fillMode: Image.Pad
                    horizontalAlignment: Image.AlignHCenter
                    verticalAlignment: Image.AlignVCenter
                    source: "qrc:/images/drawer.png"
                }
                onClicked: drawer.open()
            }

            Label {
                id: titleLabel
                text: qsTr("示例程序")
                font.pixelSize: 20
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

            ToolButton {
                contentItem: Image {
                    fillMode: Image.Pad
                    horizontalAlignment: Image.AlignHCenter
                    verticalAlignment: Image.AlignVCenter
                    source: "qrc:/images/menu.png"
                }
                onClicked: optionsMenu.open()

                Menu {
                    id: optionsMenu
                    x: parent.width - width
                    transformOrigin: Menu.TopRight

                    MenuItem {
                        text: qsTr("关于")
                        onTriggered: aboutDialog.open()
                    }
                    MenuItem {
                        text: qsTr("退出")
                        onTriggered: Qt.quit()
                    }
                }
            }
        }
    }

    Drawer {
        id: drawer
    }

    StackView {
        id: stackView
    }

    Popup {
        id: aboutDialog
    }
}
