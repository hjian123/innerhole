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
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQuick.Layouts 1.1
Rectangle {
    id: monitor
    width: 1024; height: 600
    color: "transparent"
    property color fileColor: "plum"
    property color editColor: "powderblue"

    property real partition: 1 / 10

    signal backClick()
    signal nextClick()
    signal reloadchaxin(bool bValue)
    signal clearRuningData(int index,bool bValue)
    signal setRuningData(int index)

    property alias tab1: sysTab1.item
    property alias tab2: sysTab2.item
    property alias tab3: sysTab3.item
    property alias tabcIndex: tabView.currentIndex

    Rectangle {
        id: labelList
        height: parent.height * partition
        width: parent.width
        color: "beige"
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#8C8F8C" }
            GradientStop { position: 0.17; color: "#6A6D6A" }
            GradientStop { position: 0.98;color: "#3F3F3F" }
            GradientStop { position: 1.0; color: "#0e1B20" }
        }

      Labelcust1{
            id:label1;labelWidth: parent.width*1/4;labelHeight:  parent.height
            labeltext: "运行监控"
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
                onButtonClick: {
                    backClick();
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
               onButtonClick: {

            }
 }
     }
    Rectangle {
        height: parent.height * (1-partition)
        width: parent.width
        id: monitorect;
        color: "lightgray"
        y:60;
        TabView {
            id: tabView;
            anchors.fill: parent;
            style: TabViewStyle {
                tab: Item{
                    implicitWidth: Math.max(text.width + 8, 80);
                    implicitHeight: 48;
                    Rectangle {
                        width: (styleData.index < control.count - 1) ? (parent.width - 2) : parent.width;
                        height: parent.height - 4;
                        anchors.top: parent.top;
                        anchors.left: parent.left;
                        anchors.leftMargin: 1;
                        visible: styleData.selected;
                        gradient: Gradient {
                            GradientStop{position: 0.0; color: "#606060";}
                            GradientStop{position: 0.5; color: "#c0c0c0";}
                            GradientStop{position: 1.0; color: "#a0a0a0";}
                        }
                    }
                    Rectangle {
                        width: 2;
                        height: parent.height - 4;
                        anchors.top: parent.top;
                        anchors.right: parent.right;
                        visible: styleData.index < control.count - 1;
                        gradient: Gradient {
                            GradientStop{position: 0.0; color: "#404040";}
                            GradientStop{position: 0.5; color: "#707070";}
                            GradientStop{position: 1.0; color: "#404040";}
                        }
                    }
                    RowLayout {
                        implicitWidth: Math.max(text.width, 72);
                        height: 48;
                        anchors.centerIn: parent;
                        z: 1;
//                        Image{
//                            width: 48;
//                            height: 48;
//                            source: warnrect.icons[styleData.index%3];
//                        }
                        Text {
                            id: text;
                            text: styleData.title;
                            font.pointSize: 20;
                            color: styleData.selected ? "blue" : (styleData.hovered ? "green" : "white");
                        }
                    }
                }
                tabBar: Rectangle {
                    height: 56;
                    gradient: Gradient {
                        GradientStop{position: 0.0; color: "#484848";}
                        GradientStop{position: 0.3; color: "#787878";}
                        GradientStop{position: 1.0; color: "#a0a0a0";}
                    }
                    Rectangle {
                        width: parent.width;
                        height: 4;
                        anchors.bottom: parent.bottom;
                        border.width: 2;
                        border.color: "#c7c7c7";
                    }
                }
            }
            Tab {
               id:sysTab1
               title: "系统查询"
               source: "Monitor_sys1.qml"
               active: true

            }
            Tab {
               id:sysTab2
               title: "原点查询&触点查询"
               source: "Monitor_contactor.qml"
               active: true
            }
            Tab {
               id:sysTab3
               title: "运行数据统计&版本信息"
               source: "Monitor_rundata.qml"
               active: true
            }

        }
        Component.onCompleted: {
            sysTab1.item.reload.connect(reloadchaxin);
            sysTab3.item.clear.connect(clearRuningData);
            sysTab3.item.setBtClicked.connect(setRuningData);
        }
    }

}
