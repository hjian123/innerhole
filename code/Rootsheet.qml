/**********
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
* Description :开机欢迎界面，添加到顶层innerhole.qml中

****************************************************************************/

import  QtQuick 2.4

Rectangle {
    id: rootsheet
    height: 600
    width: 1024

       color: "#6C646A"
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#6C646A" }
            GradientStop { position: 1.0; color: Qt.darker("#6A6D6A") }
        }
        signal rootsheetClick()
//        Image {
//            anchors.top: parent.top
//            anchors.topMargin: 10
//            anchors.right: parent.right
//            anchors.rightMargin: 10
//            width: 105; height: 85
//            fillMode: Image.PreserveAspectFit
//            source: "ptsrc/sdc.png"
//        }
        Text {
            id: label1
//            width:300
//            height: 60
            anchors.top: parent.top
            anchors.topMargin: 100
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("插芯内孔磨圆机\n   SDC-B125")
            font.pointSize: 40
        }
        Rectangle{
            width: 310; height: 110
            anchors.top: parent.top
            anchors.topMargin: 250
            anchors.horizontalCenter: parent.horizontalCenter
            color:"orange"
            radius: 10
            Buttoncust {
                id:button
                width: 300; height: 100
                anchors.centerIn: parent
                label: "轻触此键进\n入操作画面"
                labelSize: 20
                labelColor: "red"
                radius: 10
                color: "plum"
                opacity: 0.8
//                gradient: Gradient {
//                    GradientStop { position: 0.0; color: "plum" }
//                    GradientStop { position: 1.0; color: "#136F6F6F" }
//                }
                onButtonClick:rootsheetClick()
            }
        }
//            Text {
//                id: label2
//                width:500
//                height: 200
//                anchors.top: parent.top
//                anchors.topMargin: 180
//                wrapMode:Text.WordWrap
//                anchors.horizontalCenter: parent.horizontalCenter
//                horizontalAlignment: Text.AlignHCenter
//                text: qsTr("深圳市三鼎川精密自动化科技有限公司 \
//                                 SDC AUTOMATION TECHNOLOGY CO.,LTD. \
//                                 Tel：0755-2797 8357 Fax：0755-2797 8571 \
//                                    http://www.sdc-group.com.cn/")
//                font.pointSize: 14
//            }
                    Text {
                        id: label2
                        width:parent.width
                        height: 50
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 30
                        wrapMode:Text.WordWrap
                        anchors.horizontalCenter: parent.horizontalCenter
                        horizontalAlignment: Text.AlignHCenter
                        text: "***欢迎您使用本公司设计生产的设备***请轻触屏幕进入操作界面***"
                        color:"lightgreen"
                        font.pointSize: 14
                    }
 }
