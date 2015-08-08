
import QtQuick 2.4
//import QtQml.Models 2.1
Rectangle {
    id: monitor_sys1
    width: 1024; height: 540
//    color: "transparent"
    color: "#6C646A"
     gradient: Gradient {
         GradientStop { position: 0.0; color: "#6C646A" }
         GradientStop { position: 1.0; color: Qt.darker("#6A6D6A") }
     }
     property alias time: timerText.text
     property alias sysState: stateText.text
     property alias sysOutput: outputText.text
     property alias mainShift: mainText.text
     property alias chuanSiWei: chuansiText.text
     property alias rightPosition: rightText.text
     property alias leftPosition: leftText.text
     property alias dt30046: unknowText.text
     property alias pullValue: pullText.text
     property alias pushValue: pushText.text
     property alias backSafeValue: backSafeText.text
     property alias siZuiValue: siZuiText.text
     property alias rightPosValue: yuandianText.text
     property alias leftPosValue: yuandianText1.text

     property int x0RValue: 0 //x0000寄存器的值
     property int x1RValue: 0 //x0001寄存器的值
     property int y1RValue: 0 //x0001寄存器的值
     property int y0RValue: 0 //x0000寄存器的值


     property bool mValue: false         //y0c
     property bool lockValue: false      //y11
     property bool hmValue: false        //y0d
     property bool mainStateValue: false //x04
     property bool roundValue: false     //x12
     property bool dingzhenValue: false  //y1A
     property bool chaxinSta1: false     //x0c
     property bool chaxinSta2: false     //x0d
     property bool chaxinSta3: false     //x0e
     property bool chaxinSta4: false     //x0f
     property bool t90Sta: false         //y1d
     property bool t180Sta: false        //y1c
     property bool suoHuiSta: false      //y1b
     property bool unknowSta1: false     //x1a
     property bool unknowSta2: false     //x1b
     property bool unknowSta3: false     //x09
     property bool chuansiSta: false     //x19
     property bool rightSta: false       //x05
     property bool lefttSta: false       //x06
     property bool pullSta1: false       //x0b
     property bool pullSta2: false       //x17
     property bool pushSta: false        //x18
     property bool reloadValue: false

     signal reload(bool bValue);

     onX0RValueChanged: {
         mainStateValue = (x0RValue & 1<<4);
         rightSta = (x0RValue & 1<<5);
         leftSta = (x0RValue & 1<<6);
         unknowSta3 = (x0RValue & 1<<9);
         pullSta1 = (x0RValue & 1<<11);
         chaxinSta1 = (x0RValue & 1<<12);
         chaxinSta2 = (x0RValue & 1<<13);
         chaxinSta3 = (x0RValue & 1<<14);
         chaxinSta4 = (x0RValue & 1<<15);
     }
     onX1RValueChanged: {
         roundValue = (x1RValue & 1<<2);
         unknowSta1 = (x1RValue & 1<<10);
         unknowSta2 = (x1RValue & 1<<11);
         chuansiSta = (x1RValue & 1<<9);
         pullSta2 = (x1RValue & 1<<7);
         pushSta = (x1RValue & 1<<8);
     }
     onY0RValueChanged: {
         mValue = (y0RValue & 1<<12);
         hmValue = (y0RValue & 1<<13);
     }
     onY1RValueChanged: {
         lockValue = (y1RValue & 1<<1);
         dingzhenValue = (y1RValue & 1<<10);
         suoHuiSta = (y1RValue & 1<<11);
         t180Sta = (y1RValue & 1<<12);
         t90Sta = (y1RValue & 1<<13);
     }

     Rectangle{
         width:700
         height:450
         anchors.centerIn: parent
         color: "#6C646A"
          gradient: Gradient {
              GradientStop { position: 0.0; color: "#6C646A" }
              GradientStop { position: 1.0; color: Qt.darker("#6A6D6A") }
          }
         border.color: "black"
         border.width: 2
         radius: 5
         Text {
             id: timer
             anchors{
                 top:parent.top;topMargin: 20
                 left:parent.left;leftMargin: 50
             }
             text: "计时："
             color:"blue"
             font.pointSize: 20
         }
         Rectangle{
             id:timerRect
             anchors{
                 verticalCenter: timer.verticalCenter
            //     horizontalCenter: timer.horizontalCenter
                 left:timer.right;leftMargin: 1
             }
             color:"black"
             width:80;height:30
             Text {
                 id:timerText
                 anchors.centerIn: parent
                 text: "000.0"
                 color: "yellow"
                 font.pointSize: 20
             }
         }
         Text {
             id:second
             anchors{
                 bottom:timerRect.bottom
                 left:timerRect.right;leftMargin: 1
             }
             text: "S"
             color:"blue"
             font.pointSize: 20
         }
         Text {
             id: state
             anchors{
                 top:parent.top;topMargin: 20
                 left:second.right;leftMargin: 20
             }
             text: "状态："
             color:"blue"
             font.pointSize: 20
         }
         Rectangle{
             id:stateRect
             anchors{
                 verticalCenter: state.verticalCenter
                 left:state.right;leftMargin:1
             }
             width:120;height:30;color:"white"
             border.color: "black";
             border.width: 1
             Text {
                 id:stateText
                 anchors.centerIn: parent
                 text: "磨削OK"
                 font.pointSize: 18
             }
         }
         Text {
             id: output //产量
             anchors{
                 top:parent.top;topMargin: 20
                 left:stateRect.right;leftMargin: 20
             }
             text: "产量："
             color:"blue"
             font.pointSize: 20
         }
         Rectangle{
             id:outputRect
             anchors{
                 verticalCenter: output.verticalCenter
                 left:output.right;//leftMargin: 5
             }
             width:80;height:30;color:"black"
             border.color: "blue";
             border.width: 1
             Text {
                 id:outputText
                 anchors.centerIn: parent
                 text: "00000"
                 color:"red"
                 font.pointSize: 20
             }
         }
         Rectangle{
             id:mRect
             width:40;height:40;radius: width/2;
             color: mValue ? "lightgreen":"gray";
             anchors{
                 top:timer.bottom;topMargin: 30
                 left:timer.left;leftMargin: 20
             }
             Text {
                 id: mText
                 anchors.centerIn: parent
                 text: "M"
                 font.pointSize: 18
             }
         }
         Rectangle{
             id:lockRect
             width:40;height:40;radius: width/2;
             anchors{
                 top:mRect.top;
                 left:mRect.right;leftMargin: 30
             }
             color:lockValue ? "gray":"lightgreen";
             Text {
                 id: lockText
                 anchors.centerIn: parent
                 text: lockValue ? "张开":"锁紧";
                 font.pointSize: 15
             }
             state:"open"
         //    z:5
             states:[
                State {
                     name:"open"
                     PropertyChanges {
                         target: lockRect
                         opacity:1
                     }
                 },
                 State {
                      name:"close"
                      PropertyChanges {
                          target: lockRect
                          opacity:0.1
                      }
                  }
             ]
             Timer{
                 id:statechange
                 interval: 500
                 running:!lockValue
                 triggeredOnStart: true;
                 repeat:true
                 onTriggered:{
                     if(lockRect.state==="open"){
                         lockRect.state="close";
                       //  console.log("colse");
                     }
                     else{
                         lockRect.state="open";
                      //   console.log("open");
                     }
                 }
            }

         }
         Rectangle{
             id:hmRect
             width:40;height:40;radius: width/2;
             anchors{
                 top:lockRect.top;
                 left:lockRect.right;leftMargin: 5
             }
             color:hmValue ? "lightgreen":"gray";
             Text {
                 id: hmText
                 anchors.centerIn: parent
                 text: "HM"
                 font.pointSize: 18
             }
         }
         Rectangle{
             id:unknowRect
             width:100;height:30;
             anchors{
                 top:hmRect.top;topMargin: 5
                 left:hmRect.right;leftMargin: 5
             }
             color:"lightgreen";
             Text {
                 id: unknowText
                 anchors.centerIn: parent
                 text: "00000"
                 font.pointSize: 18
             }
         }
         Rectangle{
             id:mainState
             width: 15;height:15
             anchors{
                 top:outputRect.bottom;topMargin: 20
                 right:outputRect.right
             }
             color:mainStateValue ? "red":"gray";
         }

         Text{
             id:main
             text:"主轴横移"
             font.pointSize: 18
             color:"blue"
             anchors{
                 top:outputRect.bottom;topMargin: 15
                 right:mainState.left;rightMargin: 10
             }
         }
         Text{
             id:mm
             text:"mm"
             font.pointSize: 18
             anchors{
                 top:mainState.bottom;topMargin: 16
                 right:mainState.right;
             }
         }
         Rectangle{
             id:mainTextRect
             width:100;height:30;
             anchors{
                 top:main.bottom;topMargin: 10
                 right:mm.left;rightMargin: 5
             }
             color:"lightgreen"
             Text{
                 id:mainText
                 anchors.centerIn: parent
                 text:"00000"
                 font.pointSize: 20;
             }
         }
         Rectangle{
             id:backSafeRect
             width:120;height:30;
             anchors{
                 top:mainTextRect.bottom;topMargin: 10;
                 right:mainTextRect.right;
             }
             color:"gray"
             Text{
                 id:backSafeText
                 anchors.centerIn: parent
                 text:"后安全位"
                 font.pointSize: 18
             }
         }
         Rectangle{
             id:rect1
            width:350;height:10
            anchors{
                top:lockRect.bottom;topMargin: 5
                left:lockRect.left;
            }
            color:"transparent"
            border.color: "black";
            border.width: 1
         }
         Rectangle{
             id:rect2
            width:10;height:170
            anchors{
                top:mRect.bottom;topMargin: 5
                horizontalCenter: mRect.horizontalCenter
            }
            color:"transparent"
            border.color: "black";
            border.width: 1
         }
         Rectangle{
             id:round
             width:30;height:30;radius: width/2;
             anchors{
                 top:rect2.bottom;topMargin: 5
                 horizontalCenter: mRect.horizontalCenter
             }
             border.color:"lightgreen";
             border.width: 5
             color:roundValue ? "red":"gray";
         }
         Rectangle{
             id:dingzhenState
             width:100;height:30;
             anchors{
                 verticalCenter: round.verticalCenter
                 left:leftRect.left;
             }
             color:dingzhenValue ? "lightgreen":"cyan"
             Text{
                 id:dingzhenText
                 anchors.centerIn: parent
                 text:dingzhenValue ? "顶针出":"";
                 font.pointSize: 18
             }
         }
         Text{
             id:chaxinText
             text:"插芯顶针"
             color:"blue"
             font.pointSize: 18
             anchors{
                 top: round.bottom;topMargin: 10
                 left:leftRect.left;
             }
         }
         Rectangle{
             id:chaxinState1
             width: 15;height:15
             anchors{
                 top:chaxinText.bottom;topMargin: 5
                 left:chaxinText.left
             }
             color:chaxinSta1 ? "red":"gray"
         }
         Rectangle{
             id:chaxinState2
             width: 15;height:15
             anchors{
                 top:chaxinText.bottom;topMargin: 5
                 left:chaxinState1.right;leftMargin: 10
             }
             color:chaxinSta2 ? "red":"gray"
         }
         Rectangle{
             id:chaxinState3
             width: 15;height:15
             anchors{
                 top:chaxinText.bottom;topMargin: 5
                 left:chaxinState2.right;leftMargin: 10
             }
             color:chaxinSta3 ? "red":"gray"
         }
         Rectangle{
             id:chaxinState4
             width: 15;height:15
             anchors{
                 top:chaxinText.bottom;topMargin: 5
                 left:chaxinState3.right;leftMargin: 10
             }
             color:chaxinSta4 ? "red":"gray"
         }

         Rectangle{
             id:t90State
             width:40;height:40;radius: width/2
             anchors{
                 verticalCenter: chaxinText.verticalCenter

                 left:chaxinText.right;leftMargin: 10
             }
             color:t90Sta ? "lightgreen":"gray"
             Text{
                 id:t90Text
                 anchors.horizontalCenter: parent.horizontalCenter
                 anchors.horizontalCenterOffset:10
                 anchors.verticalCenter: parent.verticalCenter
                 anchors.verticalCenterOffset: 5
                 text:t90Sta ? "90°":"";
                 font.pointSize: 14
             }
         }
         Rectangle{
             id:t180State
             width:40;height:40;radius: width/2
             anchors{
                 verticalCenter: chaxinText.verticalCenter
                 verticalCenterOffset: -t180State.width/2
                 right:upRect.right
             }
             color:t180Sta ? "lightgreen":"gray";
             Text{
                 id:t180Text
                 anchors.horizontalCenter: parent.horizontalCenter
                 anchors.horizontalCenterOffset:10
                 anchors.verticalCenter: parent.verticalCenter
                 anchors.verticalCenterOffset: 5
                 text:t180Sta ? "180°":"";
                 font.pointSize: 14
             }
         }
         Rectangle{
             id:suohuiState
             width:40;height:40;radius: width/2
             anchors{
                 verticalCenter: chaxinText.verticalCenter
                 verticalCenterOffset: suohuiState.width/2
                 right:upRect.right
             }
             color:suoHuiSta ? "lightgreen":"gray";
             Text{
                 id:suohuiText
                 anchors.centerIn: parent
                 text:suoHuiSta ? "缩回":"伸出";
                 font.pointSize: 14
             }
         }
         Rectangle{
             id:unknowState1
             width: 15;height:15
             anchors{
                 top:rect1.bottom;topMargin: 5
                 left:lockRect.left
             }
             color:unknowSta1 ? "red":"gray"
         }
         Rectangle{
             id:unknowState2
             width: 15;height:15
             anchors{
                 top:unknowState1.top;
                 left:unknowState1.right;leftMargin: 100
             }
             color:unknowSta2 ? "red":"gray"
         }
         Rectangle{
             id:unknowState3
             width: 15;height:15
             anchors{
                 top:unknowState2.top;
                 left:unknowState2.right;leftMargin: 100
             }
             color:unknowSta2 ? "red":"gray"
         }
         Rectangle{
             id:chuansiState
             width: 15;height:15
             anchors{
                 top:backSafeRect.bottom;topMargin: 20
                 right:outputRect.right
             }
             color:chuansiSta ? "red":"gray"
         }

         Text{
             id:chuansi
             text:"穿丝位"
             font.pointSize: 18
             color:"blue"
             anchors{
                 top:backSafeRect.bottom;topMargin: 16
                 right:chuansiState.left;rightMargin: 30
             }
         }
         Text{
             id:mm1
             text:"mm"
             font.pointSize: 18
             anchors{
                 top:chuansiState.bottom;topMargin: 15
                 right:chuansiState.right;
             }
         }
         Rectangle{
             id:chuansiTextRect
             width:100;height:30;
             anchors{
                 top:chuansi.bottom;topMargin: 10
                 right:mm1.left;rightMargin: 5
             }
             color:"lightgreen"
             Text{
                 id:chuansiText
                 anchors.centerIn: parent
                 text:"00000"
                 font.pointSize: 20;
             }
         }
         Rectangle{
             id:siZuiRect
             width:100;height:30;
             anchors{
                 top:chuansiTextRect.bottom;topMargin: 10;
                 right:chuansiTextRect.right;
             }
             color:"gray"
             Text{
                 id:siZuiText
                 anchors.centerIn: parent
                 text:"丝嘴位置"
                 font.pointSize: 18
             }
         }

         Rectangle{
             id:rightState
             width: 15;height:15
             anchors{
                 top:backSafeRect.bottom;topMargin: 20
                 right:chuansiTextRect.left;rightMargin: 20
             }
             color:rightSta ? "lightgreen":"gray"
         }

         Text{
             id:right
             text:"右旋位"
             font.pointSize: 18
             color:"blue"
             anchors{
                 top:backSafeRect.bottom;topMargin: 16
                 right:rightState.left;rightMargin: 30
             }
         }
         Text{
             id:du
             text:"度"
             font.pointSize: 18
             anchors{
                 top:rightState.bottom;topMargin: 15
                 right:rightState.right;
             }
         }
         Rectangle{
             id:rightTextRect
             width:100;height:30;
             anchors{
                 top:right.bottom;topMargin: 10
                 right:du.left;rightMargin: 5
             }
             color:"lightgreen"
             Text{
                 id:rightText
                 anchors.centerIn: parent
                 text:"00000"
                 font.pointSize: 20;
             }
         }
         Rectangle{
             id:rightRect
             width:100;height:30;
             anchors{
                 top:rightTextRect.bottom;topMargin: 10;
                 right:rightTextRect.right;
             }
             color:"gray"
             Text{
                 id:yuandianText
                 anchors.centerIn: parent
                 text:"原点位"
                 font.pointSize: 18
             }
         }
         Rectangle{
             id:upRect
             width:40;height:40;radius: width/2;
             anchors{
                 verticalCenter: rightTextRect.verticalCenter
                 right:rightTextRect.left;rightMargin: 20
             }
             color:"lightgreen";
             Text {
                 id: upText
                 anchors.centerIn: parent
                 text: "上料"
                 font.pointSize: 15
             }
             state:"open"
         //    z:5
             states:[
                State {
                     name:"open"
                     PropertyChanges {
                         target: upRect
                         opacity:1
                     }
                 },
                 State {
                      name:"close"
                      PropertyChanges {
                          target: upRect
                          opacity:0.1
                      }
                  }
             ]
             Timer{
                 id:upstatechange
                 interval: 500
                 running:true
                 triggeredOnStart: true;
                 repeat:true
                 onTriggered:{
                     if(upRect.state==="open"){
                         upRect.state="close";
                       //  console.log("colse");
                     }
                     else{
                         upRect.state="open";
                      //   console.log("open");
                     }
                 }
            }

         }
         Rectangle{
             id:downRect
             width:40;height:40;radius: width/2;
             anchors{
                 verticalCenter: rightRect.verticalCenter
                 right:rightRect.left;rightMargin: 20
             }
             color:"lightgreen";
             Text {
                 id: downText
                 anchors.centerIn: parent
                 text: "下料"
                 font.pointSize: 15
             }
             state:"open"
         //    z:5
             states:[
                State {
                     name:"open"
                     PropertyChanges {
                         target: downRect
                         opacity:1
                     }
                 },
                 State {
                      name:"close"
                      PropertyChanges {
                          target: downRect
                          opacity:0.1
                      }
                  }
             ]
             Timer{
                 id:downstatechange
                 interval: 500
                 running:true
                 triggeredOnStart: true;
                 repeat:true
                 onTriggered:{
                     if(downRect.state==="open"){
                         downRect.state="close";
                       //  console.log("colse");
                     }
                     else{
                         downRect.state="open";
                      //   console.log("open");
                     }
                 }
            }

         }

         Rectangle{
             id:leftState
             width: 15;height:15
             anchors{
                 top:backSafeRect.bottom;topMargin: 20
                 right:upRect.left;rightMargin: 20
             }
             color:lefttSta ? "red":"gray"
         }
         Text{
             id:left
             text:"左旋位"
             font.pointSize: 18
             color:"blue"
             anchors{
                 top:backSafeRect.bottom;topMargin: 16
                 right:leftState.left;rightMargin: 30
             }
         }
         Text{
             id:du1
             text:"度"
             font.pointSize: 18
             anchors{
                 top:leftState.bottom;topMargin: 15
                 right:leftState.right;
             }
         }
         Rectangle{
             id:leftTextRect
             width:100;height:30;
             anchors{
                 top:left.bottom;topMargin: 10
                 right:du1.left;rightMargin: 5
             }
             color:"lightgreen"
             Text{
                 id:leftText
                 anchors.centerIn: parent
                 text:"00000"
                 font.pointSize: 20;
             }
         }
         Rectangle{
             id:leftRect
             width:100;height:30;
             anchors{
                 top:leftTextRect.bottom;topMargin: 10;
                 right:leftTextRect.right;
             }
             color:"gray"
             Text{
                 id:yuandianText1
                 anchors.centerIn: parent
                 text:"原点位"
                 font.pointSize: 18
             }
         }
         Text{
             id:push
             text:"推力值"
             font.pointSize: 18
             color:"blue"
             anchors{
                 verticalCenter: round.verticalCenter
                 left:right.left;
             }
         }
         Rectangle{
             id:pushTextRect
             width:100;height:30;
             anchors{
                 top:push.bottom;topMargin: 10
                 left:rightTextRect.left;
             }
             color:"lightgreen"
             Text{
                 id:pushText
                 anchors.centerIn: parent
                 text:"0000"
                 font.pointSize: 20;
             }
         }
         Rectangle{
             id:pushState
             width: 15;height:15
             anchors{
                 top:push.top
                 left:rightState.left;
             }
             color:pushSta ? "red":"gray"
         }
         Text{
             id:pull
             text:"推力值"
             font.pointSize: 18
             color:"blue"
             anchors{
                 verticalCenter: round.verticalCenter
                 left:chuansi.left;
             }
         }
         Rectangle{
             id:pullTextRect
             width:100;height:30;
             anchors{
                 top:pull.bottom;topMargin: 10
                 left:chuansiTextRect.left;
             }
             color:"lightgreen"
             Text{
                 id:pullText
                 anchors.centerIn: parent
                 text:"0000"
                 font.pointSize: 20;
             }
         }
         Rectangle{
             id:pullState1
             width: 15;height:15
             anchors{
                 top:pull.top
                 left:chuansiState.left;
             }
             color:pullSta1 ? "red":"gray"
         }
         Rectangle{
             id:pullState2
             width: 15;height:15
             anchors{
                 top:pullTextRect.top
                 left:pullState1.left;
             }
             color:pullSta2 ? "red":"gray"
         }
         Buttoncust{
             id:reloadBt
             width: 200; height: 60
             anchors.bottom: parent.bottom
             anchors.bottomMargin: 10
             anchors.right: parent.right
             anchors.rightMargin: 80
             label: reloadValue ? "重新下落插芯":"手动确认无错\n重新下落插芯"
             labelSize: 18
             radius: 5
//             gradient: Gradient {
//                 GradientStop { position: 0.0; color: "plum" }
//                 GradientStop { position: 1.0; color: "#136F6F6F" }
//             }
             color:reloadValue ? "lightgreen":"gray";
             onButtonClick: {
                 reload(reloadValue);
             }
         }
    }
}
