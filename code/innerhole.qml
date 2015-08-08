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
* Description :开机第一个界面，点击button可进入操作界面，实现过程根据Item的visible属性切换界面
****************************************************************************/

import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import an.qt.Serial 1.0
ApplicationWindow {
//    id: window
//    width: 1024; height: 600
    width: 1024
    height: 600
    visible: true

    Rectangle{
       id: screen
       color: "#6C646A"
         gradient: Gradient {
             GradientStop { position: 0.0; color: "#6C646A" }
             GradientStop { position: 1.0; color: Qt.darker("#6A6D6A") }
         }
       anchors.fill: parent
       state: "CMD_SENDING"
       property int pageindex: 0 //界面编号
       property int cmdnum: 0   //界面当中命令个数
       property int cmdnumtmp: 0   //界面当中命令个数
       property bool revready:false;
       onCmdnumChanged: {
           cmdnumtmp=cmdnum;
       }
        Serial{
            id:serial
          //  property bool revdatachangeflag:true;

            onRevdataChanged: {
           //    console.log("revdata: ",revdata);
                datprocess.checkPacket(revdata);
            //
           //     revdatachangeflag:true;
            }
        }
        Datprocess{
            id:datprocess
            onRevbufChanged: {
                screen.revready=true;
     //         console.log("RevBuf: ",RevBuf);
            }
            onSendbufChanged: {
                serial.writeData(makeDataPack());
            }
        }
        Timer{
           id:timer
           interval: 130;
           repeat: true;
           triggeredOnStart: true;
           running:true
           property int count: 0
           property int trigcount: 0 //发送警告查询命令的计时
           property int hourcount: 0 //历史告警信息保存的计时
           onTriggered: {
               hourcount++;
                if (screen.state == "STRGPACK_PROCESSING"){
                //   console.log("state:STRGPACK_PROCESSING");
                      strgprocesspack(screen.pageindex);
                      screen.state = "CMD_SENDING";
                    return;
               }
               else if(trigcount==2){
                   trigcount++;
                   datprocess.SendBuf="RCCL00300033";//发送警告查询命令
                   return;
               }
               else if(trigcount==3){
                   trigcount=0;
                   warnprocesspack();
                   return;
               }
               else{
                   if (screen.state == "CMD_SENDING"){
                       screen.state = "PACK_PROCESSING";
                       sentcmd(screen.pageindex,count);
                    //   console.log("state:CMD_SENDING");
                   }
                   else if (screen.state == "PACK_PROCESSING"){
                      //   console.log("state:PACK_PROCESSING");
                           processpack(screen.pageindex,count);
                           if(count>=screen.cmdnum){
                               screen.cmdnum = screen.cmdnumtmp;
                               count=0;
                           }
                           else count++;
                           screen.state = "CMD_SENDING";
                           trigcount++;
                       }

               }

           }
              function sentcmd(pageindex,count){
                            ctlmenu.setcmd(pageindex,count);
              }
              function processpack(pageindex,count){
                            ctlmenu.packprocess(pageindex,count);
              }
              function strgprocesspack(pageindex){
                            ctlmenu.strgpackprocess(pageindex);
              }
              function warnprocesspack(){
                  ctlmenu.warnprocesspack();
               //   console.log("warnprocesspack");
                  if(hourcount>=30000){
                //     console.log("savehistorywarn");//30000*0.13S计时到保存当前告警数据到历史告警
                     ctlmenu.savehistorywarn();
                      hourcount =0;
                  }
               }
        }
        Item{
                 id: login
                 visible: true
                 anchors.fill: parent
            Rootsheet{
                id: rootsheet
                anchors.fill: parent
                onRootsheetClick:{
                    login.visible=false
                    ctl.visible=true
                    screen.pageindex=0;
                    screen.cmdnum=5;
                    screen.cmdnumtmp=screen.cmdnum;
                    serial.updateSettings(0,0,3,1,0,0)
                    serial.openSerialPort();

                  //  datprocess.fillsendbuf("WDD0011000111",0x5566,0x0000);
                  //  datprocess.fillsendbuf("WDD00111",datprocess.cov0x2strings(0x0000));
                 //     datprocess.SendBuf="HELLO,QT";   //测试用
                 // datprocess.SendBuf="RDD0500005001";     //测试用
                }
            }
        }
        Item{
              id: ctl
              visible: false
              anchors.fill: parent
              Ctlmenu{
                  id: ctlmenu
                  anchors.fill: parent
              }
        }
        states: [
            State {
                name: "CMD_SENDING"
                PropertyChanges {
                }
            },
            State {
                name: "PACK_PROCESSING"
                PropertyChanges {
                }
            },
            State {
                name: "STRGPACK_PROCESSING"
                PropertyChanges {
                 }
            }
        ]

    }
}
