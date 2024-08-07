import QtQuick
import QtQml.XmlListModel
import QtQuick.Controls

Rectangle {
    width: 300; height: 400

    XmlListModel {
        id: xmlModel
        source: "http://www.people.com.cn/rss/edu.xml"
        query: "/rss/channel/item"

        XmlListModelRole { name: "title"; elementName: "title" }
        XmlListModelRole { name: "pubDate"; elementName: "pubDate" }
    }

    ListView {
        id: view
        anchors.fill: parent
        model: xmlModel
        focus: true
        spacing: 8
        delegate: Label {
            id: label
            width: view.width; height: 50
            verticalAlignment: Text.AlignVCenter
            text: title + ": " + pubDate
            font.pixelSize: 15; elide: Text.ElideRight
            color: label.ListView.isCurrentItem ? "white" : "black"
            background: Image {
                visible: label.ListView.isCurrentItem
                source: "bg.png"
            }
        }
    }
}





