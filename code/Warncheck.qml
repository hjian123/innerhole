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

import QtQuick 2.2
import QtQml.Models 2.1
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.2
import QtQuick.Layouts 1.1
//import "warncheck"
Rectangle {
    id: warncheck
    width: 1024; height: 600
    color: "transparent"
    property color fileColor: "plum"
    property color editColor: "powderblue"
    property bool resetenable: true;
 //   property date datenow:Qt.formatDateTime(new Date(), "yyyy-MM-dd\nhh:mm:ss")
    property var tab1
    property var tab2
    property real partition: 1 / 10
    property var warnArray: []
    signal backClick()
    signal nextClick()

    function getWarn(warnNumber){
        if(cWarnTab.item.viewCount>50){ //如果当前告警数量超过最大容量，则清除listview当中的第一条告警
           cWarnTab.item.warnModel.remove(0);
        }
        cWarnTab.item.addOneWarn(Qt.formatDateTime(new Date(), "yyyy-MM-dd\nhh:mm:ss"),
                                         warnNumber.toString(),warnArray[warnNumber],"red");
    }
    function savehistorywarn(){
    //    console.log(cWarnTab.item,hWarnTab.item);
        var count = cWarnTab.item.viewCount
   //     console.log("viewCount=",count);
        for(var i=0;i<count;i++){
           var data = cWarnTab.item.warnModel.get(i);
            if(hWarnTab.item.viewCount>200){ //如果当前告警数量超过最大容量，则清除listview当中的第一条告警
                hWarnTab.item.warnModel.remove(0);
            }
            hWarnTab.item.addOneWarn(data.warnTime,data.warnNumber,data.warnContent,data.warnColor);
        }
    }
    Component.onCompleted: {

        warnArray = new Array(
                "插芯针伸出未缩回","工作台没有在伸出位置","平台180旋转中",//012
                "90°处于不在水平位置","初始化前请将手动状态故障复位",//34
                "主轴电机不在原位","不能断丝操作","进丝马达位置不对",//567
                "90°位置错货插芯堆积","顶插芯气缸缩回异常","插芯丢失重新上载",//8910
                "上载下载夹子动作错误","放插芯马达有错或无插芯","平台伸出缩回异常",//11,12,13
                "L30E","顶插芯气缸异常","左旋马达故障(X302)停机","右旋转电机故障(X301)停机",//14,15,16,17,
                "主轴横移马达异常(X300)停机","进丝马达异常(X303)停机","高速主轴异常（X304)停机",//18,19,20
                "急停按钮触发（X305)停机","气源压力过低（X00A)停机","安全门打开（X08)停机",//21,22,23
                "主轴防撞触发（X09)停机","后退找拉力点出错停机","切刀加热时间超时出错停机",//24,25,26
                "未发现磨削丝或找丝失败停机","找丝感应器出错X19停机","主轴横移到左限位停机",//27,28,29
                "手动自动开关断线错误","插芯单颗加工时间超限","严重故障出现，请初始化设备",//30,31,32,
                "穿丝到目标值过程失败停机","进丝位置错请手动后退丝","进丝运算长度超过最大请修改",//33,34,35
                "左旋转初始化超时","主轴横移初始化超时","右旋转初始化超时","总初始化超时",//36,37,38,39
                "L328","L329","L32A","L32B","L32C","L32D","L32E",            //40,41,42,43,44,45,46
                "请重新复位机器到初始位置","产品连续未通过数量超限即将停机",          //47,48
                "产品未接触数量超限即将停机","总产量到达即将停机","磨削丝用完或断丝即将停机",//49,50,51
                "电热刀到达设定值即将停机","磨尖工具到达设定值即将停机","产量OK到达设定值即将停机"//52,53,54
        )
    }

    Rectangle {
        id: labelList
        height: warncheck.height * partition
        width: warncheck.width
        color: "beige"
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#8C8F8C" }
            GradientStop { position: 0.17; color: "#6A6D6A" }
            GradientStop { position: 0.98;color: "#3F3F3F" }
            GradientStop { position: 1.0; color: "#0e1B20" }
        }

      Labelcust1{
            id:label1;labelWidth: parent.width*1/4;labelHeight:  parent.height
            labeltext: "报警查看"
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
    // A ListView will display a model according to a delegate
     }
    Rectangle {
        height: warncheck.height * (1-partition)
        width: warncheck.width
        id: warnrect;
        color: "lightgray"
        y:60;
   //     property var icons: ["call1.png", "call2.png", "call3.png"];
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
               id:cWarnTab
               title: "当前警报"
               source: "Warnc.qml"
               active: true
            }
            Tab {
               id:hWarnTab
               title: "当前警报"
               source: "Warnh.qml"
               active: true
            }

            Component.onCompleted: {
         //       console.log(cWarnTab.item,hWarnTab.item);
//                warnrect.addTabs();
//               warnrect.addTabs();
             //   tab1 = tabView.getTab(0);
             //   tab2 = tabView.getTab(1);
//                console.log("tabs active? ",cWarnTab.active,hWarnTab.active);
            }

        }
        function addTabs(){
            var compoment = Qt.createComponent("Warnc.qml");
            tabView.insertTab(tabView.count,"警报",compoment);
            console.log("obj....."+tabView.count)
            tabView.currentIndex = tabView.count-1;
            var obj = tabView.getTab(tabView.currentIndex);
            if(typeof obj == "object"){
                console.log(obj,obj.item);

            }
        }
    }

}
