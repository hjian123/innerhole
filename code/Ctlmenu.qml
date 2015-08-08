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
* Description :操作首界面的定义，一些参数的显示，主要按钮的切换
****************************************************************************/

import  QtQuick 2.0
import "keyboard"
import QtQuick.Controls 1.1
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.0
Rectangle {
    id: ctlmenu
    height: 600
    width: 1024

    property int l_orgaddr:  30100
    property int l_manspeed: 30020
    property int m_safegate: 30132
    property int m_manspeed: 30026
    property int m_oscspeed: 30068
    property int r_orgaddr:  30120
    property int r_manspeed: 30023
    property int r_mixtime:  30171
    property int r_scantime: 30023
    property int w_mouthaddr: 30150
    property int w_manspeed: 30030

    property int c_nopass: 30000
//    property int c_conelmt: 30001
//    property int c_backforth: 30002
//    property int c_nopassmax: 30004
//    property int c_nopasscntcut: 30005
//    property int c_nothmax: 30006
//    property int c_lowres: 30007
//    property int c_restrymax: 30018
//    property int c_hotcuttime: 30070
    property int c_backforth1: 00053
    property int c_nopasstime: 00120

    property real partition: 1 / 2
    property real partition1: 1 / 10
    property int tmp
    color: "#6C646A"
    gradient: Gradient {
            GradientStop { position: 0.0; color: "#6C646A" }
            GradientStop { position: 1.0; color: Qt.darker("#6A6D6A") }
        }

    function setcmd(pageindex,index){
       switch(pageindex){
           case 0: ctlmenuroot.setcmd(index);break;
           case 1: manualpage.setcmd(index);break;
           case 2: autopage.setcmd(index);break;
           case 3: devsetpage.setcmd(index);break;
           case 4: monitorpage.setcmd(index);break;
           case 5: warncheckpage.setcmd(index);break;
           case 6: helpfilepage.setcmd(index);break;
           case 7: semiauto.setcmd(index);break;
           default: break;
       }
    }
    function packprocess(pageindex,index){
       switch(pageindex){
           case 0: ctlmenuroot.packprocess(index);break;
           case 1: manualpage.packprocess(index);break;
           case 2: autopage.packprocess(index);break;
           case 3: devsetpage.packprocess(index);break;
           case 4: monitorpage.packprocess(index);break;
           case 5: warncheckpage.packprocess(index);break;
           case 6: helpfilepage.packprocess(index);break;
           case 7: semiauto.packprocess(index);break;
           default: break;
       }
    }
    function strgpackprocess(pageindex){
       switch(pageindex){
           case 0: ctlmenuroot.strgpackprocess();break;
           case 1: manualpage.strgpackprocess();break;
           case 2: autopage.strgpackprocess();break;
           case 3: devsetpage.strgpackprocess();break;
           case 4: monitorpage.strgpackprocess();break;
           case 5: warncheckpage.strgpackprocess();break;
           case 6: helpfilepage.strgpackprocess();break;
           case 7: semiauto.strgpackprocess();break;
           default: break;
       }
    }
    function warnprocesspack(){
        warncheckpage.warnprocesspack();
    }
    function savehistorywarn(){
        warncheckpage.savehistorywarn();
    }
    Item {
        id: ctlmenuroot
        visible: true
        anchors.fill: parent

        Rectangle {
            id: labelList1
            height: ctlmenu.height * partition1
            width: ctlmenu.width
            color: "beige"
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#8C8F8C" }
                GradientStop { position: 0.17; color: "#6A6D6A" }
                GradientStop { position: 0.98;color: "#3F3F3F" }
                GradientStop { position: 1.0; color: "#0e1B20" }
            }
            Timer{
                   id:timer3;interval: 1000;repeat: true;running: true
                   onTriggered: {
                      time1.labeltext = Qt.formatDateTime(new Date(), "yyyy-MM-dd\nhh:mm:ss");
                   }
               }
            Labelcust1{
            id:time1;labelWidth: 100;labelHeight:  40
            anchors.verticalCenter:  parent.verticalCenter
            anchors.left: parent.left;anchors.leftMargin: 50
            touchenabled: false
            labelSize: 10
            }
//            Labelcust1{
//            id:time2;labelWidth: 50;labelHeight:  30
//            labeltext: "17:20"
//            anchors.verticalCenter:  parent.verticalCenter
//            anchors.right: parent.right;anchors.rightMargin: 50
//            touchenabled: false
//            labelSize: 10
//        }
            Labelcust1{
                id:label1;labelWidth: parent.width*1/4;labelHeight:  parent.height
                labeltext: "内孔磨圆机"
                anchors.top:parent.top;anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                touchenabled: false
                labelSize: 20
           }
     }
        Rectangle {
            id: labelList
            height: ctlmenu.height * partition
            width: ctlmenu.width
            color: "beige"
            anchors.top:parent.top;anchors.topMargin: 60
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#8C8F8C" }
                GradientStop { position: 0.17; color: "#6A6D6A" }
                GradientStop { position: 0.98;color: "#3F3F3F" }
                GradientStop { position: 1.0; color: "#0e1B20" }
            }
       Column {
      //     anchors.fill: parent
           anchors.top:parent.top
           anchors.topMargin: 20
           anchors.left: parent.left
           anchors.leftMargin: 150
           spacing: 20
         //  z: 1
            Row {
                spacing: 80

                Column {
                    spacing: 10
                    Text{
                        id: text1;width:50;height:20;text: qsTr("      当前数"); font.pointSize: 18
                        horizontalAlignment: Text.AlignHCenter
                    }
                    Labelcust1{
                        id:currentcount;labelWidth: 100;labelHeight:  40;
                        labeltext: "00000";labelSize: 16
                        touchenabled:false;textColor:"yellow";labelColor: "black"
                    }         
                }
                Column {
                    spacing: 10
                    Text{
                        id: text2;width:50;height:20;text: qsTr(" 状 态"); font.pointSize: 18
                        horizontalAlignment: Text.AlignHCenter
                    }
                    Labelcust1{
                        id:state;labelWidth: 60;labelHeight:  40;
                        labeltext: "0";labelSize: 16
                        touchenabled:false;textColor:"yellow";labelColor: "black"
                    }
                }
                Column {
                    spacing: 10
                    Text{
                        id: text3;width:50;height:20;text: qsTr(" 计 时"); font.pointSize: 18
                        horizontalAlignment: Text.AlignHCenter
                    }
                    Labelcust1{
                        id:timerlabel;labelWidth: 60;labelHeight:  40;
                        labeltext: "0.0";labelSize: 16
                        touchenabled:false;textColor:"yellow";labelColor: "black"
                    }
                }
                Column {
                    spacing: 10
                    Text{
                        id: text4;width:50;height:20;text: qsTr("     首次接触"); font.pointSize: 18
                        horizontalAlignment: Text.AlignHCenter
                    }
                    Labelcust1{
                        id:firsttouch;labelWidth: 100;labelHeight: 40;
                        labeltext: "0.0";labelSize: 16
                        touchenabled:false;textColor:"yellow";labelColor: "black"
                    }
                }
                Column {
                    spacing: 10
                    Text{
                        id: text5;width:50;height:20;text: qsTr("      最后接触"); font.pointSize: 18
                        horizontalAlignment: Text.AlignHCenter
                    }
                    Labelcust1{
                        id:lasttouch;labelWidth: 100;labelHeight:  40;
                        labeltext: "0.00";labelSize: 16
                        touchenabled:false;textColor:"yellow";labelColor: "black"
                    }
                }
            }
            Row {
                spacing: 65
                Column {
                    spacing: 10
                    Text{
                        id: text6;width:50;height:20;text: qsTr("      设定数"); font.pointSize: 18
                        horizontalAlignment: Text.AlignHCenter
                    }
                    Labelcust1{
                        id:setcount;labelWidth: 100;labelHeight:  40;
                        labeltext: "00000";labelSize: 16
                        touchenabled:false;textColor:"yellow";labelColor: "black"
                    }
                }
                Column {
                    spacing: 10
                    Text{
                        id: text7;width:50;height:20;text: qsTr("      穿丝推力"); font.pointSize: 18
                        horizontalAlignment: Text.AlignHCenter
                    }
                    Labelcust1{
                        id:threadpull;labelWidth: 100;labelHeight:  40;
                        labeltext: "0";labelSize: 16
                        touchenabled:false;textColor:"yellow";labelColor: "black"
                    }
                }
                Column {
                    spacing: 10
                    Text{
                        id: text8;width:50;height:20;text: qsTr("      穿丝拉力"); font.pointSize: 18
                        horizontalAlignment: Text.AlignHCenter
                    }
                    Labelcust1{
                        id:threadpush;labelWidth:100;labelHeight:  40;
                        labeltext: "0.0";labelSize: 16;labelColor: "black"
                        touchenabled:false;textColor:"yellow"
                    }
                }
                Column {
                    spacing: 10
                    Text{
                        id: text9;width:50;height:20;text: qsTr("      主轴速度"); font.pointSize: 18
                        horizontalAlignment: Text.AlignHCenter
                    }
                    Labelcust1{
                        id:mainarborspeed;labelWidth: 90;labelHeight:  40;
                        labeltext: "0.00";labelSize: 16;labelColor: "black"
                        touchenabled:false;textColor:"yellow"
                    }
                }
            }
            Row {
                spacing: 40
                Text{
                    id: text10;width:50;height:20;text: qsTr("运行\n情况"); font.pointSize: 18
                    horizontalAlignment: Text.AlignHCenter
                }
                Labelcust1{
                    id:rundetails;labelWidth: 500;labelHeight:  50;
                    labeltext: "机器PLC没有运行";labelSize: 22;textColor:"red"
                    touchenabled:false; labelColor: "black"
                }
            }
           }
}
        Rectangle {
            id: buttonlList
            height: ctlmenu.height * 1/3
            width: ctlmenu.width
            color: "beige"
            anchors.bottom:parent.bottom;//anchors.topMargin: 30
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#8C8F8C" }
                GradientStop { position: 0.17; color: "#6A6D6A" }
                GradientStop { position: 0.98;color: "#3F3F3F" }
                GradientStop { position: 1.0; color: "#0e1B20" }
            }
        Buttoncust {
            id:manualbutton
            width: 120; height: 100
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.left: parent.left
            anchors.leftMargin: 42
            label: "手动 \n操作"
            labelSize: 20
            radius: 5
            gradient: Gradient {
                GradientStop { position: 0.0; color: "plum" }
                GradientStop { position: 1.0; color: "#136F6F6F" }
            }
            onButtonClick: {
                manualpage.visible=true;ctlmenuroot.visible=false;
                screen.pageindex=1; screen.cmdnum=2;

          //      datprocess.SendBuf="RDD0500005001"
            }
        }
        Buttoncust {
            id:autobutton
            width: 120; height: 100
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.left: manualbutton.right
            anchors.leftMargin: 44
            label: "自动 \n操作"
            labelSize: 20
            radius: 5
            gradient: Gradient {
                GradientStop { position: 0.0; color: "plum" }
                GradientStop { position: 1.0; color: "#136F6F6F" }
            }
            onButtonClick: {
                autopage.visible=true;ctlmenuroot.visible=false;
                screen.pageindex=2; screen.cmdnum=16;
            }
        }
        Buttoncust {
            id:devsetbutton
            width: 120; height: 100
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.left: autobutton.right
            anchors.leftMargin: 44
            label: "项目 \n设定"
            labelSize: 20
            radius: 5
            gradient: Gradient {
                GradientStop { position: 0.0; color: "plum" }
                GradientStop { position: 1.0; color: "#136F6F6F" }
            }
            onButtonClick: {
                console.log("devsetbutton click!!!");
                devsetpage.visible=true;ctlmenuroot.visible=false;
                screen.pageindex=3; screen.cmdnum=0;
                devset.devsetpageindex=0;
            }
        }
        Buttoncust {
            id:monitorbutton
            width: 120; height: 100
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.left: devsetbutton.right
            anchors.leftMargin: 44
            label: "运行 \n监控"
            labelSize: 20
            radius: 5
            gradient: Gradient {
                GradientStop { position: 0.0; color: "plum" }
                GradientStop { position: 1.0; color: "#136F6F6F" }
            }
            onButtonClick: {
                console.log("monitorbutton click!!!");
                monitorpage.visible=true;ctlmenuroot.visible=false;
                screen.pageindex=4; screen.cmdnum=8;
            }
        }
        Buttoncust {
            id:warncheckbutton
            width: 120; height: 100
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.left: monitorbutton.right
            anchors.leftMargin: 44
            label: "报警 \n查看"
            labelSize: 20
            radius: 5
            gradient: Gradient {
                GradientStop { position: 0.0; color: "plum" }
                GradientStop { position: 1.0; color: "#136F6F6F" }
            }
            onButtonClick: {
                console.log("warncheckbutton click!!!");
               warncheckpage.visible=true;ctlmenuroot.visible=false;
                screen.cmdnum=1;
            }
        }
        Buttoncust {
            id:helpfilebutton
            width: 120; height: 100
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.left: warncheckbutton.right
            anchors.leftMargin: 44
            label: "帮助 \n文件"
            labelSize: 20
            radius: 5
            gradient: Gradient {
                GradientStop { position: 0.0; color: "plum" }
                GradientStop { position: 1.0; color: "#136F6F6F" }
            }
            onButtonClick: {
                console.log("helpfilebutton click!!!");
                helpfilepage.visible=true;ctlmenuroot.visible=false;
            }
        }
}
        onVisibleChanged: {
            if(ctlmenuroot.visible==true){
                screen.pageindex=0;
                screen.cmdnum=5;
            }
        }
        function setcmd(index){
                    datprocess.ctlmenuroot_pollcmd(index);
                    }
        function packprocess(index){
          //  console.log("ctlroot");
            if(screen.revready == true){
                   switch (index){
                      case 0:
                        //  console.log("ctlroot 0");
                          tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                          tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(4,4))<<16;
                         // console.log("tmp",tmp);
                         // console.log("tmp",datprocess.RevBuf);
                          firsttouch.labeltext = (tmp/100).toFixed(2);
                          tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                          tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(12,4))<<16;
                        //  console.log("tmp",tmp);
                          lasttouch.labeltext = (tmp/100).toFixed(2);
                          tmp=datprocess.covstring20x(datprocess.selectnchar(16,4));
                        //  console.log("tmp",tmp);
                          state.labeltext = tmp;
                          tmp=datprocess.covstring20x(datprocess.selectnchar(20,4));
                        //  console.log("tmp",tmp);
                          timerlabel.labeltext = (tmp/10).toFixed(1);
                          break;
                      case 1:
                         // console.log("ctlroot 1");
                          setcount.labeltext = datprocess.covstring20x(datprocess.selectnchar(0,4));
                          break;
                      case 2:
                        //  console.log("ctlroot 2");
                          tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                          tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(4,4))<<16;
                          threadpull.labeltext = tmp;
                          tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                          tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(12,4))<<16;
                          threadpush.labeltext = tmp;
                          mainarborspeed.labeltext=datprocess.covstring20x(datprocess.selectnchar(24,4));
                          break;
                      case 3:
                        //  console.log("ctlroot 3");
                          currentcount.labeltext=datprocess.covstring20x(datprocess.selectnchar(0,4));
                          break;
                      case 4:
                         // console.log("ctlroot 4");
                          tmp=(datprocess.covstring20x(datprocess.selectnchar(0,4)))&0x0F;
                          switch(tmp){
                             case 0: rundetails.labeltext="机器处于自动运行中";break;
                             case 1: rundetails.labeltext="机器处于手动运行中";break;
                             case 2: rundetails.labeltext="机器处于初始化中";break;
                             case 3: rundetails.labeltext="机器处于异常状态，请检查！！";break;
                             case 4: rundetails.labeltext="机器处于演示空转运行中";break;
                             case 5: rundetails.labeltext="总产量达到目标值停机";break;
                             case 6: rundetails.labeltext="磨削丝没有或断丝停机";break;
                             case 7: rundetails.labeltext="电热刀到达设定值";break;
                             case 8: rundetails.labeltext="磨尖工具到达设定值";break;
                             case 9: rundetails.labeltext="控制器异常停止，请重新加电";break;
                             case 10: rundetails.labeltext="机器排出触发生效...";break;
                             case 11: rundetails.labeltext="自动循环结束";break;
                             case 12: rundetails.labeltext="机器即将停止";break;
                             case 13: rundetails.labeltext="机器暂停中";break;
                             case 14: rundetails.labeltext="准备OK可以按自动启动";break;
                             case 15: rundetails.labeltext="初始待机中";break;
                             default: break;
                          }
                          break;
                      default: break;
                      }
                   screen.revready = false;
                }
          }
        function strgpackprocess(pageindex){

        }
    }
    Item {
        id: manualpage
        anchors.fill: parent
        visible: false
        Manual{
            id:manulroot
            property string setValue
            anchors.fill: parent
            onBackClick: {manualpage.visible=false;ctlmenuroot.visible=true;
                             screen.pageindex=0; screen.cmdnum=4;      }
            onBtClicked: {
                var str=new String;
                str = "";
                setValue="";
                console.log("index=",index);
                if(index==21){
                   str="WCSR0040";
                   str += getWriteValue(bValue);
                }
                else {
                   str="WCSL00";
                 //   console.log(str);
                   switch(index){
                     case 1:str +="10";break;
                     case 2:str +="12";break;
                     case 3:str +="11";break;
                     case 4:str+="13";break;
                     case 5:str+="14";break;
                     case 6:str+="16";break;
                     case 7:str+="15";break;
                     case 8:str+="17";break;
                     case 9:str+="18";break;
                     case 10:str+="1A";break;
                     case 11:str+="19";break;
                     case 12:str+="1B";break;
                     case 13:str+="1C";break;
                     case 14:str+="1E";break;
                     case 15:str+="1D";break;
                     case 16:str+="1F";break;
                     case 17:str+="20";break;
                     case 18:str+="21";break;
                     case 19:str+="19";break;
                     case 20:str+="1C";break;
                     case 22:str+="25";break;

                   }
                   str += getWriteValue(bValue);
                   console.log("str",str);
                }
               // console.log("setValue=",str);
                setValue=str;
                datprocess.SendBuf=setValue;
                screen.state="STRGPACK_PROCESSING";
            }
            function getWriteValue(value){
                if(value){return "1";}
                else {return "0";}
            }
        }
        onVisibleChanged: {
            if(manualpage.visible==true){
                screen.cmdnum=2;
                screen.pageindex=1;
            }
        }
        function setcmd(index){
                    datprocess.manualpage_pollcmd(index);
                    }
        function packprocess(index){
            if(screen.revready == true){
                   switch (index){
                      case 0:
                          manulroot.r11Value=datprocess.covstring20x(datprocess.selectnchar(0,4));
                          manulroot.r12Value=datprocess.covstring20x(datprocess.selectnchar(4,4));
                          break;
                      case 1:
                          if(datprocess.selectnchar(0,1)==="1"){
                              manulroot.btValue21=true;
                          }
                          else manulroot.btValue21=false;
                          break;
                      default: break;
                      }
                   screen.revready = false;
                }
          }
        function strgpackprocess(pageindex){

        }
    }
    Item {
        id:autopage
        anchors.fill: parent
        visible: false
        Auto {
            id:autoroot
            anchors.fill: parent
            onBackClick: {
                autopage.visible=false;ctlmenuroot.visible=true;
                screen.pageindex=0; screen.cmdnum=5;screen.cmdnumtmp=screen.cmdnum;
            }
            onResetClick: {
                if(butreset==true)datprocess.SendBuf="WCSR00350";
                else datprocess.SendBuf="WCSR00351";
                screen.state="STRGPACK_PROCESSING";
                autoroot.strgcmdindex=3;
            }
            onStopClick: {
                if(butstop==true)datprocess.SendBuf="WCSR00340";
                else datprocess.SendBuf="WCSR00341";
                screen.state="STRGPACK_PROCESSING";
                autoroot.strgcmdindex=2;
            }
            onSetupClick: {
               if(butrun==true)datprocess.SendBuf="WCSR00330";
               else datprocess.SendBuf="WCSR00331";
               screen.state="STRGPACK_PROCESSING";
               autoroot.strgcmdindex=1;
            }
            onVisibleChanged: {
                if(autopage.visible==true){
                    screen.pageindex=2; screen.cmdnum=16;
                }
            }
        }
        function setcmd(index){
                    datprocess.autopage_pollcmd(index);
                    }
        function packprocess(index){
            if(screen.revready == true){
                   switch (index){
                      case 0:
                          if(datprocess.selectnchar(0,1)=="1") autoroot.resetenabled=true;
                          else autoroot.resetenabled=false;
                          break;
                      case 1:
                          if(datprocess.selectnchar(0,1)=="1") {
                              screen.cmdnumtmp = 16;
                              autoroot.butrun=true;
                          }
                          else {autoroot.butrun=false;screen.cmdnumtmp = 4;}
                          break;
                      case 2:
                          if(datprocess.selectnchar(0,1)=="1") autoroot.butstop =true;
                          else autoroot.butstop=false;
                          break;
                      case 3:
                          if(datprocess.selectnchar(0,1)=="1") autoroot.butreset=true;
                          else autoroot.butreset=false;
                          break;
                      case 4:
                          if(datprocess.selectnchar(0,1)=="1") autoroot.orgstacolor="green";
                          else autoroot.orgstacolor="gray";;
                          break;
                      case 5:
                          if(datprocess.selectnchar(0,1)=="1") autoroot.searchcolor="green";
                          else autoroot.searchcolor="gray";;
                          break;
                      case 6:
                          if(datprocess.selectnchar(0,1)=="1") autoroot.feedcolor="green";
                          else autoroot.feedcolor="gray";;
                          break;
                      case 7:
                          if(datprocess.selectnchar(0,1)=="1") autoroot.inboxcolor ="green";
                          else autoroot.inboxcolor="gray";;
                          break;
                      case 8:
                          if(datprocess.selectnchar(0,1)=="1") autoroot.uploadcolor ="green";
                          else autoroot.uploadcolor="gray";;
                          break;
                      case 9:
                          if(datprocess.selectnchar(0,1)=="1") autoroot.toolcolor ="green";
                          else autoroot.toolcolor="gray";;
                          break;
                      case 10:
                          if(datprocess.selectnchar(0,1)=="1") autoroot.cutcolor ="green";
                          else autoroot.cutcolor="gray";;
                          break;
                      case 11:
                          if(datprocess.selectnchar(0,1)=="1") autoroot.mainincolor ="green";
                          else autoroot.mainincolor="gray";;
                          break;
                      case 12:
                          if(datprocess.selectnchar(0,1)=="1") autoroot.crmpcolor ="green";
                          else autoroot.crmpcolor="gray";;
                          break;
                      case 13:
                          tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                          if(tmp==0)autoroot.statetext = "0:磨削OK";
                          else if(tmp==1)autoroot.statetext = "1:未接触NC";
                          else if(tmp==2)autoroot.statetext = "2:未通过NG"
                          tmp=datprocess.covstring20x(datprocess.selectnchar(4,4));
                          autoroot.timetext = (tmp/100).toFixed(1);
                          tmp=datprocess.covstring20x(datprocess.selectnchar(40,4));
                          if(0<=tmp && tmp <= 99)autoroot.dstatext = tmp;
                          break;
                      case 14:
                          autoroot.tipcount = datprocess.covstring20x(datprocess.selectnchar(0,4));
                          break;
                      case 15:
                          tmp=(datprocess.covstring20x(datprocess.selectnchar(0,4)))&0x0F;
                          switch(tmp){
                             case 0: autoroot.msgtext="机器处于自动运行中";break;
                             case 1: autoroot.msgtext="机器处于手动运行中";break;
                             case 2: autoroot.msgtext="机器处于初始化中";break;
                             case 3: autoroot.msgtext="机器处于异常状态，请检查！！";break;
                             case 4: autoroot.msgtext="机器处于演示空转运行中";break;
                             case 5: autoroot.msgtext="总产量达到目标值停机";break;
                             case 6: autoroot.msgtext="磨削丝没有或断丝停机";break;
                             case 7: autoroot.msgtext="电热刀到达设定值";break;
                             case 8: autoroot.msgtext="磨尖工具到达设定值";break;
                             case 9: autoroot.msgtext="控制器异常停止，请重新加电";break;
                             case 10: autoroot.msgtext="机器排出触发生效...";break;
                             case 11: autoroot.msgtext="自动循环结束";break;
                             case 12: autoroot.msgtext="机器即将停止";break;
                             case 13: autoroot.msgtext="机器暂停中";break;
                             case 14: autoroot.msgtext="准备OK可以按自动启动";break;
                             case 15: autoroot.msgtext="初始待机中";break;
                             default: break;
                          }
                          break;
//                      case 3:
//                          mainarborspeed.labeltext=datprocess.covstring20x(datprocess.selectnchar(0,4));
//                          break;
//                      case 4:
//                          currentcount.labeltext=datprocess.covstring20x(datprocess.selectnchar(0,4));
//                          break;
                      default: break;
                      }
                   screen.revready = false;
                }
          }
        function strgpackprocess(){
             switch(autoroot.strgcmdindex){
                  case 1: break;
                  case 2: break;
                  case 3: break;
                  default: break;
             }
        }
    }
    Item {
        id: devsetpage
        anchors.fill: parent
        visible: false
        Devset {
            id:devset
            anchors.fill: parent
            onBackClick: {
                devsetpage.visible=false;
                ctlmenuroot.visible=true;
                screen.pageindex=0;
                screen.cmdnum=5;
              //  screen.cmdnumtmp=screen.cmdnum;
            }
            onGotosemiauto: {devsetpage.visible=false;semiauto.visible=true;}
            onDevSetButPressed: {
                virtualboard.visible=true;
          //      console.log(bottomy);
//                if(bottomy>=350){                                             //改变按钮的Y值，按钮不要被键盘覆盖
//                    devmenuy=devmenuy-(bottomy-350+80);
//                }
                console.log("onDevSetButPressed",btcode);
                virtualboard.trgop=btcode; //将按键返回值保存
            }
        }
        function setcmd(index){
            devset.setcmd(index);
        }
        function packprocess(index){
            devset.packprocess(index);
        }
        function strgpackprocess(){
            devset.packprocess();
        }
    }
    Item {
        id: monitorpage
        anchors.fill: parent
        visible: false
        Monitor {
            id:monitorroot
            anchors.fill: parent
            onBackClick: {monitorpage.visible=false;ctlmenuroot.visible=true;}
            onReloadchaxin: {
                if(bValue){datprocess.SendBuf="WCSR00401";}
                else datprocess.SendBuf="WCSR00400";
                screen.state="STRGPACK_PROCESSING";
            }
            onClearRuningData: {
                switch(index){
                   case 0:
                         if(bValue==true){datprocess.SendBuf="WCSL008A0";}
                         else {datprocess.SendBuf="WCSL008A1";}
                         break;
                   case 1:
                         if(bValue==true){datprocess.SendBuf="WCSL00850";}
                         else {datprocess.SendBuf="WCSL00851";}
                         break;
                   case 2:
                         if(bValue==true){datprocess.SendBuf="WCSL00860";}
                         else {datprocess.SendBuf="WCSL00861";}
                         break;
                   case 3:
                         if(bValue==true){datprocess.SendBuf="WCSL00870";}
                         else {datprocess.SendBuf="WCSL00871";}
                         break;
                   case 4:
                         if(bValue==true){datprocess.SendBuf="WCSL00880";}
                         else {datprocess.SendBuf="WCSL00881";}
                         break;
                   case 5:
                         if(bValue==true){datprocess.SendBuf="WCSL00890";}
                         else {datprocess.SendBuf="WCSL00891";}
                         break;
                   default:break;
                }
            }
            onSetRuningData: {
                var op;
                switch(index){
                    case 0: op="R1";break;
                    case 1: op="R2";break;
                    case 2: op="R3";break;
                    case 3: op="R4";break;
                    case 4: op="R5";break;
                    case 5: op="R6";break;
                    default:break;
                }
                virtualboard.visible=true;
                virtualboard.trgop=op;
            }
        }
        function setcmd(index){
            console.log(monitorroot.tabcIndex);
            switch(monitorroot.tabcIndex){
              case 0: screen.cmdnum=8;datprocess.monitortab1_pollcmd(index);break;
              case 1: screen.cmdnum=11;datprocess.monitortab2_pollcmd(index);break;
              case 2: screen.cmdnum=5;datprocess.monitortab3_pollcmd(index);break;
              default:break;
            }
        }
        function packprocess(index){
            switch(monitorroot.tabcIndex){
              case 0: packprocesstab1(index);break;
              case 1: packprocesstab2(index);break;
              case 2: packprocesstab3(index);break;
              default:break;
            }
        }
        function packprocesstab3(index){
            if(screen.revready == true){
                   switch (index){
                      case 0:
                          monitorroot.tab3.setZero=datprocess.covstring20x(datprocess.selectnchar(0,4))
                          break;
                      case 1:
                          monitorroot.tab3.setText1=datprocess.covstring20x(datprocess.selectnchar(0,4));
                          break;
                      case 2:
                          monitorroot.tab3.setText2=datprocess.covstring20x(datprocess.selectnchar(0,4));
                          monitorroot.tab3.setText3=datprocess.covstring20x(datprocess.selectnchar(4,4));
                          monitorroot.tab3.setText4=datprocess.covstring20x(datprocess.selectnchar(8,4));
                          monitorroot.tab3.setText5=datprocess.covstring20x(datprocess.selectnchar(12,4));
                          monitorroot.tab3.setText6=datprocess.covstring20x(datprocess.selectnchar(16,4));
                          break;
                      case 3:
                          monitorroot.tab3.currentText1=datprocess.covstring20x(datprocess.selectnchar(0,4));
                          monitorroot.tab3.currentText2=datprocess.covstring20x(datprocess.selectnchar(4,4));
                          monitorroot.tab3.currentText3=datprocess.covstring20x(datprocess.selectnchar(8,4));
                          monitorroot.tab3.currentText4=datprocess.covstring20x(datprocess.selectnchar(12,4));
                          monitorroot.tab3.currentText5=datprocess.covstring20x(datprocess.selectnchar(16,4));
                          monitorroot.tab3.currentText6=datprocess.covstring20x(datprocess.selectnchar(20,4));
                          break;
                      case 4:
                          monitorroot.tab3.month1=datprocess.covstring20x(datprocess.selectnchar(0,4));
                          monitorroot.tab3.day1=datprocess.covstring20x(datprocess.selectnchar(4,4));
                          monitorroot.tab3.year1=datprocess.covstring20x(datprocess.selectnchar(12,4));
                          if(monitorroot.tab3.year1==="0")monitorroot.tab3.year1="00";
                          break;
                      default: break;
                      }
                   screen.revready = false;
                }
        }
        function packprocesstab2(index){
            if(screen.revready == true){
                   switch (index){
                      case 0:
                            if(datprocess.selectnchar(0,1)==="1"){
                               monitorroot.tab2.chaXinValue=true;
                            }
                            else monitorroot.tab2.chaXinValue=false;
                          break;
                      case 1:
                          if(datprocess.selectnchar(0,1)==="1"){
                             monitorroot.tab2.fb180Value=true;
                          }
                          else monitorroot.tab2.fb180Value=false;
                          break;

                      case 2:
                          if(datprocess.selectnchar(0,1)==="1"){
                             monitorroot.tab2.upLoadValue=true;
                          }
                          else monitorroot.tab2.upLoadValue=false;
                          break;
                      case 3:
                          monitorroot.tab2.curLocation1=datprocess.covstring20x(datprocess.selectnchar(0,4));

                          monitorroot.tab2.curLocation4=datprocess.covstring20x(datprocess.selectnchar(8,4));

                          monitorroot.tab2.curLocation2=datprocess.covstring20x(datprocess.selectnchar(16,4));

                          monitorroot.tab2.curLocation3=datprocess.covstring20x(datprocess.selectnchar(24,4));

                          break;
                      case 4:
                          tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                          tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(4,4))<<16;
                          monitorroot.tab2.curPosText3=(tmp/100).toFixed(2);
                          tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                          tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(12,4))<<16;
                          monitorroot.tab2.curPosText1=(tmp/100).toFixed(2);
                          tmp=datprocess.covstring20x(datprocess.selectnchar(16,4));
                          tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(20,4))<<16;
                          monitorroot.tab2.curPosText2=(tmp/100).toFixed(2);
                          tmp=datprocess.covstring20x(datprocess.selectnchar(24,4));
                          tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(28,4))<<16;
                          monitorroot.tab2.curPosText4=(tmp/100).toFixed(2);
                          break;
                      case 5:

                          break;
                      case 6:
                          if(datprocess.selectnchar(0,1)==="1"){
                             monitorroot.tab2.qgOrgValue=true;
                          }
                          else monitorroot.tab2.qgOrgValue=false;
                          break;
                      case 7:
                          monitorroot.tab2.y0Value=datprocess.covstring20x(datprocess.selectnchar(0,4));
                          monitorroot.tab2.y1Value=datprocess.covstring20x(datprocess.selectnchar(4,4));
                          break;
                      case 8:
                          monitorroot.tab2.x0Value=datprocess.covstring20x(datprocess.selectnchar(0,4));
                          monitorroot.tab2.x1Value=datprocess.covstring20x(datprocess.selectnchar(4,4));
                          break;
                      case 9:
                          monitorroot.tab2.x30Value=datprocess.covstring20x(datprocess.selectnchar(0,4));
                          monitorroot.tab2.x40Value=datprocess.covstring20x(datprocess.selectnchar(4,4));
                          break;
                      case 10:
                          monitorroot.tab2.y30Value=datprocess.covstring20x(datprocess.selectnchar(0,4));
                          monitorroot.tab2.y40Value=datprocess.covstring20x(datprocess.selectnchar(4,4));
                          break;
                      default: break;
                      }
                   screen.revready = false;
                }

        }
        function packprocesstab1(index){
            if(screen.revready == true){
                   switch (index){
                      case 0:
                            tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                            switch(tmp){
                               case 0:  monitorroot.tab1.time.sysState="磨削OK";break;
                               case 1:  monitorroot.tab1.time.sysState="未接触";break;
                               case 2:  monitorroot.tab1.time.sysState="未通过";break;
                               default: break;
                            }
                            tmp=datprocess.covstring20x(datprocess.selectnchar(4,4));
                            monitorroot.tab1.time=(tmp/10).toFixed(1);
                          break;
                      case 1:
                          tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                          monitorroot.tab1.dt30046=tmp;
                          break;

                      case 2:
                          tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                          monitorroot.tab1.sysOutput=tmp;
                          tmp=datprocess.covstring20x(datprocess.selectnchar(20,4));
                          tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(24,4))<<16;
                          monitorroot.tab1.rightPosition=(tmp/10).toFixed(1);
                          tmp=datprocess.covstring20x(datprocess.selectnchar(28,4));
                          tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(32,4))<<16;
                          monitorroot.tab1.leftPosition=(tmp/10).toFixed(1);
                          tmp=datprocess.covstring20x(datprocess.selectnchar(36,4));
                          tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(40,4))<<16;
                          monitorroot.tab1.mainShift=(tmp/10).toFixed(1);
                          tmp=datprocess.covstring20x(datprocess.selectnchar(44,4));
                          tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(48,4))<<16;
                          monitorroot.tab1.chuanSiWei=(tmp/10).toFixed(1);
                          break;

                      case 3:
                          tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                          switch(tmp&&0x000F){
                              case 0: monitorroot.tab1.leftPosValue="原点位";break;
                              case 1: monitorroot.tab1.leftPosValue="圆锥确认"; break;
                              case 2: monitorroot.tab1.leftPosValue="供给插芯";break;
                              case 3: monitorroot.tab1.leftPosValue="插芯OK位"; break;
                              case 4: monitorroot.tab1.leftPosValue="不接触";break;
                              case 5: monitorroot.tab1.leftPosValue="未通过"; break;
                              case 6: monitorroot.tab1.leftPosValue="等待位";break;
                              case 7: monitorroot.tab1.leftPosValue="下载排出"; break;
                              case 8: monitorroot.tab1.leftPosValue="上载投入"; break;
                              default:break;
                          }
                          tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                          switch(tmp&&0x000F){
                              case 0: monitorroot.tab1.siZuiValue="丝嘴位置";break;
                              case 1: monitorroot.tab1.siZuiValue="原点位"; break;
                              case 2: monitorroot.tab1.siZuiValue="磨削液位";break;
                              case 3: monitorroot.tab1.siZuiValue="丝插入位"; break;
                              case 4: monitorroot.tab1.siZuiValue="修磨开始";break;
                              case 5: monitorroot.tab1.siZuiValue="修磨结束"; break;
                              case 6: monitorroot.tab1.siZuiValue="切断丝位";break;
                              default:break;
                          }
                          tmp=datprocess.covstring20x(datprocess.selectnchar(16,4));
                          switch(tmp&&0x000F){
                              case 0: monitorroot.tab1.backSafeValue="后安全位";break;
                              case 1: monitorroot.tab1.backSafeValue="上载插芯"; break;
                              case 2: monitorroot.tab1.backSafeValue="原点位";break;
                              case 3: monitorroot.tab1.backSafeValue="加工等待"; break;
                              case 4: monitorroot.tab1.backSafeValue="加工磨削";break;
                              case 5: monitorroot.tab1.backSafeValue="挤磨削液"; break;
                              default:break;
                          }
                          tmp=datprocess.covstring20x(datprocess.selectnchar(24,4));
                          switch(tmp&&0x000F){
                              case 0: monitorroot.tab1.rightPosValue="原点位";break;
                              case 1: monitorroot.tab1.rightPosValue="激光扫描"; break;
                              case 2: monitorroot.tab1.rightPosValue="磨削加工";break;
                              case 3: monitorroot.tab1.rightPosValue="切断丝位"; break;
                              case 4: monitorroot.tab1.rightPosValue="丝修磨位";break;
                              default:break;
                          }
                          break;
                      case 4:
                          monitorroot.tab1.x0RValue=datprocess.covstring20x(datprocess.selectnchar(0,4));
                          monitorroot.tab1.x1RValue=datprocess.covstring20x(datprocess.selectnchar(4,4));
                          break;
                      case 5:
                          monitorroot.tab1.y0RValue=datprocess.covstring20x(datprocess.selectnchar(0,4));
                          monitorroot.tab1.y1RValue=datprocess.covstring20x(datprocess.selectnchar(4,4));
                          break;
                      case 6:
                          tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                          monitorroot.tab1.pullValue=tmp;
                          tmp=datprocess.covstring20x(datprocess.selectnchar(4,4));
                          monitorroot.tab1.sysState=tmp;
                          break;
                      case 7:
                          if(datprocess.selectnchar(0,1)==="1"){
                              monitorroot.tab1.reloadValue=true;
                          }
                          else monitorroot.tab1.reloadValue=false;
                          break;
                      default: break;
                      }
                   screen.revready = false;
                }
          }
        function strgpackprocess(pageindex){

        }
    }
    Item {
        id: warncheckpage
        anchors.fill: parent
        visible: false
        Warncheck{
            id:warncheckroot
            anchors.fill: parent
            onBackClick: {warncheckpage.visible=false;ctlmenuroot.visible=true;}
        }
        function setcmd(index){
                    datprocess.warncheckpage_pollcmd(index);
                    }
        function packprocess(index){
            if(screen.revready == true){
                switch (index){
                   case 0:
                       if(datprocess.selectnchar(0,1)=="1") warncheckroot.resetenable=true;
                       else warncheckroot.resetenable=false;
                       break;
                   default:break;
                }
          }
        }
        function strgpackprocess(pageindex){

        }
        function warnprocesspack(){    //告警信息分为四个WL，共16位字符，每个WL除0000外可代表15个警告，共计55个警告
            if(screen.revready == true){          //4个WL分别代表0-14,15-29,30-44,45-54
                var str= new String;
                str = datprocess.selectnchar(2,2);
                str.concat(datprocess.selectnchar(0,2))
                tmp=parseInt(str);
                if(tmp > 0)warncheckroot.getWarn(tmp-1);
                str = datprocess.selectnchar(6,2);
                str.concat(datprocess.selectnchar(4,2))
                tmp=parseInt(str);
                if(tmp > 0)warncheckroot.getWarn(tmp+15-1);
                str = datprocess.selectnchar(10,2);
                str.concat(datprocess.selectnchar(8,2))
                tmp=parseInt(str);
                if(tmp > 0)warncheckroot.getWarn(tmp+30-1);
                str = datprocess.selectnchar(14,2);
                str.concat(datprocess.selectnchar(12,2))
                tmp=parseInt(str);
                if(tmp > 0 && tmp <11)warncheckroot.getWarn(tmp+45-1);
            }
        }
        function savehistorywarn(){
                warncheckroot.savehistorywarn();
        }

    }
    Item {
        id: helpfilepage
        anchors.fill: parent
        visible: false
        Helpfile{
            id:helpfileroot
            anchors.fill: parent
            onBackClick: {helpfilepage.visible=false;ctlmenuroot.visible=true;}
        }

        function setcmd(index){
                    datprocess.helpfilepage_pollcmd(index);
                    }
        function packprocess(index){
            if(screen.revready == true){
                  }
          }
        function strgpackprocess(pageindex){

        }
    }
    Item {
        id: semiauto
        visible: false
        anchors.fill: parent
        Semiauto{
           anchors.fill: parent
           onAutoClick: {
              semiauto.visible=false;autopage.visible=true;
           }
           onManualClick: {
              semiauto.visible=false;manualpage.visible=true;
           }
           onDevsetClick: {
              semiauto.visible=false;devsetpage.visible=true;
           }
           onMonitorClick: {
              semiauto.visible=false;monitorpage.visible=true;
           }
           onWarnClick: {
              semiauto.visible=false;warncheckpage.visible=true;
           }
           onHelpClick: {
              semiauto.visible=false;helpfilepage.visible=true;
           }
           onBackClick: {
               semiauto.visible=false;ctlmenuroot.visible=true;
               //screen.pageindex=0; screen.cmdnum=4;
           }
        }
        function setcmd(index){
                    datprocess.helpfilepage_pollcmd(index);
                    }
        function packprocess(index){
            if(screen.revready == true){
                   switch (index){
                      case 0:{
                          tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                          tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(4,4))<<16;
                          firsttouch.labeltext = (tmp/100).toFixed(2);
                          tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                          tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(12,4))<<16;
                          lasttouch.labeltext = (tmp/100).toFixed(2);
                          state.labeltext = datprocess.covstring20x(datprocess.selectnchar(16,4));
                          timerlabel.labeltext = (datprocess.covstring20x(datprocess.selectnchar(20,4))/10).toFixed(1);
                          break;
                      }
                      case 1:{
                          setcount.labeltext = datprocess.covstring20x(datprocess.selectnchar(0,4));
                          break;
                      }
                      case 2:{
                          tmp=datprocess.covstring20x(datprocess.selectnchar(0,4));
                          tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(4,4))<<16;
                          threadpull.labeltext = tmp;
                          tmp=datprocess.covstring20x(datprocess.selectnchar(8,4));
                          tmp=tmp|datprocess.covstring20x(datprocess.selectnchar(12,4))<<16;
                          threadpush.labeltext = tmp;
                          break;
                      }
                      case 3:
                          mainarborspeed.labeltext=datprocess.covstring20x(datprocess.selectnchar(0,4));
                          break;
                      case 4:
                          currentcount.labeltext=datprocess.covstring20x(datprocess.selectnchar(0,4));
                          break;
                      default: break;
                      }
                   screen.revready = false;
                }
          }
        function strgpackprocess(pageindex){

        }
    }
    Rectangle{
        id:mask
        anchors.fill: parent
        color: 'lightgrey'
        opacity: 0.5
        z:5
        visible: (virtualboard.visible || popup.showMask)
        MouseArea{
            anchors.fill: parent;
            onPressed:{
                 mouse.accepted = true
            }
        }
    }
    VirtualKeyboard{
        id:virtualboard
//        opacity: 0.5
        z:100
        visible: false
        anchors{
            bottom: parent.bottom
            bottomMargin: 30
            left:parent.left
            leftMargin: 315
        }
      //  anchors.horizontalCenter: parent.horizontalCenter
     //   anchors.horizontalCenterOffset: 50

        onVisibleChanged: {
            if(!visible){
                text="";
                bPasswd = false;
            }
            else{vboardtitle= (bPasswd ? "请输入密码":"请输入设定值");}
        }
        onCheckoutFlagChanged: {
            if(checkoutFlag===true){
               checkoutFlag=false;
               popup.showMask=true;
               popup.popuptext="注意：您确认将机器的所有参数恢复到出厂时的参数值，这将导致现有设定值全部清除，请确认！！！"
               popup.show();

            }
        }

        onAccepted: {
            var tmp1,tmp2;
            var addr1,addr2;
            console.log("onAccepted",textValue,trgop,devset.devsetpageindex);
            tmp1=textValue&0xFFFF;
       //     console.log(datprocess.cov0x2strings(tmp1));
            tmp2=(textValue>>16)&0xFFFF;
            virtualboard.visible=false;
       //     devset.devmenuy=60;
            if(screen.pageindex==3){
                if(devset.devsetpageindex==2){
               //    console.log("devsetpageindex=2");
                    devset.devset_1.strgcmdindex=12;
                    switch(trgop){
                       case "L1":
                           addr1=String(l_orgaddr);
                           addr2=String(l_orgaddr+1);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                          console.log("set",trgop,textValue);
                           break;
                       case "L2":
                           addr1=String(l_orgaddr+2);
                           addr2=String(l_orgaddr+3);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "L3":
                           addr1=String(l_orgaddr+4);
                           addr2=String(l_orgaddr+5);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "L4":
                           addr1=String(l_orgaddr+6);
                           addr2=String(l_orgaddr+7);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "L5":
                           addr1=String(l_orgaddr+8);
                           addr2=String(l_orgaddr+9);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "L6":
                           addr1=String(l_orgaddr+10);
                           addr2=String(l_orgaddr+11);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "L7":
                           addr1=String(l_orgaddr+12);
                           addr2=String(l_orgaddr+13);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "L8":
                           addr1=String(l_orgaddr+14);
                           addr2=String(l_orgaddr+15);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "L9":
                           addr1=String(l_orgaddr+16);
                           addr2=String(l_orgaddr+17);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "L10":
                           addr1=String(l_manspeed);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "L11":
                           addr1=String(l_manspeed+1);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "L12":
                           addr1=String(l_manspeed+2);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       default:   break;
                    }
                    screen.state="STRGPACK_PROCESSING";
                }
                else if(devset.devsetpageindex==4){
                    switch(trgop){
                       case "M1":
                           addr1=String(m_safegate);
                           addr2=String(m_safegate+1);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "M2":
                           addr1=String(m_safegate+2);
                           addr2=String(m_safegate+3);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "M3":
                           addr1=String(m_safegate+4);
                           addr2=String(m_safegate+5);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "M4":
                           addr1=String(m_safegate+6);
                           addr2=String(m_safegate+7);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "M5":
                           addr1=String(m_safegate+8);
                           addr2=String(m_safegate+9);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "M6":
                           addr1=String(m_safegate+10);
                           addr2=String(m_safegate+11);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "M7":
                           addr1=String(m_safegate+12);
                           addr2=String(m_safegate+13);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "M8":
                           addr1=String(m_manspeed);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "M9":
                           addr1=String(m_manspeed+1);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "M10":
                           addr1=String(m_manspeed+2);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "M11":
                           addr1=String(m_oscspeed);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       default:break;
                    }
                    screen.state="STRGPACK_PROCESSING";
                    devset.devset_2.strgcmdindex=11;
                }
                else if(devset.devsetpageindex==6){
                    switch(trgop){
                    case "R1":
                        addr1=String(r_orgaddr);
                        addr2=String(r_orgaddr+1);
                        datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                        break;
                    case "R2":
                        addr1=String(r_orgaddr+2);
                        addr2=String(r_orgaddr+3);
                        datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                        break;
                    case "R3":
                        addr1=String(r_orgaddr+4);
                        addr2=String(r_orgaddr+5);
                        datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                        break;
                    case "R4":
                        addr1=String(r_orgaddr+6);
                        addr2=String(r_orgaddr+7);
                        datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                        break;
                    case "R5":
                        addr1=String(r_orgaddr+8);
                        addr2=String(r_orgaddr+9);
                        datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                        break;
                    case "R6":
                        addr1=String(r_orgaddr+10);
                        addr2=String(r_orgaddr+11);
                        datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                        break;
                    case "R7":
                        addr1=String(r_mixtime);
                        datprocess.fillsend16buf("WDD",addr1,tmp1);
                        break;
                    case "R8":
                        addr1=String(r_manspeed);
                        datprocess.fillsend16buf("WDD",addr1,tmp1);
                        break;
                    case "R9":
                        addr1=String(r_manspeed+1);
                        datprocess.fillsend16buf("WDD",addr1,tmp1);
                        break;
                    case "R10":
                        addr1=String(r_manspeed+2);
                        datprocess.fillsend16buf("WDD",addr1,tmp1);
                        break;
                    case "R11":
                        addr1=String(r_scantime);
                        datprocess.fillsend16buf("WDD",addr1,tmp1);
                        break;
                    default:break;
                    }
                    screen.state="STRGPACK_PROCESSING";
                    devset.devset_3.strgcmdindex=11;
                }
                else if(devset.devsetpageindex==8){
                    switch(trgop){
                       case "W1":
                           addr1=String(w_mouthaddr);
                           addr2=String(w_mouthaddr+1);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "W2":
                           addr1=String(w_mouthaddr+2);
                           addr2=String(w_mouthaddr+3);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "W3":
                           addr1=String(w_mouthaddr+4);
                           addr2=String(w_mouthaddr+5);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "W4":
                           addr1=String(w_mouthaddr+6);
                           addr2=String(w_mouthaddr+7);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "W5":
                           addr1=String(w_mouthaddr+8);
                           addr2=String(w_mouthaddr+9);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "W6":
                           addr1=String(w_mouthaddr+10);
                           addr2=String(w_mouthaddr+11);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "W7":
                           addr1=String(w_mouthaddr+12);
                           addr2=String(w_mouthaddr+13);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "W8":
                           addr1=String(w_manspeed);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "W9":
                           addr1=String(w_manspeed+1);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "W10":
                           addr1=String(w_manspeed+2);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "W11":
                           addr1=String(w_manspeed+3);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "W12":
                           addr1=String(w_manspeed+4);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "W13":
                           addr1=String(w_manspeed+5);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "W14":
                           addr1=String(w_manspeed+6);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "W15":
                           addr1=String(w_manspeed+7);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       default:break;
                    }
                    screen.state="STRGPACK_PROCESSING";
                    devset.devset_4.strgcmdindex=15;
                }
                else if(devset.devsetpageindex==9){
                    switch(trgop){
                       case "C1":
                           addr1=String(c_nopass);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "C2":
                           addr1=String(c_nopass+4);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "C3":
                           addr1=String(c_nopass+6);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "C4":
                           addr1=String(c_nopass+18);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
    //                   case "C5":
    //                       addr1=String(c_nopasstime+2);
    //                       datprocess.fillsend16buf("WDD",addr1,tmp1);
    //                       break;
    //                   case "C6":
    //                       addr1=String(c_nopasstime);
    //                       datprocess.fillsend16buf("WDD",addr1,tmp1);
    //                       break;
    //                   case "C7":
    //                       addr1=String(c_nopasstime+1);
    //                       datprocess.fillsend16buf("WDD",addr1,tmp1);
    //                       break;
    //                   case "C8":
    //                       addr1=String(c_nopasstime+9);
    //                       datprocess.fillsend16buf("WDD",addr1,tmp1);
    //                       break;
    //                   case "C9":
    //                       addr1=String(c_nopass+1);
    //                       datprocess.fillsend16buf("WDD",addr1,tmp1);
    //                       break;
                       case "C10":
                           addr1=String(c_nopass+2);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "C11":
                           addr1=String(c_nopass+5);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "C12":
                           addr1=String(c_nopass+7);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
    //                   case "C13":
    //                       addr1=String(c_backforth1+2);
    //                       datprocess.fillsend16buf("WDD",addr1,tmp1);
    //                       break;
    //                   case "C14":
    //                       addr1=String(c_backforth1);
    //                       datprocess.fillsend16buf("WDD",addr1,tmp1);
    //                       break;
    //                   case "C15":
    //                       addr1=String(c_nopasstime+3);
    //                       datprocess.fillsend16buf("WDD",addr1,tmp1);
    //                       break;
                       case "C16":
                           addr1=String(c_nopass+70);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "P1":
                           addr1=String(c_nopass+188);
                           addr2=String(c_nopass+189);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "P2":
                           addr1=String(c_nopass+74);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "P3":
                           addr1=String(c_nopass+198);
                           addr2=String(c_nopass+199);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "P4":
                           addr1=String(c_nopass+75);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "P5":
                           addr1=String(c_nopass+168);
                           addr2=String(c_nopass+169);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "P6":
                           addr1=String(c_nopass+39);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "P7":
                           addr1=String(c_nopass+196);
                           addr2=String(c_nopass+197);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "P8":
                           addr1=String(c_nopass+38);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "P9":
                           addr1=String(c_nopass+190);
                           addr2=String(c_nopass+191);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "P10":
                           addr1=String(c_nopass+164);
                           addr2=String(c_nopass+165);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "P11":
                           addr1=String(c_nopass+192);
                           addr2=String(c_nopass+193);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "P12":
                           addr1=String(c_nopass+166);
                           addr2=String(c_nopass+167);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "P13":
                           addr1=String(c_nopass+194);
                           addr2=String(c_nopass+195);
                           datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                           break;
                       case "P14":
                           addr1=String(c_nopass+3);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "P15":
                           addr1=String(c_nopass+72);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
    //                   case "P16":
    //                       addr1=String(c_nopasstime+4);
    //                       datprocess.fillsend16buf("WDD",addr1,tmp1);
    //                       break;
                       case "TS1":
                           addr1=String(c_nopass+9);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "TS2":
                           addr1=String(c_nopass+8);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "TS3":
                           addr1=String(c_nopass+16);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "TS4":
                           addr1=String(c_nopass+14);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "TS5":
                           addr1=String(c_nopass+15);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "TS6":
                           addr1=String(c_nopass+11);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "TS7":
                           addr1=String(c_nopass+10);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "TS8":
                           addr1=String(c_nopass+13);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
    //                   case "TS9":
    //                       addr1=String(c_nopasstime-2);
    //                       datprocess.fillsend16buf("WDD",addr1,tmp1);
    //                       break;
                       case "TS10":
                           addr1=String(c_nopass+12);
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       default:break;
                    }
                    screen.state="STRGPACK_PROCESSING";
                    devset.devset_4.strgcmdindex=15;
                }
                else if(devset.devsetpageindex==10){
               switch(trgop){
                case "A1":
                    addr1=String(c_nopass+40);
                    addr2=String(c_nopass+41);
                    datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                    break;
                case "A2":
                    addr1=String(c_nopass+42);
                    addr2=String(c_nopass+43);
                    datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                    break;
                case "A3":
                    addr1=String(c_nopass+44);
                    addr2=String(c_nopass+45);
                    datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                    break;
                case "A4":
                    addr1=String(c_nopass+46);
                    addr2=String(c_nopass+47);
                    datprocess.fillsend32buf("WDD",addr1,addr2,tmp1,tmp2);
                    break;
                default:break;
               }
            }
            }
            else if(screen.pageindex==4){
                if(monitorroot.tabcIndex==2){
                    switch(trgop){
                       case "R1":
                           addr1="30017";
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "R2":
                           addr1="30063";
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "R3":
                           addr1="30064";
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "R4":
                           addr1="30065";
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "R5":
                           addr1="30066";
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       case "R6":
                           addr1="30067";
                           datprocess.fillsend16buf("WDD",addr1,tmp1);
                           break;
                       default:break;
                }
                    screen.state="STRGPACK_PROCESSING";
            }
            //       devset.devmenuy=60;
            }
        }
        onRejected: ;//devset.devmenuy=60;
    }
    Popup {
        id: popup
        width: 400; height: 200
        x: 312; y:300
        //anchors.centerIn: parent  // 注意：使用位移动画不能用anchors定位方式
        z: 101
        opacity: 1
        visible: false;
        radius: 5
  //      showMask: fasle;
        animationType: "fade";
        //
        property alias popuptext: ptext.text
        Text{
            id:ptext
            width: 340
            height: 100
            text: 'this is popop'
            color:"red"
            font.pointSize: 16
            wrapMode: Text.Wrap
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.left: parent.left
            anchors.leftMargin: 30
        }
        Buttoncust {
            id:btnClose
            width: 100; height: 50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 20
            label: "取消"
            labelSize: 20
            radius: 5
            gradient: Gradient {
                GradientStop { position: 0.0; color: "plum" }
                GradientStop { position: 1.0; color: "#136F6F6F" }
            }
            onButtonClick: {
                parent.hide();
            }
        }
        Buttoncust {
            id:btnConfirm
            width: 100; height: 50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            anchors.left: parent.left
            anchors.leftMargin: 20
            label: "确认"
            labelSize: 20
            radius: 5
            gradient: Gradient {
                GradientStop { position: 0.0; color: "plum" }
                GradientStop { position: 1.0; color: "#136F6F6F" }
            }
            onButtonClick: {
                if(devset.devsetpageindex===11){
                    datprocess.SendBuf="WCSL003A0";
                    screen.state="STRGPACK_PROCESSING";
                }
                parent.hide();
            }
        }
    }
    Buttoncust{
          id: homebutton
          buttonHeight:60; buttonWidth: 60
          anchors.right: parent.right;anchors.rightMargin: 120
          buttonColor:"transparent"
          Image {
              id: homeIcon
              source: "ptsrc/home_48.png"
              width:sourceSize.width;height: sourceSize.width
              anchors.centerIn: parent
              fillMode: Image.PreserveAspectCrop
             // rotation:90
              z:100
              Behavior { NumberAnimation { property: "rotation"; easing.type: Easing.OutExpo } }
          }
              onButtonClick:{
                   ctlmenuroot.visible=true;
                   manulroot.visible=false;
                   autopage.visible=false;
                   devsetpage.visible=false;
                   monitorpage.visible=false;
                   warncheckpage.visible=false;
                   helpfilepage.visible=false;
                   semiauto.visible=false;
              }
      }
}

