
import QtQuick 2.4
//import QtQml.Models 2.1
import ""
Rectangle {
    id: devsetlearn
    width: 1024; height: 540
//    color: "transparent"
    color: "#6C646A"
     gradient: Gradient {
         GradientStop { position: 0.0; color: "#6C646A" }
         GradientStop { position: 1.0; color: Qt.darker("#6A6D6A") }
     }
     Row {
         spacing: 80
         Column {
             spacing: 10
             Text{
                 id: text1;width:50;height:20;text: qsTr("        当前数"); font.pointSize: 18
                 horizontalAlignment: Text.AlignHCenter
             }
             Label {
                 id:currentcount;labelWidth: 100;labelHeight:  40;labeltext: "00000";labelSize: 16
             }
         }

 }
