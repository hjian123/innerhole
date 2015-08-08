/****************************************************************************
*         shenzhen SDC
*
*         (c) Copyright YYYY
*
*         All rights reserved.
*
* Filename :Rootsheet.qml
* Programmer(s): hjian
*
* Created : 2015/05/21
* Description :手动操作界面的定义
****************************************************************************/

import QtQuick 2.4
import QtQml.Models 2.1
//import "helpfile"
Rectangle {
    id: helpfile
    width: 1024; height: 600
    color: "transparent"
    property color fileColor: "plum"
    property color editColor: "powderblue"

    property real partition: 1 / 10

    signal backClick()
    signal nextClick()
    Column {
        anchors.fill: parent
        z: 1

        Rectangle {
            id: labelList
            height: helpfile.height * partition
            width: helpfile.width
            color: "beige"
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#8C8F8C" }
                GradientStop { position: 0.17; color: "#6A6D6A" }
                GradientStop { position: 0.98;color: "#3F3F3F" }
                GradientStop { position: 1.0; color: "#0e1B20" }
            }

          Labelcust1{
                id:label1;labelWidth: parent.width*1/4;labelHeight:  parent.height
                labeltext: "项目设定"
                anchors.top:parent.top;anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                touchenabled: false
                labelSize: 20
            }
          Buttoncust{
                id: backbutton
                buttonHeight:50; buttonWidth: 50
                anchors.left: parent.left;anchors.leftMargin: 50
                anchors.verticalCenter:  parent.verticalCenter
                buttonColor:"transparent"
                Image {
                    id: backIcon
                    source: "ptsrc/arrow.png"
                    width:sourceSize.width;height: sourceSize.width
                    fillMode: Image.Pad
                    anchors.centerIn: parent
                    rotation:90
                    Behavior { NumberAnimation { property: "rotation"; easing.type: Easing.OutExpo } }
                }
                    onButtonClick:  {
                        if(helpfileListView.currentIndex==0) backClick();
                        else helpfileListView.currentIndex--;
                        }
            }
          Buttoncust{
                id: nextbutton
                height:50; width: 50
                anchors.right: parent.right;anchors.rightMargin: 50
                anchors.verticalCenter: parent.verticalCenter
                buttonColor:"transparent"
                Image {
                    id: nextIcon
                    width:sourceSize.width;height: sourceSize.width
                    source: "ptsrc/arrow.png"
                    anchors.centerIn: parent
                    fillMode: Image.Pad
                    rotation:270
                    Behavior { NumberAnimation { property: "rotation"; easing.type: Easing.OutExpo } }
                }
                   onButtonClick:  {
                         if(helpfileListView.currentIndex>=2) helpfileListView.currentIndex = 0;  //nextClick()
                         else {helpfileListView.currentIndex++;}
                }
     }
        // A ListView will display a model according to a delegate
         }
        ListView {
          id: helpfileListView
          width: helpfile.width
          height: 9 * helpfile.height * partition

          // The model contains the data
          model: helpfileListModel

          //control the movement of the menu switching
          snapMode: ListView.SnapOneItem
          orientation: ListView.Horizontal
          boundsBehavior: Flickable.StopAtBounds
          flickDeceleration: 5000
          highlightFollowsCurrentItem: true
          highlightMoveDuration: 240
          highlightRangeMode: ListView.StrictlyEnforceRange
      }
    // A list of visual items that already have delegates handling their display
       ObjectModel {
        id: helpfileListModel

//       Helpfile_1 {
//            id: helpfile1
//            width: helpfileListView.width
//            height: helpfileListView.height
//            color: fileColor
//        }
//      Helpfile_2 {
//            id: helpfile2
//            width: helpfileListView.width
//            height: helpfileListView.height
//            color: fileColor
//        }
//        Helpfile_3 {
//            id: helpfile3
//            width: helpfileListView.width
//            height: helpfileListView.height
//            color: fileColor
//        }
    }
    }
}
