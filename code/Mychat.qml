import QtQuick 2.0
import QtQuick.Layouts 1.1

Rectangle {
    width: parent.width
    height: parent.height
    id:main
    property alias color1: rect1.color
    ColumnLayout{
        spacing: 2

        Rectangle {
            id:rect1
            Layout.alignment: Qt.AlignCenter
            color: "red"
            Layout.preferredWidth: main.width
            Layout.preferredHeight: main.height/4
        }

        Rectangle {
            Layout.alignment: Qt.AlignRight
            color: "green"
            Layout.preferredWidth: main.width
            Layout.preferredHeight: main.height/2
            Text {
                id: txt
                text: qsTr("text")
                anchors.fill: parent
                font.pixelSize: 20
            }
        }

        Rectangle {
            Layout.alignment: Qt.AlignBottom
            Layout.fillHeight: true
            color: "gray"
            Layout.preferredWidth: main.width
            Layout.preferredHeight: main.height/4
            border.width: 2
            border.color: "white"
            TextEdit{
                id:edit
                anchors.fill: parent
                anchors.margins: 10
            }
        }
    }

    function setInfo(str)
    {
        txt.text = str;
    }
}
