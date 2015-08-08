import QtQuick 2.4
//import QtQml.Models 2.1
Rectangle {
    id: helpfile_2
    width: 1024; height: 540
//    color: "transparent"
    color: "#6C646A"
     gradient: Gradient {
         GradientStop { position: 0.0; color: "#6C646A" }
         GradientStop { position: 1.0; color: Qt.darker("#6A6D6A") }
     }
     Text {
         id: label1
         width:200
         height: 30
         anchors.top: parent.top
         anchors.topMargin: 300
         anchors.horizontalCenter: parent.horizontalCenter
         text: qsTr("helpfile2")
         font.pointSize: 30
     }

 }
