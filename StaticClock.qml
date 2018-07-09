import QtQuick 2.2

Item {
    id: root
    width: 660
    height: 706

    Rectangle {
        anchors.verticalCenter: parent.bottom
        anchors.horizontalCenter: parent.right

        Column {

            anchors.top: parent.verticalCenter
            anchors.topMargin: 4
            anchors.left: parent.horizontalCenter
            anchors.leftMargin: 10

            StyledText {
                id: time
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true; font.pixelSize: 68
            }

            StyledText {
                id: date
                anchors.horizontalCenter: parent.horizontalCenter
                font.bold: true; font.pixelSize: 28
            }

        }
        Timer {
            interval: 100; running: true; repeat: true;
            onTriggered: timeChanged()
        }
    }

    Image {
        z: -100
        source: "./nihwk.png"
    }

    function timeChanged() {
        var dt = new Date;
        time.text = dt.toLocaleTimeString(Qt.locale("en_UK"), "hh:mm");
        date.text = dt.toLocaleDateString(Qt.locale("en_UK"), "ddd d MMM");
    }


}