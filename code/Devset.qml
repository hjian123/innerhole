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
//import"warncheck"
Rectangle {
    id: devset
    width: 1024; height: 600
    color: "beige"
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#8C8F8C" }
        GradientStop { position: 0.17; color: "#6A6D6A" }
        GradientStop { position: 0.98;color: "#3F3F3F" }
        GradientStop { position: 1.0; color: "#0e1B20" }
    }
//   property color fileColor: "plum"
//    property color editColor: "powderblue"
    property bool debug_release: true
    property int tmp

    property var devsetpageindex: 0

    property real partition: 1 / 10
    property real buttonwidth: 200
    property real buttonheight: 80
  //  property alias devsetmenu:devmenu

    property Item devset_1: devset1
    property Item devset_2: devset2
    property Item devset_3: devset3
    property Item devset_4: devset4
    property Item devset_5: devset5
    property Item devset_6: devset6
    property Item devset_7: devset7

    property alias devmenuy: devmenu.y
    signal backClick()
    signal gotosemiauto()
//    signal nextClick()
    signal devSetButPressed(string btcode,real bottomy)

    function setcmd(index){
         switch(devsetpageindex){
           case 0:  datprocess.devsetroot_pollcmd(index);break;
           case 1:  datprocess.devset1_pollcmd(index);break;
           case 2:  datprocess.leftmotor_pollcmd(index);break;
           case 3:  datprocess.devset2_pollcmd(index);break;
           case 4:  datprocess.mainshift_pollcmd(index);break;
           case 5:  datprocess.devset3_pollcmd(index);break;
           case 6:  datprocess.rightmotor_pollcmd(index);break;
           case 7:  datprocess.devset4_pollcmd(index);break;
           case 8:  datprocess.wire_pollcmd(index);break;
           case 9:  datprocess.devset5_pollcmd(index);break;
           case 10:  datprocess.devset6_pollcmd(index);break;
           case 11:  datprocess.devset7_pollcmd(index);break;
           default: break;
         }
       //  //console.log("devmenu.y:",devmenu.y);
    }
    function packprocess(index){
        if(screen.revready == true){
               switch (devsetpageindex){
                  case 0:devsetroot.packprocess(index);break;
                  case 1:devset1.packprocess(index);break;
                  case 2:leftmotor.packprocess(index);break;
                  case 3:devset2.packprocess(index);break;
                  case 4:mainshift.packprocess(index);break;
                  case 5:devset3.packprocess(index);break;
                  case 6:rightmotor.packprocess(index);break;
                  case 7:devset4.packprocess(index);break;
                  case 8:wire.packprocess(index);break;
                  case 9:devset5.packprocess(index);break;
                  case 10:devset6.packprocess(index);break;
                  case 11:devset7.packprocess(index);break;
                  default: break;
                  }
               screen.revready = false;
            }
      }
    function strgpackprocess(){
         switch(devsetpageindex){
         case 0:devsetroot.strgpackprocess();break;
         case 1:devset1.strgpackprocess();break;
         case 2:leftmotor.strgpackprocess();break;
         case 3:devset2.strgpackprocess();break;
         case 4:mainshift.strgpackprocess();break;
         case 5:devset3.strgpackprocess();break;
         case 6:rightmotor.strgpackprocess();break;
         case 7:devset4.strgpackprocess();break;
         case 8:wire.strgpackprocess();break;
         case 9:devset5.strgpackprocess();break;
         case 10:devset6.strgpackprocess();break;
         case 11:devset7.strgpackprocess();break;
              default: break;
         }
    }
    Rectangle {
        id: labelList
        height: devset.height * partition
        width: devset.width
        color: "beige"
       // z:3
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
               onButtonClick: {
                    if(devsetroot.visible==true) {
                        backClick();
                    //    //console.log("backtoctl");
                    }
                    else if(devset1.visible==true||devset2.visible==true ||devset3.visible==true
                            ||devset4.visible==true||devset6.visible==true||devset7.visible==true){
                        devset1.visible=false;devset2.visible=false;devset3.visible=false;
                        devset4.visible=false;devset6.visible=false;devset7.visible=false;
                        devsetroot.visible=true;devsetpageindex=0;screen.cmdnum=0;
                     //   //console.log("backtodevsetroot");
                    }
                    else if(leftmotor.visible==true){leftmotor.visible=false;devset1.visible=true;
                             nextbutton.visible=false;}
                    else if(mainshift.visible==true){mainshift.visible=false;devset2.visible=true;
                             nextbutton.visible=false;
                     //   //console.log("backtodevset2");
                    }
                    else if(rightmotor.visible==true){rightmotor.visible=false;devset3.visible=true;
                             nextbutton.visible=false;}
                    else if(wire.visible==true){wire.visible=false;devset4.visible=true;
                             nextbutton.visible=false;}
                    if(devset5.visible==true){
                        if(countsetlistview.currentIndex==0){
                            devset5.visible=false;devsetroot.visible=true;nextbutton.visible=false;
                        }
                        else {countsetlistview.currentIndex--;}
                    }

               }
    }
        Buttoncust{
            id: nextbutton
            height:50; width: 50
            visible: false
            anchors.right: parent.right;anchors.rightMargin: 50
            anchors.verticalCenter: parent.verticalCenter
            buttonColor:"transparent"
            Image {
                id: nextIcon
                width:sourceSize.width;height: sourceSize.width
                source: "ptsrc/arrow.png"
                fillMode: Image.Pad
                anchors.centerIn: parent
                rotation:270
                Behavior { NumberAnimation { property: "rotation"; easing.type: Easing.OutExpo } }
            }
            onButtonClick: {
                   if(devset5.visible==true){
                       if(countsetlistview.currentIndex==2){
                           countsetlistview.currentIndex=0;
                       }
                       else {countsetlistview.currentIndex++;}
                   }
                   if(leftmotor.visible==true){
                       leftmotor.visible=false;mainshift.visible=true;
                     //  //console.log("leftmotor--->mainshift");
                   }
                   else if(mainshift.visible==true){
                       mainshift.visible=false;rightmotor.visible=true;
                     //  //console.log("mainshift--->rightmotor");
                   }
                   else if(rightmotor.visible==true){
                       rightmotor.visible=false;wire.visible=true;
                     //  //console.log("rightmotor--->wire");
                   }
                   else if(wire.visible==true){
                       wire.visible=false;leftmotor.visible=true;
                     //  //console.log("wire--->leftmotor");
                   }
            }
         }
      }
    Rectangle {
            id: devmenu
            height: devset.height * (1-partition)
            width: devset.width
            y:60
        // color: "transparent"
        //    color: "#6C646A"
                color: "beige"
            gradient: Gradient {
            GradientStop { position: 0.0; color: "#8C8F8C" }
            GradientStop { position: 0.17; color: "#6A6D6A" }
            GradientStop { position: 0.98;color: "#3F3F3F" }
            GradientStop { position: 1.0; color: "#0e1B20" }
            }
         //   y:virtualboard.visible ? 60:(60-100)

            Item {
                    id: devsetroot
                    property int strgcmdindex: 0
                    visible: true
                    anchors.fill: parent

                    Grid {
                        rows: 4;  columns: 2;  rowSpacing: 30;  columnSpacing: 100
                        anchors.centerIn: parent
                        Buttoncust {
                            id:button1
                            buttonWidth:buttonwidth; buttonHeight:buttonheight
                            label: "左旋转马达"
                            labelSize: 20
                            radius: 2
                            gradient: Gradient {
                                GradientStop { position: 0.0; color: "plum" }
                                GradientStop { position: 1.0; color: "#136F6F6F" }
                            }
                            onButtonClick: {
                                devset1.visible=true;
                                devsetroot.visible=false;
                            }
                        }
                        Buttoncust {
                            id:button2
                            buttonWidth:buttonwidth; buttonHeight:buttonheight
                            label: "计数设定"
                            labelSize: 20
                            radius: 2
                            gradient: Gradient {
                                GradientStop { position: 0.0; color: "plum" }
                                GradientStop { position: 1.0; color: "#136F6F6F" }
                            }
                            onButtonClick: {
                                devset5.visible=true;
                                devsetroot.visible=false;
                                nextbutton.visible=true;
                            }
                        }
                        Buttoncust {
                            id:button3
                             buttonWidth:buttonwidth; buttonHeight:buttonheight
                            label: "主轴横移马达"
                            labelSize: 20
                            radius: 2
                            gradient: Gradient {
                                GradientStop { position: 0.0; color: "plum" }
                                GradientStop { position: 1.0; color: "#136F6F6F" }
                            }
                            onButtonClick: {
                                devset2.visible=true;
                                devsetroot.visible=false;
                            }
                        }
                        Buttoncust {
                            id:button4
                             buttonWidth:buttonwidth; buttonHeight:buttonheight
                            label: "模拟量设定"
                            labelSize: 20
                            radius: 2
                            gradient: Gradient {
                                GradientStop { position: 0.0; color: "plum" }
                                GradientStop { position: 1.0; color: "#136F6F6F" }
                            }
                            onButtonClick: {
                                devset6.visible=true;
                                devsetroot.visible=false;
                            }
                        }
                        Buttoncust {
                            id:button5
                             buttonWidth:buttonwidth; buttonHeight:buttonheight
                            label: "右旋转马达"
                            labelSize: 20
                            radius: 2
                            gradient: Gradient {
                                GradientStop { position: 0.0; color: "plum" }
                                GradientStop { position: 1.0; color: "#136F6F6F" }
                            }
                            onButtonClick: {
                                devset3.visible=true;
                                devsetroot.visible=false;
                                //screen.cmdnumtmp=screen.cmdnum;
                            }
                        }
                        Buttoncust {
                            id:button6
                             buttonWidth:buttonwidth; buttonHeight:buttonheight
                            label: "高级参数"
                            labelSize: 20
                            radius: 2
                            gradient: Gradient {
                                GradientStop { position: 0.0; color: "plum" }
                                GradientStop { position: 1.0; color: "#136F6F6F" }
                            }
                            onButtonClick: {
                                devset7.visible=true;
                                devsetroot.visible=false;
                                label1.labeltext="高级参数";
                            }
                        }
                        Buttoncust {
                            id:button7
                            buttonWidth:buttonwidth; buttonHeight:buttonheight
                            label: "磨削丝进给"
                            labelSize: 20
                            radius: 2
                            gradient: Gradient {
                                GradientStop { position: 0.0; color: "plum" }
                                GradientStop { position: 1.0; color: "#136F6F6F" }
                            }
                            onButtonClick: {
                                devset4.visible=true;
                                devsetroot.visible=false;
                            }
                        }
                        Buttoncust {
                            id:button8
                             buttonWidth:buttonwidth; buttonHeight:buttonheight
                            label: "马达参数设定"
                            labelSize: 20
                            radius: 2
                            gradient: Gradient {
                                GradientStop { position: 0.0; color: "plum" }
                                GradientStop { position: 1.0; color: "#136F6F6F" }
                            }
                            onButtonClick: {
                                leftmotor.visible=true;
                                devsetroot.visible=false;
                                nextbutton.visible=true;
                            }
                        }
                    }
                    Text {
                            id: text1;width:300;height:20;text: qsTr("手动模式下允许修改参数"); font.pointSize: 18;color:"red"
                            horizontalAlignment: Text.AlignHCenter;
                            anchors.bottom: devsetroot.bottom;anchors.bottomMargin: 20
                            anchors.left: devsetroot.left;anchors.leftMargin: 50
                        }
//                    function setcmd(index){
//                         switch(index){

//                           default: break;
//                         }
//                    }
                    onVisibleChanged: {
                        if(visible==true){
                            label1.labeltext="项目设定";
                            devsetpageindex=0;
                            screen.cmdnum=0;
                        }
                    }
                    function packprocess(index){
                        if(screen.revready == true){
                               switch (index){
                                  default: break;
                                  }
                               screen.revready = false;
                            }
                      }
                    function strgpackprocess(){
                         switch(strgcmdindex){
                              case 0: break;
                              case 1: break;
                              case 2: break;
                              case 3: break;
                              case 4: break;
                              case 5: break;
                              default: break;
                         }
                    }
            }
            Item {
                id: devset1
                visible: false
                anchors.fill: parent
                property int strgcmdindex: 0
                Devsetlearn {
                    id:learn1
                    anchors.fill: parent
                    onDatasetClick: {
                        devset1.visible=false;leftmotor.visible=true;
                    }
                    onDatacfmClick: {
                        if(learn1.datacofirm==true) datprocess.SendBuf="WCCL007000700000";
                        else datprocess.SendBuf="WCCL007000700100";
                        screen.state="STRGPACK_PROCESSING";
                        devset1.strgcmdindex=0;
                    }
                  onComboxindexChanged: {
                        var str1="WDD0101001010";
                        var str2=datprocess.cov0x2strings(learn1.comboxindex);
                        ////console.log(str1+str2);
                        datprocess.SendBuf=str1+str2;
                        screen.state="STRGPACK_PROCESSING";
                        devset1.strgcmdindex=1;
                    }
                    onBkorgClick: {
                        if(learn1.bkorg==true) datprocess.SendBuf="WCCL007400740000";
                        else datprocess.SendBuf="WCCL007400740100";
                        screen.state="STRGPACK_PROCESSING";
                        devset1.strgcmdindex=2;
                    }
                    onTargetpstClick: {
                        if(learn1.targetpst==true) datprocess.SendBuf="WCCL007300730000";
                        else datprocess.SendBuf="WCCL007300730100";
                        screen.state="STRGPACK_PROCESSING";
                        devset1.strgcmdindex=3;
                    }
                    onAddClick: {
                        if(learn1.add==true) datprocess.SendBuf="WCCL007100710000";
                        else datprocess.SendBuf="WCCL007100710100";
                        screen.state="STRGPACK_PROCESSING";
                        devset1.strgcmdindex=4;
                    }
                    onMinusClick: {
                        if(learn1.minus==true) datprocess.SendBuf="WCCL007200720000";
                        else datprocess.SendBuf="WCCL007200720100";
                        screen.state="STRGPACK_PROCESSING";
                        devset1.strgcmdindex=5;
                    }
                }
                onVisibleChanged: {
                    if(visible==true){
                        label1.labeltext="学习画面/左旋电机";
                        devsetpageindex=1;
                        screen.cmdnum=8;
                    }
                }

                function packprocess(index){
                    if(screen.revready == true){
                           switch (index){
                              case 0:
                                  if(datprocess.selectnchar(0,1)=="1") learn1.datacofen=true;
                                  else learn1.datacofen=false;
                                  break;
                              case 1:
                                  if(datprocess.selectnchar(0,1)=="1") learn1.adjen=true;
                                  else learn1.adjen=false;
                                  break;
                              case 2:
                                 if(1==datprocess.covstring20x(datprocess.selectnchar(0,4))){
                                     learn1.datacofirm=true;
                                 }
                                 else learn1.datacofirm=false;
                                 if(1==datprocess.covstring20x(datprocess.selectnchar(4,4))){
                                     learn1.add=true;
                                 }
                                 else learn1.add=false;
                                 if(1==datprocess.covstring20x(datprocess.selectnchar(8,4))){
                                     learn1.minus=true;
                                 }
                                 else learn1.minus=false;
                                  break;
                              case 3:
                                  if(1==datprocess.covstring20x(datprocess.selectnchar(0,4))){
                                      learn1.targetpst=true;
                                  }
                                  else learn1.targetpst=false;
                                  break;
                              case 4:
                                  if(1==datprocess.covstring20x(datprocess.selectnchar(0,4))){
                                      learn1.bkorg=true;
                                  }
                                  else learn1.bkorg=false;
                                  break;
                              case 5:
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(4,4))<<16;
                                  learn1.curvalue = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                                  learn1.presetvalue = (tmp/100).toFixed(2);
                                  break;
                              case 6:
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(4,4))<<16;
                                  learn1.curvalue = (tmp/100).toFixed(2);
                                  break;
                              case 7:
                                  learn1.comboxindex=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                  screen.cmdnum--;
                                  //screen.cmdnumtmp=screen.cmdnum;
                                  break;
                              default: break;
                              }
                           screen.revready = false;
                        }
                  }
                function strgpackprocess(){
                     switch(strgcmdindex){
                          case 0: break;
                          case 1: break;
                          case 2: break;
                          case 3: break;
                          case 4: break;
                          case 5: break;
                          default: break;
                     }
                }
            }
            Item {
                id: leftmotor
                visible: false
                anchors.fill: parent
                anchors.centerIn: parent
                property int strgcmdindex: 0
                Rectangle {
                    id: leftmotorrect
                    anchors.fill: parent
                    color: "#6C646A"
                    signal datacfmClick();
                    signal datasetClick();

                    gradient: Gradient {
                         GradientStop { position: 0.0; color: "#6C646A" }
                         GradientStop { position: 1.0; color: Qt.darker("#6A6D6A") }
                     }
                    Column{
                       anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 20
                    Rectangle{
                        id:space4
                        width: parent.width;height: 20
                        color: "transparent"
                    }
                    Row {
                        spacing: 100
                        width:parent.width
                        Rectangle{
                            id:space5
                            width: 40;height: 20
                            color: "transparent"
                        }
                        Text {
                                id: leftmotorpst
                                text: "左旋轮位置"
                                color: "black"
                                font.pointSize: 20
                            //    horizontalAlignment: Text.AlignHCenter
                            }
                        Text {
                                id: leftmotorv
                                text: "左旋轮速度"
                                color: "black"
                                font.pointSize: 20
                             //   horizontalAlignment: Text.AlignHCenter
                            }
                        }
                    Grid {
                    //   anchors.horizontalCenter: parent.horizontalCenter

                       rows: 4;  columns: 5;  rowSpacing: 20;  columnSpacing: 20
                       Labelcust{
                           id:labelcust1;btcode:"L1"
                           Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:labelcust4;labeltext1:"  OK位";
                           btcode:"L4";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:labelcust7;labeltext1:"  等待位";
                           btcode:"L7";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Rectangle{
                           id:space1
                           width: 40;height:20
                           color: "transparent"
                       }
                       Labelcust{
                           id:labelcust10;labeltext1:"   手动";labeltext2:"r/m";
                           btcode:"L10";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:labelcust2;labeltext1:"确认圆锥";
                           btcode:"L2";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:labelcust5;labeltext1:"没有接触";
                           btcode:"L5";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:labelcust8;labeltext1:"主轴出插芯";
                           btcode:"L8";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Rectangle{
                           id:space2
                           width: 40;height: 20
                           color: "transparent"
                       }
                       Labelcust{
                           id:labelcust11;labeltext1:"自动";labeltext2:"r/m";
                           btcode:"L11";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:labelcust3;labeltext1:"供给插芯";
                           btcode:"L3";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:labelcust6;labeltext1:"没有通过";
                           btcode:"L6";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:labelcust9;labeltext1:"主轴入插芯";
                           btcode:"L9";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Rectangle{
                           id:space3
                           width: 40;height: 20
                           color: "transparent"
                       }
                       Labelcust{
                           id:labelcust12;labeltext1:"  回原点";labeltext2:"r/m";
                           btcode:"L12";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Buttoncust {
                           id:leftadj
                           buttonWidth:150; buttonHeight:80
                           label: "左旋调整"
                           labelSize: 30
                           radius: 2
                           gradient: Gradient {
                               GradientStop { position: 0.0; color: "plum" }
                               GradientStop { position: 1.0; color: "#136F6F6F" }
                           }
                           onButtonClick: {
                               leftmotor.visible=false;devset1.visible=true;
                               nextbutton.visible=false;
                           }
                       }
                    }
                }
                }
                onVisibleChanged: {
                    if(visible==true){
                        label1.labeltext="左旋电机设置";
                        devsetpageindex=2;
                        screen.cmdnum=4;
                    }
                }
                function packprocess(index){
               //     console.log("!!!!!!left");
                    if(screen.revready == true){
                           switch (index){
                              case 0:
                                  if(!debug_release){
                                    if(datprocess.selectnchar(0,1)=="1") {
                                        labelcust1.touchable=true;}
                                    else {labelcust1.touchable=false;}
                                  }
                                  break;
                              case 1:
                                  if(!debug_release){
                                      if(datprocess.selectnchar(0,1)=="1") {
                                          labelcust2.touchable=true;
                                          labelcust3.touchable=true;
                                          labelcust4.touchable=true;
                                          labelcust5.touchable=true;
                                          labelcust6.touchable=true;
                                          labelcust7.touchable=true;
                                          labelcust8.touchable=true;
                                          labelcust9.touchable=true;
                                          labelcust10.touchable=true;
                                          labelcust11.touchable=true;
                                          labelcust12.touchable=true;
                                      }
                                      else {
                                          labelcust2.touchable=false;
                                          labelcust3.touchable=false;
                                          labelcust4.touchable=false;
                                          labelcust5.touchable=false;
                                          labelcust6.touchable=false;
                                          labelcust7.touchable=false;
                                          labelcust8.touchable=false;
                                          labelcust9.touchable=false;
                                          labelcust10.touchable=false;
                                          labelcust11.touchable=false;
                                          labelcust12.touchable=false;
                                       }
                                  }
                                  break;
                              case 2:
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(4,4))<<16;
                                  labelcust1.labeltext3 = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(12,4))<<16;
                                  labelcust2.labeltext3 = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(16,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(20,4))<<16;
                                  //console.log("!!!!!!",tmp);
                                  labelcust3.labeltext3 = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(24,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(28,4))<<16;
                                  labelcust4.labeltext3 = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(32,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(36,4))<<16;
                                  labelcust5.labeltext3 = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(40,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(44,4))<<16;
                                  labelcust6.labeltext3 = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(48,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(52,4))<<16;
                                  labelcust7.labeltext3 = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(56,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(60,4))<<16;
                                  labelcust8.labeltext3 = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(64,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(68,4))<<16;
                                  labelcust9.labeltext3 = (tmp/100).toFixed(2);
                                  break;
                              case 3:
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                  labelcust10.labeltext3 = tmp;
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(4,4));
                                  labelcust11.labeltext3 = tmp;
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                                  labelcust12.labeltext3 = tmp;
                                  break;
                              default: break;
                              }
                           screen.revready = false;
                        }
                  }
                function strgpackprocess(){
                     switch(strgcmdindex){
                          case 0: break;
                          case 1: break;
                          case 2: break;
                          case 3: break;
                          case 4: break;
                          case 5: break;
                          default: break;
                     }
                }
            }
            Item {
                id: devset2
                visible: false
                anchors.fill: parent
                property int strgcmdindex: 0
                Devsetlearn {
                    id:learn2
                    anchors.fill: parent
                    onDatasetClick: {
                        devset2.visible=false;mainshift.visible=true;
                    }
                    onDatacfmClick: {
                        if(learn2.datacofirm==true) datprocess.SendBuf="WCCL008000800000";
                        else datprocess.SendBuf="WCCL008000800100";
                        screen.state="STRGPACK_PROCESSING";
                        devset2.strgcmdindex=0;
                    }
                    onComboxindexChanged: {
                        var str1="WDD0102001020";
                        var str2=datprocess.cov0x2strings(learn2.comboxindex);
                        ////console.log(str1+str2);
                        datprocess.SendBuf=str1+str2;
                        screen.state="STRGPACK_PROCESSING";
                        devset2.strgcmdindex=1;
                    }
                    onBkorgClick: {
                        if(learn2.bkorg==true) datprocess.SendBuf="WCCL008400840000";
                        else datprocess.SendBuf="WCCL008400840100";
                        screen.state="STRGPACK_PROCESSING";
                        devset2.strgcmdindex=2;
                    }
                    onTargetpstClick: {
                        if(learn2.targetpst==true) datprocess.SendBuf="WCCL008300830000";
                        else datprocess.SendBuf="WCCL007300730100";
                        screen.state="STRGPACK_PROCESSING";
                        devset2.strgcmdindex=3;
                    }
                    onAddClick: {
                        if(learn2.add==true) datprocess.SendBuf="WCCL008100810000";
                        else datprocess.SendBuf="WCCL007100710100";
                        screen.state="STRGPACK_PROCESSING";
                        devset2.strgcmdindex=4;
                    }
                    onMinusClick: {
                        if(learn2.minus==true) datprocess.SendBuf="WCCL008200820000";
                        else datprocess.SendBuf="WCCL008200820100";
                        screen.state="STRGPACK_PROCESSING";
                        devset2.strgcmdindex=5;
                    }
               }
                onVisibleChanged: {
                    if(visible==true){
                        label1.labeltext="学习画面/主轴横移";
                        devsetpageindex=3;
                        screen.cmdnum=8;
                    }
                }
                function packprocess(index){
                    if(screen.revready == true){
                           switch (index){
                              case 0:
                                  if(datprocess.selectnchar(0,1)=="1") learn2.datacofen=true;
                                  else learn2.datacofen=false;
                                  break;
                              case 1:
                                  if(datprocess.selectnchar(0,1)=="1") learn2.adjen=true;
                                  else learn2.adjen=false;
                                  break;
                              case 2:
                                 if(1==datprocess.covstring20x(datprocess.selectnchar(0,4))){
                                     learn2.datacofirm=true;
                                 }
                                 else learn2.datacofirm=false;
                                 if(1==datprocess.covstring20x(datprocess.selectnchar(4,4))){
                                     learn2.add=true;
                                 }
                                 else learn2.add=false;
                                 if(1==datprocess.covstring20x(datprocess.selectnchar(8,4))){
                                     learn2.minus=true;
                                 }
                                 else learn2.minus=false;
                                  break;
                              case 3:
                                  if(1==datprocess.covstring20x(datprocess.selectnchar(0,4))){
                                      learn2.targetpst=true;
                                  }
                                  else learn2.targetpst=false;
                                  break;
                              case 4:
                                  if(1==datprocess.covstring20x(datprocess.selectnchar(0,4))){
                                      learn2.bkorg=true;
                                  }
                                  else learn2.bkorg=false;
                                  break;
                              case 5:
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(4,4))<<16;
                                  learn2.curvalue = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                                  learn2.presetvalue = (tmp/100).toFixed(2);
                                  break;
                              case 6:
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(4,4))<<16;
                                  learn2.curvalue = (tmp/100).toFixed(2);
                                  break;
                              case 7:
                                  learn2.comboxindex=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                  screen.cmdnum--;
                                  //screen.cmdnumtmp=screen.cmdnum;
                                  break;
                              default: break;
                              }
                           screen.revready = false;
                        }
                  }
                function strgpackprocess(){
                     switch(strgcmdindex){
                          case 0: break;
                          case 1: break;
                          case 2: break;
                          case 3: break;
                          case 4: break;
                          case 5: break;
                          default: break;
                     }
                }
                }
            Item {
                id: mainshift
                visible: false
                anchors.fill: parent
                anchors.centerIn: parent
                property int strgcmdindex: 0
                Rectangle {
                    id: mainshiftrect
                    anchors.fill: parent
                    color: "#6C646A"
                    signal datacfmClick();
                    signal datasetClick();
                     gradient: Gradient {
                         GradientStop { position: 0.0; color: "#6C646A" }
                         GradientStop { position: 1.0; color: Qt.darker("#6A6D6A") }
                     }
                    Column{
                       anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 20
                    Rectangle{
                        id:space6
                        width: parent.width;height: 20
                        color: "transparent"
                    }
                    Row {
//                        anchors.left: parent.left;anchors.leftMargin: 200
//                        anchors.top: parent.top;anchors.topMargin: 20
                        spacing: 100
                        width:parent.width
                        Rectangle{
                            id:space7
                            width: 40;height: 20
                            color: "transparent"
                        }
                        Text {
                                id: mainshiftpst
                                text: "主轴横移位置"
                                color: "black"
                                font.pointSize: 20
                            //    horizontalAlignment: Text.AlignHCenter
                            }
                        Text {
                                id: mainshiftv
                                text: "横移速度"
                                color: "black"
                                font.pointSize: 20
                             //   horizontalAlignment: Text.AlignHCenter
                            }
                        }
                    Grid {
                    //   anchors.horizontalCenter: parent.horizontalCenter

                       rows: 4;  columns: 4;  rowSpacing: 30;  columnSpacing: 20
                       Labelcust{
                           id:mainlabelcust1;labeltext1:"  安全位";labeltext2:"mm";
                            btcode:"M1";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:mainlabelcust4;labeltext1:"  等待位";labeltext2:"mm";
                           btcode:"M4";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Rectangle{
                           id:space8
                           width: 40;height:20
                           color: "transparent"
                       }
                       Labelcust{
                           id:mainlabelcust8;labeltext1:"  手动";labeltext2:"r/m";
                           btcode:"M8";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:mainlabelcust2;labeltext1:"加载插芯";labeltext2:"mm";
                           btcode:"M2";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:mainlabelcust5;labeltext1:" 工作位";labeltext2:"mm";
                           btcode:"M5";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Rectangle{
                           id:space9
                           width: 40;height: 20
                           color: "transparent"
                       }
                       Labelcust{
                           id:mainlabelcust9;labeltext1:" 自动";labeltext2:"r/m";
                           btcode:"M9";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:mainlabelcust3;labeltext1:"原点位置";labeltext2:"mm";
                           btcode:"M3";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:mainlabelcust6;labeltext1:"钻石液位";labeltext2:"mm";
                           btcode:"M6";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Rectangle{
                           id:space10
                           width: 40;height: 20
                           color: "transparent"
                       }
                       Labelcust{
                           id:mainlabelcust10;labeltext1:"回原点";labeltext2:"r/m";
                           btcode:"M10";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Buttoncust {
                           id:shiftadj
                           buttonWidth:150; buttonHeight:80
                           label: "横移调整"
                           labelSize: 30
                           radius: 2
                           gradient: Gradient {
                               GradientStop { position: 0.0; color: "plum" }
                               GradientStop { position: 1.0; color: "#136F6F6F" }
                           }
                           onButtonClick: {
                               mainshift.visible=false;devset2.visible=true;
                               nextbutton.visible=false;
                               //console.log("devset2see");
                           }
                       }
                       Labelcust{
                           id:mainlabelcust7;labeltext1:"振荡幅度";labeltext2:"mm";
                           btcode:"M7";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Rectangle{
                           id:space11
                           width: 40;height: 20
                           color: "transparent"
                       }
                       Labelcust{
                           id:mainlabelcust11;labeltext1:"振荡速度";labeltext2:"r/m";
                           btcode:"M11";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                    }
                }
                }

                onVisibleChanged: {
                    if(visible==true){
                        if(visible==true){
                            label1.labeltext="主轴横移设置";
                            devsetpageindex=4;
                            screen.cmdnum=4;
                        }

                    }
                }
                function packprocess(index){
                    if(screen.revready == true){
                        //console.log("!!!!!!main");
                           switch (index){   
                              case 0:
                                  if(!debug_release){
                                      if(datprocess.selectnchar(0,1)=="1") {
                                          mainlabelcust2.touchable=true;
                                          mainlabelcust3.touchable=true;
                                          mainlabelcust4.touchable=true;
                                          mainlabelcust5.touchable=true;
                                          mainlabelcust6.touchable=true;
                                          mainlabelcust7.touchable=true;
                                          mainlabelcust8.touchable=true;
                                          mainlabelcust9.touchable=true;
                                          mainlabelcust10.touchable=true;
                                          mainlabelcust11.touchable=true;
                                          mainlabelcust1.touchable=true;
                                      }
                                      else {
                                          mainlabelcust2.touchable=false;
                                          mainlabelcust3.touchable=false;
                                          mainlabelcust4.touchable=false;
                                          mainlabelcust5.touchable=false;
                                          mainlabelcust6.touchable=false;
                                          mainlabelcust7.touchable=false;
                                          mainlabelcust8.touchable=false;
                                          mainlabelcust9.touchable=false;
                                          mainlabelcust10.touchable=false;
                                          mainlabelcust11.touchable=false;
                                          mainlabelcust1.touchable=false;
                                       }
                                 }
                                  break;
                              case 1:
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(4,4))<<16;
                                  mainlabelcust1.labeltext3 = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(12,4))<<16;
                                  mainlabelcust2.labeltext3 = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(16,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(20,4))<<16;
                                  mainlabelcust3.labeltext3 = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(24,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(28,4))<<16;
                                  mainlabelcust4.labeltext3 = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(32,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(36,4))<<16;
                                  mainlabelcust5.labeltext3 = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(40,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(44,4))<<16;
                                  mainlabelcust6.labeltext3 = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(48,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(52,4))<<16;
                                  mainlabelcust7.labeltext3 = (tmp/100).toFixed(2);
                                  break;
                              case 2:
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                  mainlabelcust8.labeltext3 = tmp;
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(4,4));
                                  mainlabelcust9.labeltext3 = tmp;
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                                  mainlabelcust10.labeltext3 = tmp;
                                  break;
                              case 3:
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                  mainlabelcust11.labeltext3 = tmp;
                                  break;
                              default: break;
                              }
                           screen.revready = false;
                        }
                  }
                function strgpackprocess(){
                     switch(strgcmdindex){
                          case 0: break;
                          case 1: break;
                          case 2: break;
                          case 3: break;
                          case 4: break;
                          case 5: break;
                          default: break;
                     }
                }
            }
            Item {
                id: devset3
                visible: false
                anchors.fill: parent
                property int strgcmdindex: 0
                Devsetlearn {
                    id:learn3
                    anchors.fill: parent
                    onDatasetClick: {
                        rightmotor.visible=true;devset3.visible=false;
                    }
                    onDatacfmClick: {
                        if(learn3.datacofirm==true) datprocess.SendBuf="WCCL0060006000000000";
                        else datprocess.SendBuf="WCCL0060006001000000";
                        screen.state="STRGPACK_PROCESSING";
                        devset3.strgcmdindex=0;
                    }
                    onComboxindexChanged: {
                        var str1="WDD0100001000";
                        var str2=datprocess.cov0x2strings(learn3.comboxindex);
                        ////console.log(str1+str2);
                        datprocess.SendBuf=str1+str2;
                        screen.state="STRGPACK_PROCESSING";
                        devset3.strgcmdindex=1;
                    }
                    onBkorgClick: {
                        if(learn3.bkorg==true) datprocess.SendBuf="WCCL0064006400000000";
                        else datprocess.SendBuf="WCCL0064006401000000";
                        screen.state="STRGPACK_PROCESSING";
                        devset3.strgcmdindex=2;
                    }
                    onTargetpstClick: {
                        if(learn3.targetpst==true) datprocess.SendBuf="WCCL0063006300000000";
                        else datprocess.SendBuf="WCCL0063006301000000";
                        screen.state="STRGPACK_PROCESSING";
                        devset3.strgcmdindex=3;
                    }
                    onAddClick: {
                        if(learn3.add==true) datprocess.SendBuf="WCCL0061006100000000";
                        else datprocess.SendBuf="WCCL0061006101000000";
                        screen.state="STRGPACK_PROCESSING";
                        devset3.strgcmdindex=4;
                    }
                    onMinusClick: {
                        if(learn3.minus==true) datprocess.SendBuf="WCCL0062006200000000";
                        else datprocess.SendBuf="WCCL0062006201000000";
                        screen.state="STRGPACK_PROCESSING";
                        devset3.strgcmdindex=5;
                    }

                }

                onVisibleChanged: {
                    if(visible==true){
                        label1.labeltext="学习画面/右旋转马达";
                        devsetpageindex=5;
                        screen.cmdnum=8;
                    }

                }
                function packprocess(index){
                    if(screen.revready == true){
                           switch (index){
                              case 0:
                                  if(datprocess.selectnchar(0,1)=="1") learn3.datacofen=true;
                                  else learn3.datacofen=false;
                                  break;
                              case 1:
                                  if(datprocess.selectnchar(0,1)=="1") learn3.adjen=true;
                                  else learn3.adjen=false;
                                  break;
                              case 2:
                                 if(1==datprocess.covstring20x(datprocess.selectnchar(0,4))){
                                     learn3.datacofirm=true;
                                 }
                                 else learn3.datacofirm=false;
                                 if(1==datprocess.covstring20x(datprocess.selectnchar(4,4))){
                                     learn3.add=true;
                                 }
                                 else learn3.add=false;
                                 if(1==datprocess.covstring20x(datprocess.selectnchar(8,4))){
                                     learn3.minus=true;
                                 }
                                 else learn3.minus=false;
                                  break;
                              case 3:
                                  if(1==datprocess.covstring20x(datprocess.selectnchar(0,4))){
                                      learn3.targetpst=true;
                                  }
                                  else learn3.targetpst=false;
                                  break;
                              case 4:
                                  if(1==datprocess.covstring20x(datprocess.selectnchar(0,4))){
                                      learn3.bkorg=true;
                                  }
                                  else learn3.bkorg=false;
                                  break;
                              case 5:
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(4,4))<<16;
                                  learn3.curvalue = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                                  learn3.presetvalue = (tmp/100).toFixed(2);
                                  break;
                              case 6:
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(4,4))<<16;
                                  learn3.curvalue = (tmp/100).toFixed(2);
                                  break;
                              case 7:
                                  learn3.comboxindex=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                  screen.cmdnum--;
                                  //screen.cmdnumtmp=screen.cmdnum;
                                  break;
                              default: break;
                              }
                           screen.revready = false;
                        }
                  }
                function strgpackprocess(){
                     switch(strgcmdindex){
                          case 0: break;
                          case 1: break;
                          case 2: break;
                          case 3: break;
                          case 4: break;
                          case 5: break;
                          default: break;
                     }
                }
            }
            Item {
                id: rightmotor
                visible: false
                anchors.fill: parent
                anchors.centerIn: parent
                property int strgcmdindex: 0
                Rectangle {
                    id: rightmotortrect
                    anchors.fill: parent
                    color: "#6C646A"
                    signal datacfmClick();
                    signal datasetClick();
                     gradient: Gradient {
                         GradientStop { position: 0.0; color: "#6C646A" }
                         GradientStop { position: 1.0; color: Qt.darker("#6A6D6A") }
                     }
                    Column{
                       anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 20
                    Rectangle{
                        id:space12
                        width: parent.width;height: 20
                        color: "transparent"
                    }
                    Row {
//                        anchors.left: parent.left;anchors.leftMargin: 200
//                        anchors.top: parent.top;anchors.topMargin: 20
                        spacing: 100
                        width:parent.width
                        Rectangle{
                            id:space13
                            width: 40;height: 20
                            color: "transparent"
                        }
                        Text {
                                id: rightmotorpst
                                text: "右旋轮位置"
                                color: "black"
                                font.pointSize: 20
                            }
                        Text {
                                id: rightmotorv
                                text: "右旋轮速度"
                                color: "black"
                                font.pointSize: 20
                            }
                        }
                    Grid {
                    //   anchors.horizontalCenter: parent.horizontalCenter

                       rows: 4;  columns: 4;  rowSpacing: 30;  columnSpacing: 20
                       Labelcust{
                           id:rightlabelcust1;labeltext1:"  原点";
                           btcode:"R1";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:rightlabelcust4;labeltext1:"  断丝位";
                           btcode:"R4";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Rectangle{
                           id:space14
                           width: 40;height:20
                           color: "transparent"
                       }
                       Labelcust{
                           id:rightlabelcust8;labeltext1:"  手动";labeltext2:"r/m";
                           btcode:"R8";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:rightlabelcust2;labeltext1:"  激光位";
                           btcode:"R2";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:rightlabelcust5;labeltext1:"  修磨位";
                           btcode:"R5";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Rectangle{
                           id:space15
                           width: 40;height: 20
                           color: "transparent"
                       }
                       Labelcust{
                           id:rightlabelcust9;labeltext1:" 自动";labeltext2:"r/m";
                           btcode:"R9";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:rightlabelcust3;labeltext1:"磨削加工位";
                           btcode:"R3";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:rightlabelcust6;labeltext1:"摆动幅度";
                           btcode:"R6";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Rectangle{
                           id:space16
                           width: 40;height: 20
                           color: "transparent"
                       }
                       Labelcust{
                           id:rightlabelcust10;labeltext1:"回原点";labeltext2:"r/m";
                           btcode:"R10";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Buttoncust {
                           id:rightadj
                           buttonWidth:150; buttonHeight:80
                           label: "右旋调整"
                           labelSize: 30
                           radius: 2
                           gradient: Gradient {
                               GradientStop { position: 0.0; color: "plum" }
                               GradientStop { position: 1.0; color: "#136F6F6F" }
                           }
                           onButtonClick: {
                               rightmotor.visible=false;devset3.visible=true;
                               nextbutton.visible=false;
                           }
                       }
                       Labelcust{
                           id:rightlabelcust7;labeltext1:"搅拌次数";labeltext2:"次";
                           btcode:"R7";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Rectangle{
                           id:space17
                           width: 40;height: 20
                           color: "transparent"
                       }
                       Labelcust{
                           id:rightlabelcust11;labeltext1:"扫描次数";labeltext2:"次";
                           btcode:"R11";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                    }
                    }
                    Text {
                        id:righttext1
                        width:50;height:20
                        text: "0"
                        color: "white"
                        font.pointSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        anchors.left:parent.left
                        anchors.leftMargin: 800
                        anchors.top:parent.top
                        anchors.topMargin: 400
                    }
                    Text {
                        id:righttext2
                        width:50;height:20
                        text: "0"
                        color: "white"
                        font.pointSize: 16
                        horizontalAlignment: Text.AlignHCenter
                        anchors.left:righttext1.right
                        anchors.leftMargin: 50
                        anchors.top:righttext1.top

                    }
                }
                onVisibleChanged: {

                    if(visible==true){
                        label1.labeltext="右旋轮设置";
                        devsetpageindex=6;
                        screen.cmdnum=8;
                    }
                }
                function packprocess(index){
                    //console.log("!!!!!!right");
                    if(screen.revready == true){
                           switch (index){
                              case 0:
                                  if(!debug_release){
                                      if(datprocess.selectnchar(0,1)=="1")rightlabelcust1.touchable=true;
                                      else rightlabelcust1.touchable=false;
                                  }
                                  break;
                              case 1:
                                  if(!debug_release){
                                      if(datprocess.selectnchar(0,1)=="1") {
                                          rightlabelcust2.touchable=true;
                                          rightlabelcust3.touchable=true;
                                          rightlabelcust4.touchable=true;
                                          rightlabelcust5.touchable=true;
                                          rightlabelcust6.touchable=true;
                                          rightlabelcust7.touchable=true;
                                          rightlabelcust8.touchable=true;
                                          rightlabelcust9.touchable=true;
                                          rightlabelcust10.touchable=true;
                                          rightlabelcust11.touchable=true;

                                      }
                                      else {
                                          rightlabelcust2.touchable=false;
                                          rightlabelcust3.touchable=false;
                                          rightlabelcust4.touchable=false;
                                          rightlabelcust5.touchable=false;
                                          rightlabelcust6.touchable=false;
                                          rightlabelcust7.touchable=false;
                                          rightlabelcust8.touchable=false;
                                          rightlabelcust9.touchable=false;
                                          rightlabelcust10.touchable=false;
                                          rightlabelcust11.touchable=false;
                                       }
                                  }
                                  break;
                              case 2:
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(4,4))<<16;
                                  rightlabelcust1.labeltext3 = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(12,4))<<16;
                                  rightlabelcust2.labeltext3 = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(16,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(20,4))<<16;
                                  rightlabelcust3.labeltext3 = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(24,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(28,4))<<16;
                                  rightlabelcust4.labeltext3 = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(32,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(36,4))<<16;
                                  rightlabelcust5.labeltext3 = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(40,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(44,4))<<16;
                                  rightlabelcust6.labeltext3 = (tmp/100).toFixed(2);
                                  break;
                              case 3:
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                  rightlabelcust8.labeltext3 = tmp;
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(4,4));
                                  rightlabelcust9.labeltext3 = tmp;
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                                  //console.log(tmp);
                                  rightlabelcust10.labeltext3 = tmp;
                                  break;
                              case 4:
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                  rightlabelcust11.labeltext3 = tmp;
                                  break;
                              case 5:
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                  rightlabelcust7.labeltext3 = tmp;
                                  break;
                              case 6:
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                  righttext1.text = tmp;
                                  break;
                              case 7:
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                  righttext2.text = tmp;
                                  break;
                              default: break;
                              }
                           screen.revready = false;
                        }
                  }
                function strgpackprocess(){
                     switch(strgcmdindex){
                          case 0: break;
                          case 1: break;
                          case 2: break;
                          case 3: break;
                          case 4: break;
                          case 5: break;
                          default: break;
                     }
                }
            }
            Item {
                id: devset4
                visible: false
                anchors.fill: parent
                property int strgcmdindex: 0
                Devsetlearn {
                    id:learn4
                    anchors.fill: parent
                    onDatasetClick: {
                        wire.visible=true;devset4.visible=false;
                    }
                    onDatacfmClick: {
                        if(learn4.datacofirm==true) datprocess.SendBuf="WCCL009000900000";
                        else datprocess.SendBuf="WCCL009000900100";
                        screen.state="STRGPACK_PROCESSING";
                        devset4.strgcmdindex=0;
                    }
                    onComboxindexChanged: {
                        var str1="WDD0101001010";
                        var str2=datprocess.cov0x2strings(learn4.comboxindex);
                        ////console.log(str1+str2);
                        datprocess.SendBuf=str1+str2;
                        screen.state="STRGPACK_PROCESSING";
                        devset4.strgcmdindex=1;
                    }
                    onBkorgClick: {
                        if(learn4.bkorg==true) datprocess.SendBuf="WCCL009400940000";
                        else datprocess.SendBuf="WCCL009400940100";
                        screen.state="STRGPACK_PROCESSING";
                        devset4.strgcmdindex=2;
                    }
                    onTargetpstClick: {
                        if(learn4.targetpst==true) datprocess.SendBuf="WCCL009300930000";
                        else datprocess.SendBuf="WCCL009300930100";
                        screen.state="STRGPACK_PROCESSING";
                        devset4.strgcmdindex=3;
                    }
                    onAddClick: {
                        if(learn4.add==true) datprocess.SendBuf="WCCL009100910000";
                        else datprocess.SendBuf="WCCL009100910100";
                        screen.state="STRGPACK_PROCESSING";
                        devset4.strgcmdindex=4;
                    }
                    onMinusClick: {
                        if(learn4.minus==true) datprocess.SendBuf="WCCL009200920000";
                        else datprocess.SendBuf="WCCL009200920100";
                        screen.state="STRGPACK_PROCESSING";
                        devset4.strgcmdindex=5;
                    }
                }
                onVisibleChanged: {
                    if(visible==true){
                        label1.labeltext="学习画面/磨削丝进给";
                        devsetpageindex=7;
                        screen.cmdnum=8;
                    }

                    //screen.cmdnumtmp=screen.cmdnum;
                }
                function packprocess(index){
                    if(screen.revready == true){
                           switch (index){
                              case 0:
                                  if(datprocess.selectnchar(0,1)=="1") learn4.datacofen=true;
                                  else learn4.datacofen=false;
                                  break;
                              case 1:
                                  if(datprocess.selectnchar(0,1)=="1") learn4.adjen=true;
                                  else learn4.adjen=false;
                                  break;
                              case 2:
                                 if(1==datprocess.covstring20x(datprocess.selectnchar(0,4))){
                                     learn4.datacofirm=true;
                                 }
                                 else learn4.datacofirm=false;
                                 if(1==datprocess.covstring20x(datprocess.selectnchar(4,4))){
                                     learn4.add=true;
                                 }
                                 else learn4.add=false;
                                 if(1==datprocess.covstring20x(datprocess.selectnchar(8,4))){
                                     learn4.minus=true;
                                 }
                                 else learn4.minus=false;
                                  break;
                              case 3:
                                  if(1==datprocess.covstring20x(datprocess.selectnchar(0,4))){
                                      learn4.targetpst=true;
                                  }
                                  else learn4.targetpst=false;
                                  break;
                              case 4:
                                  if(1==datprocess.covstring20x(datprocess.selectnchar(0,4))){
                                      learn4.bkorg=true;
                                  }
                                  else learn4.bkorg=false;
                                  break;
                              case 5:
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(4,4))<<16;
                                  learn4.curvalue = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                                  learn4.presetvalue = (tmp/100).toFixed(2);
                                  break;
                              case 6:
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(4,4))<<16;
                                  learn4.curvalue = (tmp/100).toFixed(2);
                                  break;
                              case 7:
                                  learn4.comboxindex=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                  screen.cmdnum--;
                                  //screen.cmdnumtmp=screen.cmdnum;
                                  break;
                              default: break;
                              }
                           screen.revready = false;
                        }
                  }
                function strgpackprocess(){
                     switch(devset4.strgcmdindex){
                          case 0: break;
                          case 1: break;
                          case 2: break;
                          case 3: break;
                          case 4: break;
                          case 5: break;
                          default: break;
                     }
                }
            }
            Item {
                id: wire
                visible: false
                anchors.fill: parent
                anchors.centerIn: parent
                property int strgcmdindex: 0
                Rectangle {
                    id: wirerect
                    anchors.fill: parent
                    color: "#6C646A"
                    signal datacfmClick();
                    signal datasetClick();
                     gradient: Gradient {
                         GradientStop { position: 0.0; color: "#6C646A" }
                         GradientStop { position: 1.0; color: Qt.darker("#6A6D6A") }
                     }
                    Column{
                       anchors.horizontalCenter: parent.horizontalCenter
                       spacing: 20
                       Rectangle{
                            id:space18
                            width: parent.width;height: 20
                            color: "transparent"
                        }
                       Row {
//                        anchors.left: parent.left;anchors.leftMargin: 200
//                        anchors.top: parent.top;anchors.topMargin: 20
                        spacing: 100
                        width:parent.width
                        Rectangle{
                            id:space19
                            width: 40;height: 20
                            color: "transparent"
                        }
                        Text {
                                id: wirepst
                                text: "进丝位置"
                                color: "black"
                                font.pointSize: 20
                            //    horizontalAlignment: Text.AlignHCenter
                            }
                        Text {
                                id: wirev
                                text: "进丝速度"
                                color: "black"
                                font.pointSize: 20
                             //   horizontalAlignment: Text.AlignHCenter
                            }
                        }
                       Grid {
                           rows: 4;  columns: 5;  rowSpacing: 20;  columnSpacing: 20
                           Labelcust{
                               id:wirecust1;labeltext1:"丝嘴位置";labeltext2:"mm";
                               btcode:"W1";Component.onCompleted: clicked.connect(devSetButPressed);
                           }
                           Labelcust{
                               id:wirecust4;labeltext1:"插入位置";labeltext2:"r/m";
                               btcode:"W4";Component.onCompleted: clicked.connect(devSetButPressed);
                           }
                           Rectangle{
                               id:space20
                               width: 40;height:20
                               color: "transparent"
                           }
                           Labelcust{
                               id:wirecust8;labeltext1:"手动速度";labeltext2:"r/m";
                               btcode:"W8";Component.onCompleted: clicked.connect(devSetButPressed);
                           }
                           Labelcust{
                               id:wirecust12;labeltext1:"工作速度";labeltext2:"r/m";
                               btcode:"W12";Component.onCompleted: clicked.connect(devSetButPressed);
                           }
                           Labelcust{
                               id:wirecust2;labeltext1:"原点";labeltext2:"mm";
                               btcode:"W2";Component.onCompleted: clicked.connect(devSetButPressed);
                           }
                           Labelcust{
                              id:wirecust5;labeltext1:"磨削开始";labeltext2:"mm";
                              btcode:"W5";Component.onCompleted: clicked.connect(devSetButPressed);
                           }
                           Rectangle{
                               id:space21
                               width: 40;height: 20
                               color: "transparent"
                           }
                           Labelcust{
                               id:wirecust9;labeltext1:"位置速度";labeltext2:"r/m";
                               btcode:"W9";Component.onCompleted: clicked.connect(devSetButPressed);
                           }
                           Labelcust{
                               id:wirecust13;labeltext1:"后退速度";labeltext2:"r/m";
                               btcode:"W13";Component.onCompleted: clicked.connect(devSetButPressed);
                           }
                           Labelcust{
                               id:wirecust3;labeltext1:"磨削液位";labeltext2:"mm";
                               btcode:"W3";Component.onCompleted: clicked.connect(devSetButPressed);
                           }
                           Labelcust{
                               id:wirecust6;labeltext1:"磨削结束";labeltext2:"mm";
                               btcode:"W6";Component.onCompleted: clicked.connect(devSetButPressed);
                           }
                           Rectangle{
                               id:space22
                               width: 40;height: 20
                               color: "transparent"
                           }
                           Labelcust{
                               id:wirecust10;labeltext1:"原点速度";labeltext2:"r/m";
                               btcode:"W10";Component.onCompleted: clicked.connect(devSetButPressed);
                           }
                           Labelcust{
                               id:wirecust14;labeltext1:"磨尖速度";labeltext2:"r/m";
                               btcode:"W14";Component.onCompleted: clicked.connect(devSetButPressed);
                           }
                           Buttoncust {
                              id:wireadj
                              buttonWidth:150; buttonHeight:80
                              label: "进丝调整"
                              labelSize: 30
                              radius: 2
                              gradient: Gradient {
                                  GradientStop { position: 0.0; color: "plum" }
                                  GradientStop { position: 1.0; color: "#136F6F6F" }
                              }
                              onButtonClick: {
                                  wire.visible=false;devset4.visible=true;
                                  nextbutton.visible=false;
                              }
                        }
                           Labelcust{
                              id:wirecust7;labeltext1:"断丝位置";labeltext2:"mm";
                              btcode:"W7";Component.onCompleted: clicked.connect(devSetButPressed);
                           }
                           Rectangle{
                            id:space23
                            width: 40;height: 20
                            color: "transparent"
                           }
                           Labelcust{
                               id:wirecust11;labeltext1:"插入速度";labeltext2:"r/m";
                               btcode:"W11";Component.onCompleted: clicked.connect(devSetButPressed);
                           }
                           Labelcust{
                               id:wirecust15;labeltext1:"开始磨尖速度";labeltext2:"r/m";
                               btcode:"W15";Component.onCompleted: clicked.connect(devSetButPressed);
                           }
                     }
                   }
                }
                onVisibleChanged: {
                    if(visible==true){
                        label1.labeltext="磨削丝设置";
                        devsetpageindex=8;
                        screen.cmdnum=3;
                    }

                }
                function packprocess(index){
                    tmp=0;
                    if(screen.revready == true){
                        //console.log("!!!!!!wire");
                        switch (index){
                           case 0:
                               if(!debug_release){
                                   if(datprocess.selectnchar(0,1)=="1") {
                                       wirecust1.touchable=true;
                                       wirecust2.touchable=true;
                                       wirecust3.touchable=true;
                                       wirecust4.touchable=true;
                                       wirecust5.touchable=true;
                                       wirecust6.touchable=true;
                                       wirecust7.touchable=true;
                                       wirecust8.touchable=true;
                                       wirecust9.touchable=true;
                                       wirecust10.touchable=true;
                                       wirecust11.touchable=true;
                                       wirecust12.touchable=true;
                                       wirecust13.touchable=true;
                                       wirecust14.touchable=true;
                                       wirecust15.touchable=true;
                                   }
                                   else {
                                       wirecust1.touchable=false;
                                       wirecust2.touchable=false;
                                       wirecust3.touchable=false;
                                       wirecust4.touchable=false;
                                       wirecust5.touchable=false;
                                       wirecust6.touchable=false;
                                       wirecust7.touchable=false;
                                       wirecust8.touchable=false;
                                       wirecust9.touchable=false;
                                       wirecust10.touchable=false;
                                       wirecust11.touchable=false;
                                       wirecust12.touchable=false;
                                       wirecust13.touchable=false;
                                       wirecust14.touchable=false;
                                       wirecust15.touchable=false;
                                    }
                               }
                               break;
                           case 1:
                               tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                               tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(4,4))<<16;
                               wirecust1.labeltext3 = (tmp/100).toFixed(2);
                               tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                               tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(12,4))<<16;
                               wirecust2.labeltext3 = (tmp/100).toFixed(2);
                               tmp=datprocess.covstring20x(datprocess.selectnchar(16,4));
                               tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(20,4))<<16;
                               wirecust3.labeltext3 = (tmp/100).toFixed(2);
                               tmp=datprocess.covstring20x(datprocess.selectnchar(24,4));
                               tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(28,4))<<16;
                               wirecust4.labeltext3 = (tmp/100).toFixed(2);
                               tmp=datprocess.covstring20x(datprocess.selectnchar(32,4));
                               tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(36,4))<<16;
                               wirecust5.labeltext3 = (tmp/100).toFixed(2);
                               tmp=datprocess.covstring20x(datprocess.selectnchar(40,4));
                               tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(44,4))<<16;
                               wirecust6.labeltext3 = (tmp/100).toFixed(2);
                               tmp=datprocess.covstring20x(datprocess.selectnchar(48,4));
                               tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(52,4))<<16;
                               wirecust7.labeltext3 = (tmp/100).toFixed(2);
                               break;
                           case 2:
                               tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                               wirecust8.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(4,4));
                               wirecust9.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                               wirecust10.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(12,4));
                               wirecust11.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(16,4));
                               wirecust12.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(20,4));
                               wirecust13.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(24,4));
                               wirecust14.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(28,4));
                               wirecust15.labeltext3 = tmp;
                               break;
                           default: break;
                           }
                           screen.revready = false;
                        }
                  }
                function strgpackprocess(){
                     switch(strgcmdindex){
                          case 0: break;
                          case 1: break;
                          case 2: break;
                          case 3: break;
                          case 4: break;
                          case 5: break;
                          default: break;
                     }
                }
            }
            Item {
                id: devset5
                property bool settouchable: true
                visible: false
                anchors.fill: parent
                property int strgcmdindex: 0
                Rectangle {
                    id: devset5rect
                    anchors.fill: parent
                    color: "#6C646A"
                    signal datacfmClick();
                    signal datasetClick();
                    gradient: Gradient {
                         GradientStop { position: 0.0; color: "#6C646A" }
                         GradientStop { position: 1.0; color: Qt.darker("#6A6D6A") }
                     }
               ListView {
                  id: countsetlistview
                  width: devset5.width
                  height: devset5.height
                  model: countsetlistmodel
                  snapMode: ListView.SnapOneItem
                  orientation: ListView.Horizontal
                  boundsBehavior: Flickable.StopAtBounds
                  flickDeceleration: 5000
                  highlightFollowsCurrentItem: true
                  highlightMoveDuration: 240
                  highlightRangeMode: ListView.StrictlyEnforceRange
                }
               ObjectModel {
                id: countsetlistmodel
                Rectangle {
                    id: countset
                    width: countsetlistview.width
                    height: countsetlistview.height
                    color: "transparent"
                    Grid{
                       anchors.horizontalCenter: parent.horizontalCenter
                       rows: 4;  columns: 4;  rowSpacing: 30;  columnSpacing: 30
                       Labelcust{
                           id:countsetlabel1;labeltext1:"未通过判定";labeltext2:"次";
                           btcode:"C1";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:countsetlabel2;labeltext1:"最大未通过";labeltext2:"次";
                           btcode:"C2";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:countsetlabel3;labeltext1:"最大不接触";labeltext2:"个";
                           btcode:"C3";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:countsetlabel4;labeltext1:"最大受阻尝试";labeltext2:"个";
                           btcode:"C4";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:countsetlabel5;labeltext1:"未通过当前值";labeltext2:"次";
                           btcode:"C5";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:countsetlabel6;labeltext1:"未通过计数";labeltext2:"个";
                           btcode:"C6";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:countsetlabel7;labeltext1:"未接触计数";labeltext2:"个";
                           btcode:"C7";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:countsetlabel8;labeltext1:"受阻当前值";labeltext2:"个";
                           btcode:"C8";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:countsetlabel9;labeltext1:"圆锥判断限值";labeltext2:"次";
                           btcode:"C9";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:countsetlabel10;labeltext1:"修磨往复";labeltext2:"次";
                           btcode:"C10";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:countsetlabel11;labeltext1:"连续未通过";labeltext2:"个";
                           btcode:"C11";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:countsetlabel12;labeltext1:"低速受阻";labeltext2:"个";
                           touchable: devset5.settouchable;
                           btcode:"C12";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:countsetlabel13;labeltext1:"圆锥当前值";labeltext2:"次";
                           btcode:"C13";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:countsetlabel14;labeltext1:"修磨往复值";labeltext2:"次";
                           btcode:"C14";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:countsetlabel15;labeltext1:"连续切未过数";labeltext2:"次";
                           btcode:"C15";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                       Labelcust{
                           id:countsetlabel16;labeltext1:"热切时间";labeltext2:"MS";
                           btcode:"C16";Component.onCompleted: clicked.connect(devSetButPressed);
                       }
                    }
                }
                Rectangle {
                    id: compenvalue    //补偿值
                    width: countsetlistview.width
                    height: countsetlistview.height
                    color: "transparent"
                    Row{
                      spacing: 20
                      anchors.horizontalCenter: parent.horizontalCenter
                      Column{
                          spacing: 20
                         Text {
                             id: modeltext1
                             text: "(第一模式有效)"
                             color: "red"
                             font.pointSize: 18
                         }
                         Rectangle{
                             id:firstmode;color: "transparent"
                             border.color: "red";width: 300;height: 200;border.width: 2
                             Grid{
                                 anchors.fill:parent
                                 rows: 2;  columns: 2;  rowSpacing: 20;  columnSpacing: 20
                                 Labelcust{
                                     id:complabel1;labeltext1:"WM1长度";labeltext2:"mm";
                                     touchable: devset5.settouchable;
                                     btcode:"P1";Component.onCompleted: clicked.connect(devSetButPressed);
                                 }
                                 Labelcust{
                                     id:complabel2;labeltext1:" ";labeltext2:"r/m";
                                    touchable: devset5.settouchable;
                                     btcode:"P2";Component.onCompleted: clicked.connect(devSetButPressed);
                                 }
                                 Labelcust{
                                     id:complabel3;labeltext1:"WM1最后补偿";labeltext2:"mm";
                                     touchable: devset5.settouchable;
                                     btcode:"P3";Component.onCompleted: clicked.connect(devSetButPressed);
                                 }
                                 Labelcust{
                                     id:complabel4;labeltext1:" ";labeltext2:"r/m";
                                     touchable: devset5.settouchable;
                                     btcode:"P4";Component.onCompleted: clicked.connect(devSetButPressed);
                                 }
                             }
                         }
                         Grid{
                             rows: 2;  columns: 2;  rowSpacing: 20;  columnSpacing: 20
                             Labelcust{
                                 id:complabel5;labeltext1:"二次补偿";labeltext2:"mm";
                                 touchable: devset5.settouchable;
                                 btcode:"P5";Component.onCompleted: clicked.connect(devSetButPressed);
                             }
                             Labelcust{
                                 id:complabel6;labeltext1:" ";labeltext2:"r/m";
                                 touchable: devset5.settouchable;
                                 btcode:"P6";Component.onCompleted: clicked.connect(devSetButPressed);
                             }
                             Labelcust{
                                 id:complabel7;labeltext1:"遇阻后退长度";labeltext2:"mm";
                                 touchable: devset5.settouchable;
                                 btcode:"P7";Component.onCompleted: clicked.connect(devSetButPressed);
                             }
                             Labelcust{
                                 id:complabel8;labeltext1:" ";labeltext2:"r/m";
                                 touchable: devset5.settouchable;
                                 btcode:"P8";Component.onCompleted: clicked.connect(devSetButPressed);
                             }
                         }
                      }
                      Column{
                          spacing: 20
                         Text{
                              id: modeltext2
                              text: "(第二模式有效)"
                              color: "red"
                              font.pointSize: 18
                          }
                         Grid{
                          rows: 4;  columns: 2;  rowSpacing: 20;  columnSpacing: 20
                          Labelcust{
                              id:complabel9;labeltext1:"断丝后进丝长度";labeltext2:"mm";
                              touchable: devset5.settouchable;
                              btcode:"P9";Component.onCompleted: clicked.connect(devSetButPressed);
                          }
                          Labelcust{
                              id:complabel10;labeltext1:"WORK WM2";labeltext2:"mm";
                              touchable: devset5.settouchable;
                              btcode:"P10";Component.onCompleted: clicked.connect(devSetButPressed);
                          }
                          Labelcust{
                              id:complabel11;labeltext1:"进丝补偿值";labeltext2:"mm";
                              touchable: devset5.settouchable;
                              btcode:"P11";Component.onCompleted: clicked.connect(devSetButPressed);
                          }
                          Labelcust{
                              id:complabel12;labeltext1:"断丝递进补偿值";labeltext2:"mm";
                              touchable: devset5.settouchable;
                              btcode:"P12";Component.onCompleted: clicked.connect(devSetButPressed);
                          }
                          Labelcust{
                              id:complabel13;labeltext1:"搜寻圆锥长度";labeltext2:"mm";
                              touchable: devset5.settouchable;
                              btcode:"P13";Component.onCompleted: clicked.connect(devSetButPressed);
                          }
                          Labelcust{
                              id:complabel14;labeltext1:"断丝间隔设定";labeltext2:"次";
                              touchable: devset5.settouchable;
                              btcode:"P14";Component.onCompleted: clicked.connect(devSetButPressed);
                          }
                          Labelcust{
                              id:complabel15;labeltext1:"模式2速度";labeltext2:"r/m";
                              touchable: devset5.settouchable;
                              btcode:"P15";Component.onCompleted: clicked.connect(devSetButPressed);
                          }
                          Labelcust{
                              id:complabel16;labeltext1:"断丝间隔当前";labeltext2:"次";
                             touchable: devset5.settouchable;
                              btcode:"P16";Component.onCompleted: clicked.connect(devSetButPressed);
                          }
                      }
                      }
                   }
                }
                Rectangle {
                    id: timeset
                    width: countsetlistview.width
                    height: countsetlistview.height
                    color: "transparent"
                    Column{
                        spacing: 20
                        anchors.horizontalCenter: parent.horizontalCenter
                       Row{
                           spacing: 20
                           Text{
                               id: text3
                               text: "\n\n\n延时\n设定"
                               font.pointSize: 20
                           }
                           Grid{
                               rows: 2;  columns: 3;  rowSpacing: 20;  columnSpacing: 50
                               Labelcust{
                                   id:complabel17;labeltext1:"顶插芯延时";labeltext2:"MS";
                                   touchable: devset5.settouchable
                                   btcode:"TS1";Component.onCompleted: clicked.connect(devSetButPressed);
                               }
                               Labelcust{
                                   id:complabel18;labeltext1:"夹持时间";labeltext2:"MS";
                                   touchable: devset5.settouchable
                                   btcode:"TS2";Component.onCompleted: clicked.connect(devSetButPressed);
                               }
                               Labelcust{
                                   id:complabel19;labeltext1:"180°确认";labeltext2:"MS";
                                   touchable: devset5.settouchable
                                   btcode:"TS3";Component.onCompleted: clicked.connect(devSetButPressed);
                               }
                               Labelcust{
                                   id:complabel20;labeltext1:"磨削液加注";labeltext2:"MS";
                                   touchable: devset5.settouchable
                                   btcode:"TS4";Component.onCompleted: clicked.connect(devSetButPressed);
                               }
                               Labelcust{
                                   id:complabel21;labeltext1:"松开张力计时";labeltext2:"MS";
                                   touchable: devset5.settouchable
                                   btcode:"TS5";Component.onCompleted: clicked.connect(devSetButPressed);
                               }
                               Labelcust{
                                   id:complabel22;labeltext1:"高速主轴停止";labeltext2:"MS";
                                   touchable: devset5.settouchable
                                   btcode:"TS6";Component.onCompleted: clicked.connect(devSetButPressed);
                               }
                           }
                       }
                    Rectangle{
                        id:timeoutrect
                        color: "transparent"
                        width: 550;height:150
                        border.color: "red"
                        border.width: 2
                        Row{
                            spacing: 20
                            anchors.fill: parent
                            Text{
                                id: text4
                                text: "\n超时\n报警"
                                font.pointSize: 20
                            }
                            Labelcust{
                                id:complabel23;labeltext1:"\n单颗最大\n加工时限";labeltext2:"S";
                                btcode:"TS7";Component.onCompleted: clicked.connect(devSetButPressed);
                            }
                            Labelcust{
                                id:complabel24;labeltext1:"\n单颗最小\n最短时限";labeltext2:"S";
                                btcode:"TS8";Component.onCompleted: clicked.connect(devSetButPressed);
                            }
                            Labelcust{
                                id:complabel25;labeltext1:"\n单颗当前\n加工计时";labeltext2:"S";
                                btcode:"TS9";Component.onCompleted: clicked.connect(devSetButPressed);
                            }
                            Labelcust{
                                id:complabel26;labeltext1:"\n热刀断丝\n最大时间";labeltext2:"S";
                                btcode:"TS10";Component.onCompleted: clicked.connect(devSetButPressed);
                            }
                        }
                    }
               }
                }
                }
            }
                onVisibleChanged: {
                        if(visible==true){
                            label1.labeltext="计数设定";
                            devsetpageindex=9;
                            screen.cmdnum=10;
                            console.log("devsetpageindex=",devsetpageindex);
                        }
                    }
                function packprocess(index){
                    if(screen.revready == true){
                           switch (index){
                           case 0:
                               if(!debug_release){
                                   if(datprocess.selectnchar(0,1)=="1") {
                                       devset5.settouchable=true;
                                   }
                                   else {
                                       devset5.settouchable=false;
                                    }
                               }
                               break;
                           case 1:
                               tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                               countsetlabel1.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(4,4));
                               countsetlabel9.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                               countsetlabel10.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(12,4));
                               complabel14.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(16,4));
                               countsetlabel2.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(20,4));
                               countsetlabel11.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(24,4));
                               countsetlabel3.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(28,4));
                               countsetlabel12.labeltext3 = tmp;
                               break;
                           case 2:
                               tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                               countsetlabel4.labeltext3 = tmp;
                               break;
                           case 3:
                               tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                               countsetlabel14.labeltext3 = tmp;
