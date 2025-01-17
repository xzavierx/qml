import QtQuick
import QtCharts

Window {
    visible: true
    width: 640
    height: 480

    ChartView {
        title: "Bar series"
        anchors.fill: parent
        antialiasing: true

        legend {
            alignment: Qt.AlignBottom
            backgroundVisible: true
            color: "lightblue"
            borderColor: "blue"
            font.bold: true
            font.pointSize: 15
            labelColor: "gold"
            markerShape: Legend.MarkerShapeCircle
        }

        BarSeries {
            id: mySeries
            axisX: BarCategoryAxis { categories: ["2007", "2008", "2009" ] }
            BarSet { label: "Bob"; values: [2, 2, 3] }
            BarSet { label: "Susan"; values: [5, 1, 2] }
            BarSet { label: "James"; values: [3, 5, 8] }
        }
    }
}





