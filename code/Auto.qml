import QtQuick 2.4
import QtQml.Models 2.1
Rectangle {
    id: auto
    width: 1024; height: 600
    color: "beige"
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#8C8F8C" }
        GradientStop { position: 0.17; color: "#6A6D6A" }
        GradientStop { position: 0.98;color: "#3F3F3F" }
        GradientStop { position: 1.0; color: "#0e1B20" }
    }
    property real partition: 1 / 10

    property real buttonwidth: 150
    property real buttonheight: 80

    property var strgcmdindex: 0
    property color feedcolor:"gray"
    property color uploadcolor:"gray"
    property color mainincolor:"gray"
    property color toolcolor:"gray"
    property color searchcolor:"gray"
    property color inboxcolor:"gray"
    property color cutcolor:"gray"
    property color crmpcolor:"gray"
    property color orgstacolor:"gray"
    property string statetext: "2:未通过NG"
    property string dstatext: "0"
    property string tipcount: "0"
    property string timetext: "0"
    property string msgtext: "机器PLC没有运行"
    property bool butrun: true
    property bool butstop: true
    property bool butreset: true
    property bool resetenabled: true
    signal backClick()
    signal setupClick()
    signal resetClick()
    signal stopClick()
    Column {
        anchors.fill: parent
        z: 1
      //  spacing: 10;
        Rectangle {
            id: labelList1
            height: auto.height * partition
            width: auto.width
            color: "beige"
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#8C8F8C" }
                GradientStop { position: 0.17; color: "#6A6D6A" }
                GradientStop { position: 0.98;color: "#3F3F3F" }
                GradientStop { position: 1.0; color: "#0e1B20" }
            }
          Labelcust1{
                id:label1;labelWidth: parent.width*1/4;labelHeight:  parent.height
                labeltext: "自动操作 "
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
//                        if(autoListView.currentIndex==0)
//                        else autoListView.currentIndex--;
                        }
            }
          Labelcust1{
            id:time2;labelWidth: 50;labelHeight:  30
            labeltext: "17:20"
            anchors.verticalCenter:  parent.verticalCenter
            anchors.right: parent.right;anchors.rightMargin: 50
            touchenabled: false
            labelSize: 10
          }
        }
        Rectangle {
            id:details
            width: parent.width
            height: 300
            color: "beige"
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#8C8F8C" }
                GradientStop { position: 0.17; color: "#6A6D6A"}
                GradientStop { position: 0.98;color: "#3F3F3F" }
                GradientStop { position: 1.0; color: "#0e1B20" }
                }
            Row{
               anchors.top:parent.top;anchors.topMargin: 20
               width: parent.width;
               Rectangle {
                   id:space1
                   color:"transparent"
                   width: 100
                   height: parent.height
               }
               spacing: 50
               Text{
                   id:text1;width:50;height:30;text: qsTr("总原点");font.pointSize: 16
                   horizontalAlignment: Text.AlignHCenter;
               }
               Labelcust1{
                   id:orgstate;labelWidth: 50;labelHeight:30;labeltext: " ";//labelSize: 22;
                   labelColor:orgstacolor;touchenabled: false
               }
               Text{
                   id:text2;width:50;height:30;text: qsTr("状态");font.pointSize: 16
                   horizontalAlignment: Text.AlignHCenter;
               }
               Labelcust1{
                   id:tate;labelWidth: 150;labelHeight:30;labeltext: statetext;labelSize: 16;
                   touchenabled: false
               }
               Text{
                   id:text3;width:50;height:30;text: qsTr("断丝");font.pointSize: 16
                   horizontalAlignment: Text.AlignHCenter;
               }
               Labelcust1{
                   id:dstate;labelWidth: 50;labelHeight:30;labeltext: dstatext;labelSize: 16;
                   touchenabled: false
               }
            }
            Row{
               anchors.top:parent.top;anchors.topMargin: 70
               width: parent.width;
               Rectangle {
                   id:space2
                   color:"transparent"
                   width: 100
                   height: parent.height
               }
               spacing: 150
               Labelcust1{
                   id:label2;labelWidth: 100;labelHeight:30;labeltext: "插芯供给";labelSize: 16;
                   labelColor:feedcolor;touchenabled: false
               }
               Labelcust1{
                   id:label3;labelWidth: 100;labelHeight:30;labeltext: "插芯上载";labelSize: 16;
                   labelColor:uploadcolor;touchenabled: false
               }
               Labelcust1{
                   id:label4;labelWidth: 100;labelHeight:30;labeltext: "主轴进给";labelSize: 16;
                   labelColor:mainincolor;touchenabled: false
               }
            }
            Row{
               anchors.top:parent.top;anchors.topMargin: 120
               width: parent.width;
               Rectangle {
                   id:space3
                   color:"transparent"
                   width: 300
                   height: parent.height
               }
               spacing: 20
               Labelcust1{
                   id:label5;labelWidth: 100;labelHeight:30;labeltext: "磨尖工具";labelSize: 16;
                   labelColor:toolcolor;touchenabled: false
               }

               Labelcust1{
                   id:label6;labelWidth: 50;labelHeight:30;labeltext: tipcount;labelSize: 16;
                   touchenabled: false
               }
               Text{
                   id: text4;width:20;height:20;text: qsTr("个");font.pointSize: 16
                   horizontalAlignment: Text.AlignHCenter
               }
//               Rectangle {
//                   id:space5
//                   color:"transparent"
//                   width: 50
//                   height: parent.height
//               }
               Labelcust1{
                   id:label7;labelWidth: 50;labelHeight:30;labeltext: timetext;labelSize: 16;touchenabled: false
               }
               Text{
                   id: text5;width:20;height:20;text: qsTr("S");font.pointSize: 16
                   horizontalAlignment: Text.AlignHCenter
               }
               Labelcust1{
                   id:label8;labelWidth: 100;labelHeight:30;labeltext: "搜寻尖丝";labelSize: 16;
                   labelColor:searchcolor;touchenabled: false
               }
            }
            Row{
               anchors.top:parent.top;anchors.topMargin: 170
               width: parent.width;
               Rectangle {
                   id:space4
                   color:"transparent"
                   width: 100
                   height: parent.height
               }
               spacing: 150
               Labelcust1{
                   id:label9;labelWidth: 100;labelHeight:30;labeltext: "插芯入盒";labelSize: 16;
                   labelColor:inboxcolor;touchenabled: false
               }
               Labelcust1{
                   id:label10;labelWidth: 100;labelHeight:30;labeltext: "插芯磨削";labelSize: 16;
                   labelColor:cutcolor;touchenabled: false
               }
               Labelcust1{
                   id:label11;labelWidth: 100;labelHeight:30;labeltext: "挤磨削液";labelSize: 16;
                   labelColor:crmpcolor;touchenabled: false
               }
            }

            Row {
                anchors.top:parent.top;anchors.topMargin: 220
                 width: parent.width
                Rectangle {
                    id:space
                    color:"transparent"
                    width: 100
                    height: parent.height
                }
                spacing: 40
                Text{
                    id: text;width:50;height:20;text: qsTr("运行\n情况"); font.pointSize: 18
                    horizontalAlignment: Text.AlignHCenter
                }
                Labelcust1 {
                    id:runmsg;labelWidth: 500;labelHeight:  50;labeltext: msgtext;labelSize: 22;textColor:"red"
                    touchenabled: false;labelColor: "black"
                }
            }
              }
        Rectangle {
              id: buttonlList
              height: ctlmenu.height * 1/3
              width: ctlmenu.width
              color: "beige"
     //         anchors.bottom:parent.bottom;anchors.bottomMargin: 20
              gradient: Gradient {
                  GradientStop { position: 0.0; color: "#8C8F8C" }
                  GradientStop { position: 0.17; color: "#6A6D6A" }
                  GradientStop { position: 0.98;color: "#3F3F3F" }
                  GradientStop { position: 1.0; color: "#0e1B20" }
              }
          Buttoncust {
              id:autorun
              width: 120; height: 100
              anchors.top: parent.top
              anchors.topMargin: 50
              anchors.right: run_stop.left
              anchors.rightMargin: 100
              label: butrun ? "自动\n运行中":"自动\n启动"
              labelSize: 20
              radius: 5
              gradient: Gradient {
                  GradientStop { position: 0.0; color: "plum" }
                  GradientStop { position: 1.0; color: "#136F6F6F" }
              }
              onButtonClick: {
                  setupClick();
              }
          }
          Buttoncust {
              id:run_stop
              width: 120; height: 100
              anchors.top: parent.top
              anchors.topMargin: 50
              anchors.horizontalCenter: parent.horizontalCenter
              label: butstop ? "自动\n排出中":"自动\n停止"
              labelSize: 20
              radius: 5
              gradient: Gradient {
                  GradientStop { position: 0.0; color: "plum" }
                  GradientStop { position: 1.0; color: "#136F6F6F" }
              }
              onButtonClick: {
                  stopClick();
              }
          }
          Buttoncust {
              id:reset
              width: 120; height: 100
              anchors.top: parent.top
              anchors.topMargin: 50
              anchors.left: run_stop.right
              anchors.leftMargin: 100
              label: butreset ? "复位中":"状态\n复位"
              labelSize: 20
              radius: 5
              gradient: Gradient {
                  GradientStop { position: 0.0; color: "plum" }
                  GradientStop { position: 1.0; color: "#136F6F6F" }
              }
              touchenabled: resetenabled
              onButtonClick: {
                  resetClick();
              }
          }

        }
   }
}


