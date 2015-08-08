
import QtQuick 2.4
//import QtQml.Models 2.1
import an.qt.Comboxcust 1.0
import QtQuick.Layouts 1.1
Rectangle {
    id: helpfile_1
    width: 1024; height: 540
//    color: "transparent"
    color: "#6C646A"
     gradient: Gradient {
         GradientStop { position: 0.0; color: "#6C646A" }
         GradientStop { position: 1.0; color: Qt.darker("#6A6D6A") }
     }

     ColumnLayout{
         anchors.left:parent.left;
         anchors.top:parent.top
         anchors.topMargin: 200
         height:300;width:600
         spacing: 10
         Text {
             id: label1
             width:200
             height: 30
             anchors.top: parent.top
             anchors.topMargin:80
             anchors.horizontalCenter: parent.horizontalCenter
             text: qsTr("helpfile1")
             font.pointSize: 30
         }
//     Comboxcust {
//         id :combox1
//         currentindex:comboxindex
////                     cheight:30
////                     cwidth:300
//      Component.onCompleted: {
//         addContent("请选择位置");
//         addContent("1-原点参照");
//         addContent("2-确认圆锥");
//         addContent("3-供给插芯");
//         addContent("4-孔径OK");
//         addContent("5-没有接触");
//         addContent("6-没有通过");
//         addContent("7-等待位置");
//         addContent("8-主轴出插芯");
//         addContent("9-主轴入插芯");
//      }
//     }
//     Comboxcust {
//         id :combox2
//         currentindex:comboxindex
////                     cheight:30
////                     cwidth:300
//      Component.onCompleted: {
//         addContent("请选择位置");
//         addContent("1-原点参照");
//         addContent("2-确认圆锥");
//         addContent("3-供给插芯");
//         addContent("4-孔径OK");
//         addContent("5-没有接触");
//         addContent("6-没有通过");
//         addContent("7-等待位置");
//         addContent("8-主轴出插芯");
//         addContent("9-主轴入插芯");
//      }
//     }
     Text {
         id: label2
         width:200
         height: 30
         anchors.top: parent.top
         anchors.topMargin:80
         anchors.horizontalCenter: parent.horizontalCenter
         text: qsTr("helpfile2")
         font.pointSize: 30
     }
//     Comboxcust {
//         id :combox3
//         currentindex:comboxindex
////                     cheight:30
////                     cwidth:300
//      Component.onCompleted: {
//         addContent("请选择位置");
//         addContent("1-原点参照");
//         addContent("2-确认圆锥");
//         addContent("3-供给插芯");
//         addContent("4-孔径OK");
//         addContent("5-没有接触");
//         addContent("6-没有通过");
//         addContent("7-等待位置");
//         addContent("8-主轴出插芯");
//         addContent("9-主轴入插芯");
//      }
//     }
//     Comboxcust {
//         id :combox4
//         currentindex:comboxindex
////                     cheight:30
////                     cwidth:300
//      Component.onCompleted: {
//         addContent("请选择位置");
//         addContent("1-原点参照");
//         addContent("2-确认圆锥");
//         addContent("3-供给插芯");
//         addContent("4-孔径OK");
//         addContent("5-没有接触");
//         addContent("6-没有通过");
//         addContent("7-等待位置");
//         addContent("8-主轴出插芯");
//         addContent("9-主轴入插芯");
//      }
//     }
     }

 }
