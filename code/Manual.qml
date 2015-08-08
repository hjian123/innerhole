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
Rectangle {
    id: manual
    width: 1024; height: 600
    color: "transparent"
    property color fileColor: "plum"
    property color editColor: "powderblue"

    property real partition: 1 / 10

    property real buttonwidth: 150
    property real buttonheight: 80
    property real fontSize: 18

    property real r11Value: 0
    property real r12Value: 0

    property bool btValue1: false
    property bool btValue2: false
    property bool btValue3: false
    property bool btValue4: false
    property bool btValue5: false
    property bool btValue6: false
    property bool btValue7: false
    property bool btValue8: false
    property bool btValue9: false
    property bool btValue10: false
    property bool btValue11: false
    property bool btValue12: false
    property bool btValue13: false
    property bool btValue14: false
    property bool btValue15: false
    property bool btValue16: false
    property bool btValue17: false
    property bool btValue18: false
    property bool btValue19: false
    property bool btValue20: false
    property bool btValue21: false
    property bool btValue22: false

    signal backClick()
    signal nextClick()
    signal btClicked(real index,bool bValue)

    onR11ValueChanged: {
        btValue1=(r11Value &(1<<0));
        btValue2=(r11Value &(1<<2));
        btValue3=(r11Value &(1<<1));
        btValue4=(r11Value &(1<<3));
        btValue5=(r11Value &(1<<4));
        btValue6=(r11Value &(1<<6));
        btValue7=(r11Value &(1<<5));
        btValue8=(r11Value &(1<<7));
        btValue9=(r11Value &(1<<8));
        btValue10=(r11Value &(1<<10));
        btValue11=(r11Value &(1<<9));
        btValue12=(r11Value &(1<<11));
        btValue13=(r11Value &(1<<12));
        btValue14=(r11Value &(1<<14));
        btValue15=(r11Value &(1<<13));
        btValue16=(r11Value &(1<<15));
        btValue19=(r11Value &(1<<9));
        btValue20=(r11Value &(1<<12));
    }
    onR12ValueChanged: {
        btValue17=(r12Value &(1<<0));
        btValue18=(r12Value &(1<<1));
        btValue22=(r12Value &(1<<5));
    }

    Column {
        anchors.fill: parent
        z: 1 
     //   spacing: 10;

        Rectangle {
            id: labelList1
            height: manual.height * partition
            width: manual.width
            color: "beige"
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#8C8F8C" }
                GradientStop { position: 0.17; color: "#6A6D6A" }
                GradientStop { position: 0.98;color: "#3F3F3F" }
                GradientStop { position: 1.0; color: "#0e1B20" }
            }

          Labelcust1{
                id:label1;labelWidth: parent.width*1/4;labelHeight:  parent.height
                labeltext: "手动/加载插芯 "
                anchors.top:parent.top;anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                touchenabled: false
                labelSize: 20
            }
          Buttoncust{
                id: backbutton
                buttonHeight:parent.height; buttonWidth: parent.height
                anchors.left: parent.left;anchors.leftMargin: 50
                anchors.verticalCenter:  parent.verticalCenter
                buttonColor:"transparent"
                Image {
                    id: backIcon
                    source: "ptsrc/arrow.png"
                    width:sourceSize.width;height: sourceSize.width
                    anchors.centerIn: parent
                    fillMode: Image.Pad
                    rotation:90
                    Behavior { NumberAnimation { property: "rotation"; easing.type: Easing.OutExpo } }
                }
                    onButtonClick:  {backClick();
//                        if(manualListView.currentIndex==0) 
//                        else manualListView.currentIndex--;
                        }
            }
//          Button{
//                id: nextbutton
//                height:50 ;width: 50
//                anchors.right: parent.right;anchors.rightMargin: 50
//                anchors.verticalCenter: parent.verticalCenter
//                buttonColor:"transparent"
//                Image {
//                    id: nextIcon
//                    width:sourceSize.width;height: sourceSize.width
//                    source: "ptsrc/arrow.png"
//                    anchors.centerIn: parent
//                    fillMode: Image.Pad
//                    rotation:270
//                    Behavior { NumberAnimation { property: "rotation"; easing.type: Easing.OutExpo } }
//                }
//                   onButtonClick: {
//                         if(manualListView.currentIndex>=2) manualListView.currentIndex = 0;  //nextClick()
//                         else {manualListView.currentIndex++;}
//                }
//     }
         }   
        Rectangle {
            id: labelList2
            height: manual.height * (1-partition)
            width: manual.width
        // color: "transparent"
            color: "#6C646A"
             gradient: Gradient {
                 GradientStop { position: 0.0; color: "#6C646A" }
                 GradientStop { position: 1.0; color: Qt.darker("#6A6D6A") }
             }
           
             Row {
           //      anchors.fill: parent
                 spacing: 20;
                 anchors.left: parent.left
                 anchors.leftMargin: 10
                 anchors.top:parent.top

                 Column{
                     spacing: 10;
                     Rectangle{
                         id:space1
                         height: 10
                         width:200
                         color: "transparent"
                     }
                     Text {
                         id: text1
                         width:200
                         height: 40
                         text: qsTr("     加载插芯部分")
                         y:80
                         font.pointSize: 26
                     }
                     Grid {
                         rows: 4;  columns: 2;  rowSpacing: 20;  columnSpacing: 20
                         Buttoncust{
                             id:button1
                              buttonWidth:buttonwidth; buttonHeight:buttonheight
                             label: btValue1 ?"插芯进给器 \n工作中" : "插芯进给器 \n已关闭"
                             labelSize: fontSize
                             radius: 2
                             labelColor: "black"
                             color: btValue1 ?"lightgreen" :"gray"
                             onButtonClick: {btClicked(1,btValue1);}
                         }
                         Buttoncust{
                             id:button2
                              buttonWidth:buttonwidth; buttonHeight:buttonheight
                             label: btValue2 ?"90°垂直旋转 \n已水平" :"垂直旋转 \n已垂直"
                             labelSize: fontSize
                             radius: 2
                             labelColor: "black"
                             color: btValue2 ?"lightgreen" :"gray"
                             onButtonClick: {btClicked(2,btValue2);}
                         }
                         Buttoncust{
                             id:button3
                              buttonWidth:buttonwidth; buttonHeight:buttonheight
                             label: btValue3 ?"180°水平旋转 \n已打开" :"180°水平旋转 \n已关闭"
                             labelSize: fontSize
                             radius: 2
                             labelColor: "black"
                             color: btValue3 ?"lightgreen" :"gray"
                             onButtonClick: {btClicked(3,btValue3);}
                         }
                         Buttoncust{
                             id:button4
                              buttonWidth:buttonwidth; buttonHeight:buttonheight
                             label: btValue4 ?"180°前后横移 \n已缩回" :"180°前后横移 \n已伸出"
                             labelSize: fontSize
                             radius: 2
                             labelColor: "black"
                             color: btValue4 ?"lightgreen" :"gray"
                             onButtonClick: {btClicked(4,btValue4);}
                         }
                         Buttoncust{
                             id:button5
                              buttonWidth:buttonwidth; buttonHeight:buttonheight
                             label: btValue5 ?"主轴夹持头 \n已打开" :"主轴夹持头 \n已夹紧"
                             labelSize: fontSize
                             radius: 2
                             labelColor: "black"
                             color: btValue5 ?"lightgreen" :"gray"
                             onButtonClick: {btClicked(5,btValue5);}
                         }
                         Buttoncust{
                             id:button6
                              buttonWidth:buttonwidth; buttonHeight:buttonheight
                             label: btValue6 ?"上装载夹子 \n已打开" :"上装载夹子 \n已夹紧"
                             labelSize: fontSize
                             radius: 2
                             labelColor: "black"
                             color: btValue6 ?"lightgreen" :"gray"
                             onButtonClick: {btClicked(6,btValue6);}
                         }
                         Buttoncust{
                             id:button7
                              buttonWidth:buttonwidth; buttonHeight:buttonheight
                             label: btValue7 ?"插芯顶针 \n已伸出" :"插芯顶针 \n已缩回"
                             labelSize: fontSize
                             radius: 2
                             labelColor: "black"
                             color: btValue7 ?"lightgreen" :"gray"
                             onButtonClick: {btClicked(7,btValue7);}
                         }
                         Buttoncust{
                             id:button8
                              buttonWidth:buttonwidth; buttonHeight:buttonheight
                             label: btValue8 ?"下卸载夹子 \n已打开" :"下卸载夹子 \n已夹紧"
                             labelSize: fontSize
                             radius: 2
                             labelColor: "black"
                             color: btValue8 ?"lightgreen" :"gray"
                             onButtonClick: {btClicked(8,btValue8);}
                         }
                     }
                 }
                 Column{
                     spacing: 10;
                     Rectangle{
                         id:space2
                         height: 10
                         width:200
                         color: "transparent"
                     }
                     Text {
                         id: text2
                         width:200
                         height: 40
                         text: qsTr("      磨削加工")
                         font.pointSize: 26
                         y:80
                     }
                     Grid {
                         rows: 4;  columns: 2;  rowSpacing: 20;  columnSpacing: 20

                         Buttoncust{
                             id:button9
                              buttonWidth:buttonwidth; buttonHeight:buttonheight
                              label: btValue9 ?"高速主轴 \n工作中" :"高速主轴 \n已停止"
                              labelSize: fontSize
                              radius: 2
                              labelColor: "black"
                              color: btValue9 ?"lightgreen" :"gray"
                              onButtonClick: {btClicked(9,btValue9);}
                         }
                         Buttoncust{
                             id:button10
                              buttonWidth:buttonwidth; buttonHeight:buttonheight
                              label: btValue10 ?"磨削丝修整 \n已打开" :"磨削丝修整 \n已关闭"
                              labelSize: fontSize
                              radius: 2
                              labelColor: "black"
                              color: btValue10 ?"lightgreen" :"gray"
                              onButtonClick: {btClicked(10,btValue10);}
                         }
                         Buttoncust{
                             id:button11
                              buttonWidth:buttonwidth; buttonHeight:buttonheight
                              label: btValue11 ?"钻石液加注阀 \n已打开" :"钻石液加注阀 \n已关闭"
                              labelSize: fontSize
                              radius: 2
                              labelColor: "black"
                              color: btValue11 ?"lightgreen" :"gray"
                              onButtonClick: {btClicked(11,btValue11);}
                         }
                         Buttoncust{
                             id:button12
                              buttonWidth:buttonwidth; buttonHeight:buttonheight
                              label: btValue12 ?"激光扫描器 \n已打开" :"激光扫描器 \n已关闭"
                              labelSize: fontSize
                              radius: 2
                              labelColor: "black"
                              color: btValue12 ?"lightgreen" :"gray"
                              onButtonClick: {btClicked(12,btValue12);}
                         }
                         Buttoncust{
                             id:button13
                              buttonWidth:buttonwidth; buttonHeight:buttonheight
                              label: btValue13 ?"磨削丝热切刀 \n已加热" :"磨削丝热切刀 \n已关闭"
                              labelSize: fontSize
                              radius: 2
                              labelColor: "black"
                              color: btValue13 ?"lightgreen" :"gray"
                              onButtonClick: {btClicked(13,btValue13);}
                         }
                         Buttoncust{
                             id:button14
                              buttonWidth:buttonwidth; buttonHeight:buttonheight
                              label: btValue14 ?"喷嘴吹气 \n已打开" :"喷嘴吹气 \n已关闭"
                              labelSize: fontSize
                              radius: 2
                              labelColor: "black"
                              color: btValue14 ?"lightgreen" :"gray"
                              onButtonClick: {btClicked(14,btValue14);}
                         }
                         Buttoncust{
                             id:button15
                              buttonWidth:buttonwidth; buttonHeight:buttonheight
                              label: btValue15 ?"丢弃废丝位 \n吹气已开" :"丢弃废丝位 \n吹气已关"
                              labelSize: fontSize
                              radius: 2
                              labelColor: "black"
                              color: btValue15 ?"lightgreen" :"gray"
                              onButtonClick: {btClicked(15,btValue15);}
                         }
                         Buttoncust{
                             id:button16
                              buttonWidth:buttonwidth; buttonHeight:buttonheight
                              label: btValue16 ?"高速主轴 \n已关闭" :"丢弃废丝夹 \n已打开"
                              labelSize: fontSize
                              radius: 2
                              labelColor: "black"
                              color: btValue16 ?"lightgreen" :"gray"
                              onButtonClick: {btClicked(16,btValue16);}
                         }
                     }
                 }
                 Column{
                     spacing: 10;
                     Rectangle{
                         id:space3
                         height: 10
                         width:200
                         color: "transparent"
                     }
                     Text {
                         id: text3
                         width:200
                         height: 40
                         text: qsTr("     磨削丝张力")
                         font.pointSize: 26
                         y:80
                     }
                     Grid {
                         rows: 3;  columns: 2;  rowSpacing: 20;  columnSpacing: 20
                     Buttoncust{
                         id:button17
                          buttonWidth:buttonwidth; buttonHeight:buttonheight
                          label: btValue17 ?"磨削丝顶杆 \n已抬起" :"磨削丝顶杆 \n已下降"
                          labelSize: fontSize
                          radius: 2
                          labelColor: "black"
                          color: btValue17 ?"lightgreen" :"gray"
                          onButtonClick: {btClicked(17,btValue17);}
                     }
                     Buttoncust{
                         id:button18
                          buttonWidth:buttonwidth; buttonHeight:buttonheight
                          label: btValue18 ?"磨削丝张力杆 \n已松开" :"磨削丝张力杆 \n已张紧"
                          labelSize: fontSize
                          radius: 2
                          labelColor: "black"
                          color: btValue18 ?"lightgreen" :"gray"
                          onButtonClick: {btClicked(18,btValue18);}
                     }
                     Buttoncust{
                         id:button19
                          buttonWidth:buttonwidth; buttonHeight:buttonheight
                          label: btValue19 ?"钻石液加注阀 \n已打开" :"钻石液加注阀 \n已关闭"
                          labelSize: fontSize
                          radius: 2
                          labelColor: "black"
                          color: btValue19 ?"lightgreen" :"gray"
                          onButtonClick: {btClicked(19,btValue19);}
                     }
                     Buttoncust{
                         id:button20
                          buttonWidth:buttonwidth; buttonHeight:buttonheight
                          label: btValue20 ?"磨削丝热切刀 \n已加热" :"磨削丝热切刀 \n已关闭"
                          labelSize: fontSize
                          radius: 2
                          labelColor: "black"
                          color: btValue20 ?"lightgreen" :"gray"
                          onButtonClick: {btClicked(20,btValue20);}
                     }
                     Buttoncust{
                         id:button21
                          buttonWidth:buttonwidth; buttonHeight:buttonheight
                          label: btValue21 ?"手动确认无错 \n重新下落插芯" :"重新下落插芯"
                          labelSize: fontSize
                          radius: 2
                          labelColor: "black"
                          color: btValue21 ?"gray" :"blue"
                          onButtonClick: {btClicked(21,btValue21);}
                     }
                     Buttoncust{
                         id:button22
                          buttonWidth:buttonwidth; buttonHeight:buttonheight
                          label: btValue22 ?"搅拌钻石液中" :"搅拌钻石液"
                          labelSize: fontSize
                          radius: 2
                          labelColor: "black"
                          color: btValue22 ?"lightgreen" :"gray"
                          onButtonClick: {btClicked(22,btValue22);}
                     }
                     }
                 }
             }
         }
    }
}