//                               tmp=datprocess.covstring20x(datprocess.selectnchar(4,4));
//                               countsetlabel4.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                               countsetlabel13.labeltext3 = tmp;
                               break;
                           case 4:
                               tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                               complabel25.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                               countsetlabel6.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(12,4));
                               countsetlabel7.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(16,4));
                               countsetlabel5.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(20,4));
                               countsetlabel15.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(24,4));
                               complabel16.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(44,4));
                               complabel16.labeltext3 = tmp;
                               break;
                           case 5:
                               tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                               complabel8.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(4,4));
                               complabel6.labeltext3 = tmp;
                               break;
                           case 6:
                               tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                               countsetlabel16.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                               complabel15.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(16,4));
                               complabel2.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(20,4));
                               complabel4.labeltext3 = tmp;
                               break;
                           case 7:
                               tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                               tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(4,4))<<16;
                               complabel10.labeltext3 = (tmp/100).toFixed(2);
                               tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                               tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(12,4))<<16;
                               complabel12.labeltext3 = (tmp/100).toFixed(2);
                               tmp=datprocess.covstring20x(datprocess.selectnchar(16,4));
                               tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(20,4))<<16;
                               complabel5.labeltext3 = (tmp/100).toFixed(2);
                               break;
                           case 8:
                               tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                               tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(4,4))<<16;
                               complabel1.labeltext3 = (tmp/100).toFixed(2);
                               tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                               tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(12,4))<<16;
                               complabel9.labeltext3 = (tmp/100).toFixed(2);
                               tmp=datprocess.covstring20x(datprocess.selectnchar(16,4));
                               tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(20,4))<<16;
                               complabel11.labeltext3 = (tmp/100).toFixed(2);
                               tmp=datprocess.covstring20x(datprocess.selectnchar(24,4));
                               tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(28,4))<<16;
                               complabel13.labeltext3 = (tmp/100).toFixed(2);
                               tmp=datprocess.covstring20x(datprocess.selectnchar(32,4));
                               tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(36,4))<<16;
                               complabel7.labeltext3 = (tmp/100).toFixed(2);
                               tmp=datprocess.covstring20x(datprocess.selectnchar(40,4));
                               tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(44,4))<<16;
                               complabel3.labeltext3 = (tmp/100).toFixed(2);
                               break;
                           case 9:
                               tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                               complabel18.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(4,4));
                               complabel17.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                               complabel23.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(12,4));
                               complabel22.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(16,4));
                               complabel26.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(20,4));
                               complabel24.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(24,4));
                               complabel20.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(28,4));
                               complabel21.labeltext3 = tmp;
                               tmp=datprocess.covstring20x(datprocess.selectnchar(32,4));
                               complabel19.labeltext3 = tmp;
                               break;
                           default: break;
                              }
                           screen.revready = false;
                        }
                  }
                function strgpackprocess(){
                     switch(strgcmdindex){
                          case 0: break;
                          case 1: break;
                          case 2: break;
                          case 3: break;
                          case 4: break;
                          case 5: break;
                          default: break;
                     }
                }
            }
            Item {
                id: devset6
                visible: false
                anchors.fill: parent
                property int strgcmdindex: 0
                Rectangle {
                    id: devset6rect
                    anchors.fill: parent
                    color: "#6C646A"
                    signal datacfmClick();
                    signal datasetClick();
                     gradient: Gradient {
                         GradientStop { position: 0.0; color: "#6C646A" }
                         GradientStop { position: 1.0; color: Qt.darker("#6A6D6A") }
                     }
                    Row{
                      // anchors.fill: parent
                       anchors.centerIn: parent
                       spacing: 30
                       Column{
                           spacing: 40
                           Rectangle{
                               id:space24
                               height:20;width:20
                               color:"transparent"
                           }
                           Text {
                               id: devset6text1
                               text: "推力值"
                               color: "blue"
                               font.pointSize: 20
                           }
                           Text {
                               id: devset6text2
                               text: "拉力值"
                               color: "blue"
                               font.pointSize: 20
                           }
                           Text {
                               id: devset6text3
                               text: "切断力"
                               color: "blue"
                               font.pointSize: 20
                           }
                           Text {
                               id: devset6text4
                               text: "主轴速度"
                               color: "blue"
                               font.pointSize: 20
                           }
                       }
                       Column{
                           spacing: 20
                           Text {
                               id: devset6text5
                               text: "设定值"
                               font.pointSize: 22
                           }
                           Row{
                               spacing: 10
                               Labelcust1{
                                   id:devset6label1;labelWidth:100;labelHeight: 50
                                   code:"A1";Component.onCompleted: labelClick.connect(devSetButPressed);
                                   labelSize: 20
                               }
                               Text {
                                   id: devset6text6
                                   text: "PA"
                                   font.pointSize: 20
                               }
                           }
                           Row{
                               spacing: 10
                               Labelcust1{
                                   id:devset6label2;labelWidth:100;labelHeight: 50
                                   code:"A2";Component.onCompleted: labelClick.connect(devSetButPressed);
                                   labelSize: 20
                               }
                               Text {
                                   id: devset6text7
                                   text: "PA"
                                   font.pointSize: 20
                               }
                           }
                           Row{
                               spacing: 10
                               Labelcust1{
                                   id:devset6label3;labelWidth:100;labelHeight: 50
                                   code:"A3";Component.onCompleted: labelClick.connect(devSetButPressed);
                                   labelSize: 20
                               }
                               Text {
                                   id: devset6text8
                                   text: "PA"
                                   font.pointSize: 20
                               }
                           }
                           Row{
                               spacing: 10
                               Labelcust1{
                                   id:devset6label4;labelWidth:100;labelHeight: 50
                                   code:"A4";Component.onCompleted: labelClick.connect(devSetButPressed);
                                   labelSize: 20
                               }
                               Text {
                                   id: devset6text9
                                   text: "rpm"
                                   font.pointSize: 20
                               }
                           }
                       }
                       Column{
                           spacing: 40
                           Text {
                               id: devset6text10
                               text: "设定范围"
                               font.pointSize: 22
                           }
                           Text {
                               id: devset6text11
                               text: "1-400KPA"
                               font.pointSize: 22
                           }
                           Text {
                               id: devset6text12
                               text: "1-400KPA"
                               font.pointSize: 22
                           }
                           Text {
                               id: devset6text13
                               text: "1-400KPA"
                               font.pointSize: 22
                           }
                           Text {
                               id: devset6text14
                               text: "5000-40000r/m"
                               font.pointSize: 22
                           }
                       }
                    }
                }
                onVisibleChanged: {
                    if(visible==true){
                        label1.labeltext="模拟量设定";
                        devsetpageindex=10;
                        screen.cmdnum=1;
                    }
                }
                function packprocess(index){
                    if(screen.revready == true){
                           switch (index){
                              case 0:
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(4,4))<<16;
                                  devset6label1.labeltext = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(12,4))<<16;
                                  devset6label2.labeltext = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(16,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(20,4))<<16;
                                  devset6label3.labeltext = (tmp/100).toFixed(2);
                                  tmp=datprocess.covstring20x(datprocess.selectnchar(24,4));
                                  tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(28,4))<<16;
                                  devset6label4.labeltext = (tmp/100).toFixed(2);
                                  break;
                              default: break;
                              }
                           screen.revready = false;
                        }
                  }
                function strgpackprocess(){
                     switch(strgcmdindex){
                          case 0: break;
                          case 1: break;
                          case 2: break;
                          case 3: break;
                          case 4: break;
                          case 5: break;
                          default: break;
                     }
                }
            }
            Item {
                id: devset7
                visible: false
                anchors.fill: parent
                property int strgcmdindex: 0
                property bool settouchable: true
                property bool safedoor: false
                property bool airopen: false
                onVisibleChanged: {
                        if(visible==true){
                            label1.labeltext="高级设定/初始化";
                            devsetpageindex=11;
                            screen.cmdnum=5;
                        }
                    }
                Rectangle {
                    id: devset7rect
                    anchors.fill: parent
                    color: "#6C646A"
                    signal datacfmClick();
                    signal datasetClick();
                     gradient: Gradient {
                         GradientStop { position: 0.0; color: "#6C646A" }
                         GradientStop { position: 1.0; color: Qt.darker("#6A6D6A") }
                     }
                     Row{
                         spacing: 100
                         anchors.horizontalCenter: parent.horizontalCenter
                         z:1
                        // height:100
                         Column{
                             spacing: 20
                             Text {
                                 id: devset7text1
                                 text: "工作模式"
                                 color: "blue"
                                 font.pointSize: 18
                             }
                             Comboboxcust {
                                 id:combox1
                                 items:["请选择位置","1-加工方式1","2-加工方式2","3-双无空跑测试","4-有插芯无丝","5-无插芯有丝"]
                                 onCurrentIndexChanged: {
                                     var str1="WDD0100801008";
                                     var str2=datprocess.cov0x2strings(combox1.currentIndex);
                                     ////console.log(str1+str2);
                                     datprocess.SendBuf=str1+str2;
                                     screen.state="STRGPACK_PROCESSING";
                                     //devset7.strgcmdindex=1;
                                 }
                             }
                         }
                         Column{
                             spacing: 20
                             Text {
                                 id: devset7text2
                                 text: "上载模式"
                                 color: "blue"
                                 font.pointSize: 18
                             }
                             Comboboxcust {
                                 id:combox2
                                 items:["请选择位置","1-周期工作","2-连续工作"," "]
                       //          currentIndex: comboxindex
                                 onCurrentIndexChanged: {
                                     var str1="WDD0100601006";
                                     var str2=datprocess.cov0x2strings(combox2.currentIndex);
                                     ////console.log(str1+str2);
                                     datprocess.SendBuf=str1+str2;
                                     screen.state="STRGPACK_PROCESSING";
                                     //devset7.strgcmdindex=1;
                                 }
                             }
                         }
                     }
                     Buttoncust {
                         id: factoryresetbutton
                         buttonWidth:200; buttonHeight:50
                         label: "恢复出厂值";labelSize: 22;radius: 2;color:"red"
                         anchors.top:parent.top;anchors.topMargin: 120
                         anchors.horizontalCenter: parent.horizontalCenter
                         onButtonClick: {
                              virtualboard.bPasswd=true;
                              virtualboard.visible=true;
                             virtualboard.vboardtitle="请输入密码";

                         }
                     }
                     Buttoncust {
                         id: semiautobutton
                         buttonWidth:200; buttonHeight:50
                         label: "半自动操作";labelSize: 22;radius: 2;
                         anchors.top:factoryresetbutton.bottom;anchors.topMargin: 20
                         anchors.horizontalCenter: parent.horizontalCenter
                         gradient: Gradient {
                             GradientStop { position: 0.0; color: "plum" }
                             GradientStop { position: 1.0; color: "#136F6F6F" }
                         }
                         onButtonClick: {
                                    gotosemiauto();
                                    devset7.visible=false;
                                    devsetroot.visible=true;
                         }
                     }
                     Buttoncust {
                         id: setupbutton
                         buttonWidth:200; buttonHeight:50
                         label: "进入开机准备";labelSize: 22;radius: 2;
                         anchors.top:semiautobutton.bottom;anchors.topMargin: 20
                         anchors.horizontalCenter: parent.horizontalCenter
                         gradient: Gradient {
                             GradientStop { position: 0.0; color: "plum" }
                             GradientStop { position: 1.0; color: "#136F6F6F" }
                         }
                         onButtonClick: {

                         }
                     }
                     Buttoncust {
                         id: safedoorbutton
                         buttonWidth:80; buttonHeight:80
                         label: devset7.safedoor ? "安全门\n生效中":"安全门\n忽略中";labelSize: 20;radius: 2;
                         touchenabled: devset7.settouchable
                         anchors.bottom:setupbutton.bottom;
                         anchors.left:parent.left;anchors.leftMargin: 200
                         gradient: Gradient {
                            GradientStop { position: 0.0; color: devset7.safedoor ? "green":"plum" }
                            GradientStop { position: 1.0; color: devset7.safedoor ? "green":"#136F6F6F" }
                        }
                         onButtonClick: {

                         }
                     }
                     Buttoncust {
                         id: airopenbutton
                         buttonWidth:80; buttonHeight:80
                         label: devset7.airopen ? "气源\n打开中":"气源\n关闭中";
                         labelSize: 20;radius: 2;
                         anchors.bottom:setupbutton.bottom;
                         anchors.right:parent.right;anchors.rightMargin: 200
                         touchenabled: devset7.settouchable
                         gradient: Gradient {
                            GradientStop { position: 0.0; color: devset7.airopen ? "green":"plum" }
                            GradientStop { position: 1.0; color: devset7.airopen ? "green":"#136F6F6F" }
                        }
                         onButtonClick: {

                         }
                     }
                }

                //                onVisibleChanged: {
//                    if(visible==true){
//                        label1.labeltext="设定";
//                        devsetpageindex=11;
//                        screen.cmdnum=8;
//                    }
//                }
                function packprocess(index){
                    if(screen.revready == true){
                           switch (index){
                               case 0:
                                   if(!debug_release){
                                       if(datprocess.selectnchar(0,1)=="1") {
                                               settouchable=true;
                                       }
                                       else {
                                              settouchable=false;
                                        }
                                    }
                                   break;
                               case 1:
                                   if(!debug_release){
                                       if(datprocess.selectnchar(0,1)=="1") {
                                               combox1.touchabled=true;
                                               combox2.touchabled=true;
                                       }
                                       else {
                                              combox1.touchabled=false;
                                              combox2.touchabled=false;
                                        }
                                    }
                                   break;
                               case 2:
                                       if(datprocess.selectnchar(0,1)=="1") {
                                               safedoor=true;
                                       }
                                       else{
                                              safedoor=false;
                                        }

                                   break;
                               case 3:
                                       if(datprocess.selectnchar(0,1)=="1") {
                                               airopen=true;
                                       }
                                       else {
                                              airopen=false;
                                       }
                                   break;
                               case 4:
                                   combox1.currentIndex=datprocess.covstring20x(datprocess.selectnchar(0,4));
                                   combox2.currentIndex=datprocess.covstring20x(datprocess.selectnchar(12,4));
                                   screen.cmdnum--;
                                   break;
                              default: break;
                              }
                           screen.revready = false;
                        }
                  }
                function strgpackprocess(){
                     switch(strgcmdindex){
                          case 0: break;
                          case 1: break;
                          case 2: break;
                          case 3: break;
                          case 4: break;
                          case 5: break;
                          default: break;
                     }
                }
            }
//            Item {
//                id: devset8
//                visible: false
//                anchors.fill: parent
//                Devsetlearn {
//                    id:learn1
//                    anchors.fill: parent
//                    onDatasetClick: {
//                        devset1.visible=false;leftmotor.visible=true;
//                    }
//                }
//            }
        }
}
