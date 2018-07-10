import QtQuick 2.2

Item {
    id: root
    width: 1152
    height: 864
    focus: true

    Rectangle
    {
        z: -200
        id: background
        anchors.fill: parent
        color: "#101f0f"
    }

    Rectangle {
        anchors.bottom: parent.bottom
        anchors.right: parent.right

        Column {

            anchors.bottom: parent.verticalCenter
            anchors.bottomMargin: 4
            anchors.right: parent.horizontalCenter
            anchors.rightMargin: 10

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
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        z: -100
        source: "./nihwk.png"
    }

    function timeChanged() {
        var dt = new Date;
        time.text = dt.toLocaleTimeString(Qt.locale("en_UK"), "hh:mm:ss");
        date.text = dt.toLocaleDateString(Qt.locale("en_UK"), "ddd d MMM");
    }


}
