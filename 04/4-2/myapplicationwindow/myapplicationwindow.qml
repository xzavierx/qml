import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    title: "My Application"
    width: 600; height: 450
    visible: true

    menuBar: MenuBar {
        id: menuBar

        Menu {
            id: fileMenu
            title: qsTr("文件")

            MenuItem {
                text: qsTr("关闭")
                icon.source: "close.png"
                onTriggered: close()
            }
            MenuSeparator {}
            MenuItem {
                text: qsTr("关于")
                icon.source: "about.png"
                onTriggered: popup.open()
            }
        }
    }

    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            ToolButton {
                text: qsTr("<")
                visible: footerbar.currentIndex === 0
                enabled: stack.depth > 1
                onClicked: stack.pop()
            }

            ToolButton {
                text: qsTr(">")
                visible: footerbar.currentIndex === 0
                enabled: stack.depth < 3
                onClicked: stack.push(mainView)
            }
            PageIndicator {
                id: indicator
                visible: footerbar.currentIndex === 0
                count: stack.depth
                currentIndex: stack.depth
            }
            Label {
                text: "工具栏"
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
            ToolButton {
                text: qsTr("⋮")
                onClicked: popup.open()
            }
        }
    }

    Popup {
        id: popup
        parent: Overlay.overlay
        x: Math.round((parent.width - width) / 2)
        y: Math.round((parent.height - height) / 2)
        width: 250; height: 150
        modal: true
        focus: true

        Label {
            id: label
            text: "这是个Popup"
            font.pixelSize: 16
            font.italic: true
            x: Math.round((parent.width - width) / 2)
            y: Math.round((parent.height - height) / 2)
        }

        Button {
            text: "Ok"
            onClicked: popup.close()
            anchors.top: label.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: label.horizontalCenter
        }
    }

    footer: TabBar {
        id: footerbar
        width: parent.width

        TabButton {
            text: qsTr("图片")
        }
        TabButton {
            text: qsTr("音乐")
        }
        TabButton {
            text: qsTr("视频")
        }
    }

    StackLayout {
        id: view
        currentIndex: footerbar.currentIndex
        anchors.fill: parent

        StackView {
            id: stack
            initialItem: mainView
        }
        Rectangle {
            id: secondPage
            color: "lightyellow"
        }
        Rectangle {
            id: thirdPage
            color: "lightblue"
        }
    }

    Component {
        id: mainView
        Item {
            Rectangle {
                anchors.fill: parent
                Image {
                    anchors.fill: parent
                    source: stack.depth + ".png"
                }
                Text {
                    text: qsTr("页面") + stack.depth
                }

            }
        }
    }
}










