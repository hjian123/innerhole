import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

Rectangle {
    width: 1024;
    height: 500;
    color: "#6C646A"
     gradient: Gradient {
         GradientStop { position: 0.0; color: "#6C646A" }
         GradientStop { position: 1.0; color: Qt.darker("#6A6D6A") }
     }
    id:warnh
    property color currentcolor: "blue"
    property alias warnModel: listView.model
    property alias viewCount: listView.count
    property int x0Value: 0
    property int x1Value:  0
    property int x30Value:  0
    property int x40Value: 0
    property int y0Value: 0
    property int y1Value: 0
    property int y30Value: 0
    property int y40Value: 0
    property int curLocation1:0
    property int curLocation2:0
    property int curLocation3:0
    property int curLocation4:0

    property bool chaXinValue: false
    property bool fb180Value: false
    property bool upLoadValue: false
    property bool qgOrgValue: false


    property string curPosText1: "0.00"
    property string curPosText2: "0.00"
    property string curPosText3: "0.00"
    property string curPosText4: "0.00"

    Rectangle{
        width: parent.width*1/2-45;height:parent.height-50
        anchors.left: parent.left
        anchors.leftMargin: parent.width/16-18
        anchors.top:parent.top
        anchors.topMargin: 20
        color: "#6C646A"
        border.color: "black"
        border.width: 2
        radius: 5
        Component {
            id: phoneModel;
            ListModel {
                id:listModel
//                ListElement{
//                    contNumber1: "X000"
//                //    backcolor1:bcolor1             //ListElement属性赋值不允许使用脚本语言
//                    contText1: "自动常开";
//                    contNumber2: "X008"
//                    contText2: "门限开关";
//               //     backcolor2: bcolor2
//                }
                function backcolor1(index) {           //改用专门一个函数脚本进行赋值
                            backcolor1.text = [
                                x0Value & (1<<0),x0Value & (1<<1),x0Value & (1<<2),
                                x0Value & (1<<3),x0Value & (1<<4),x0Value & (1<<5),
                                x0Value & (1<<6),x0Value & (1<<7),
                                x1Value & (1<<0),x1Value & (1<<1),x1Value & (1<<2),
                                x1Value & (1<<3),x1Value & (1<<4),x1Value & (1<<5),
                                x1Value & (1<<6),x1Value & (1<<7),
                                x30Value & (1<<0),x30Value & (1<<1),x30Value & (1<<2),
                                x30Value & (1<<3),x30Value & (1<<4),x30Value & (1<<5),
                                x30Value & (1<<6),x30Value & (1<<7),
                                y0Value & (1<<0),y0Value & (1<<1),y0Value & (1<<2),
                                y0Value & (1<<3),y0Value & (1<<4),y0Value & (1<<5),
                                y0Value & (1<<6),
                                y1Value & (1<<0),y1Value & (1<<1),y1Value & (1<<2),
                                y1Value & (1<<3),y1Value & (1<<4),y1Value & (1<<5),
                                y1Value & (1<<6),
                                y30Value & (1<<0),y30Value & (1<<1),y30Value & (1<<2),
                                y30Value & (1<<3),y30Value & (1<<4),y30Value & (1<<5),
                                y30Value & (1<<6),y30Value & (1<<7)
                            ]

                        //console.log(index);
                       // console.log(backcolor1.text[index]);
                        return backcolor1.text[index];
                    }
                function backcolor2(index) {
                            backcolor2.text = [
                                x0Value & (1<<8),x0Value & (1<<9),x0Value & (1<<10),
                                x0Value & (1<<11),x0Value & (1<<12),x0Value & (1<<13),
                                x0Value & (1<<14),x0Value & (1<<15),
                                x1Value & (1<<8),x1Value & (1<<9),x1Value & (1<<10),
                                x1Value & (1<<11),x1Value & (1<<12),x1Value & (1<<13),
                                x1Value & (1<<14),x1Value & (1<<15),
                                x40Value & (1<<0),x40Value & (1<<1),x40Value & (1<<2),
                                x40Value & (1<<3),x40Value & (1<<4),x40Value & (1<<5),
                                x40Value & (1<<6),x40Value & (1<<7),
                                y0Value & (1<<7),y0Value & (1<<8),y0Value & (1<<9),
                                y0Value & (1<<10),y0Value & (1<<11),y0Value & (1<<12),
                                y0Value & (1<<13),
                                y1Value & (1<<7),y1Value & (1<<8),y1Value & (1<<9),
                                y1Value & (1<<10),y1Value & (1<<11),y1Value & (1<<12),
                                y1Value & (1<<13),
                                y40Value & (1<<0),y40Value & (1<<1),y40Value & (1<<2),
                                y40Value & (1<<3),y40Value & (1<<4),y40Value & (1<<5),
                                y40Value & (1<<6),y40Value & (1<<7),
                            ]
                      //  console.log(index);
                      // console.log(backcolor2.text[index]);
                        return backcolor2.text[index];
                    }
            }
        }

        Component {
            id: phoneDelegate;
            Item {
                id: wrapper;
                width: parent.width;
                height: 30;
                property bool bshowcolor1
                property bool bshowcolor2
                RowLayout {
                    anchors.left: parent.left;
                    anchors.verticalCenter: parent.verticalCenter;
                    spacing: 10;
                    Rectangle{
                        width:10;
                    }

                    Text {
                        id: number1;
                        text: contNumber1;
                        color: "black";
                        Layout.preferredWidth: 40;
                        font.pixelSize: 18;
                        Rectangle{
                            anchors.fill: parent
                            color: listView.model.backcolor1(index) ? "cyan":"gray";
                            opacity: 0.5
                            radius: 1
                           // onColorChanged: {console.log(color);}
                        }

                     //   Component.onCompleted: {console.log(z);}
                    }

                    Text {
                        text: contText1;
                        color: "black";
                        font.pixelSize: 18;
                        Layout.preferredWidth: 160;
                    }
                    Text {
                        id: number2;
                        text: contNumber2;
                        color: "black";
                        Layout.preferredWidth: 40;
                        font.pixelSize: 18;
                        Rectangle{
                            anchors.fill: parent
                            color:listView.model.backcolor2(index) ? "ryan":"gray";
                            opacity: 0.5
                            radius: 1
                        }

                     //   Component.onCompleted: {console.log(z);}
                    }

                    Text {
                        text: contText2;
                        color: "black";
                        font.pixelSize: 18;
                        Layout.preferredWidth: 120;
                    }
                }
            }
        }

        ListView {
            id: listView;

            anchors.fill: parent;
            delegate: phoneDelegate;
            model: phoneModel.createObject(listView);
            focus: true;
            clip: true

            FlickableScrollBar {
                target: listView
                orientation: Qt.Vertical
            }
        }

        Component.onCompleted: {
            console.log("add model!!");
            addOneWarn("X000","自动常开","X008","门限开关");  //0
            addOneWarn("X001","手动常闭","X009","主轴防撞保护");
            addOneWarn("X002","启动","X00A","系统压力检测");
            addOneWarn("X003","复位","X00B","磨削丝张紧保护");
            addOneWarn("X004","主轴横移原点","X00C","顶针到工作台原位");
            addOneWarn("X005","右旋转马达原位","X00D","顶针检测不到插芯");
            addOneWarn("X006","左旋转马达原位","X00E","顶针检测圆锥正确");
            addOneWarn("X007","磨削丝进给原位","X00F","顶针检测圆锥错误");

            addOneWarn("X010","工作台后退原位","X018","拉丝拉力感知");//8
            addOneWarn("X011","工作台前进伸出","X019","右旋转激光位参照");
            addOneWarn("X012","90°插芯到位检测","X01A","主轴横移后限位");
            addOneWarn("X013","工作台180°原位","X01B","主轴横移前限位");
            addOneWarn("X014","工作台180°动作位","X01C","上载插芯夹紧位");
            addOneWarn("X015","工作台90°原位","X01D","上载插芯张开位");
            addOneWarn("X016","工作台90°旋转位","X01E","下载插芯夹紧位");
            addOneWarn("X017","进丝推力感知","X01F","下载插芯张开位");

            addOneWarn("X300","主轴移动伺服错","X400","备");//16
            addOneWarn("X301","右旋转伺服错","X401","备");
            addOneWarn("X302","左旋转伺服错","X402","备");
            addOneWarn("X303","磨削丝进给错","X403","备");
            addOneWarn("X304","备","X404","备");
            addOneWarn("X305","备","X405","备");
            addOneWarn("X306","备","X406","备");
            addOneWarn("X307","备","X407","备");

            addOneWarn("Y000","主轴横移CW","Y007","磨削丝进给CCW");//24
            addOneWarn("Y001","主轴横移CCW","Y008","备用");
            addOneWarn("Y002","右转轮CW","Y009","系统气源供给");
            addOneWarn("Y003","右转轮CCW","Y00A","激光扫描打开");
            addOneWarn("Y004","左转轮CW","Y00B","热切加热打开");
            addOneWarn("Y005","左转轮CCW","Y00C","上料盘电机启动");
            addOneWarn("Y006","磨削丝进给CW","Y00D","高速主轴伺服ON");

            addOneWarn("Y010","吸嘴破空吹气","Y017","磨削丝修整");//31
            addOneWarn("Y011","主轴夹持插芯","Y018","上载插芯到主轴");
            addOneWarn("Y012","吸取磨削液","Y019","下载插芯到料盒");
            addOneWarn("Y013","断丝夹夹紧","Y01A","顶插芯到工作台");
            addOneWarn("Y014","导向嘴吹气","Y01B","工作台伸出");
            addOneWarn("Y015","磨削丝张力杆","Y01C","工作台180°旋转");
            addOneWarn("Y016","磨削丝顶高","Y01D","进料孔90°旋转");

            addOneWarn("Y300","主轴移动伺服ON","Y400","备");//38
            addOneWarn("Y301","右旋转伺服ON","Y401","备");
            addOneWarn("Y302","左旋转伺服ON","Y402","备");
            addOneWarn("Y303","磨削丝进给ON","Y403","备");
            addOneWarn("Y304","警报器","Y404","备");
            addOneWarn("Y305","运行绿灯","Y405","备");
            addOneWarn("Y306","待机黄灯","Y406","备");
            addOneWarn("Y307","报警红灯","Y407","备");


        }

        function addOneWarn(contNumber1,contText1,contNumber2,contText2){
            listView.model.append(
                        {
                            "contNumber1": contNumber1,
                            "contText1": contText1,
                            "contNumber2": contNumber2,
                            "contText2": contText2,
                        }
                    );
        }
   }
    Rectangle{
       width: parent.width*2/5+20;height:300
       anchors.right: parent.right
       anchors.rightMargin: parent.width/16-18
       anchors.top:parent.top
       anchors.topMargin: 20
       color: "#6C646A"
       border.color: "black"
       border.width: 2
       radius: 5
       Component {
           id: orgModel;
           ListModel {
               id:listModel
               ListElement{                  //ListElement没有id属性
                   listName: "左旋转"
               //    curPosText:"000.00"
                   unittext1: "度";
               //    curLocaText: "确认圆锥位"
               }
               ListElement{
                   listName: "主轴"
               //    curPosText:"0.00"
                   unittext1: "mm";
               //    curLocaText: "上载插芯位"
               }
               ListElement{
                   listName: "右旋转"
               //    curPosText:"0.00"
                   unittext1: "度";
               //    curLocaText: "激光扫描位"
               }
               ListElement{
                   listName: "进丝"
                //   curPosText:"0.00"
                   unittext1: "mm";
               //    curLocaText: "原点位"
               }
               function bState(index) {           //改用专门一个函数脚本进行赋值
                           bState.text = [
                               y0Value &(1<<5),
                               y0Value &(1<<1),
                               y0Value &(1<<3),
                               y0Value &(1<<7)
                           ]
                       return bState.text[index];
               }
               function curPosText(index) {           //改用专门一个函数脚本进行赋值
                           curPosText.text = [
                               curPosText1,
                               curPosText2,
                               curPosText3,
                               curPosText4
                           ]
                       return curPosText.text[index];
               }
               function curLocaText(index) {           //改用专门一个函数脚本进行赋值
                           curLocaText.text = [
                               getcurLocaText1(),
                               getcurLocaText2(),
                               getcurLocaText3(),
                               getcurLocaText4()
                           ]
                       return curLocaText.text[index];
               }
               function getcurLocaText1(){
                   var str;
                   switch(curLocation1&&0x000F){
                       case 0: str="原点位";break;
                       case 1: str="圆锥确认位"; break;
                       case 2: str="供给插芯位";break;
                       case 3: str="插芯OK位"; break;
                       case 4: str="插芯不接触";break;
                       case 5: str="插芯未通过"; break;
                       case 6: str="等待主轴位";break;
                       case 7: str="下载排出插芯"; break;
                       case 8: str="上载投入插芯"; break;
                       default:break;
                   }
                   return str;
             }
               function getcurLocaText2(){
                   var str;
                   switch(curLocation2&&0x000F){
                       case 0: str="后安全位";break;
                       case 1: str="上载插芯位"; break;
                       case 2: str="原点参照位";break;
                       case 3: str="加工等待位"; break;
                       case 4: str="加工磨削位";break;
                       case 5: str="挤压磨削液"; break;
                       default:break;
                   }
                   return str;
             }
               function getcurLocaText3(){
                   var str;
                   switch(curLocation3&&0x000F){
                       case 0: str="原点位";break;
                       case 1: str="激光扫描位";break;
                       case 2: str="磨削加工位";break;
                       case 3: str="切断丝位";break;
                       case 4: str="丝修磨位";break;
                       default:break;
                   }
                   return str;
             }
               function getcurLocaText4(){
                   var str;
                   switch(curLocation4&&0x000F){
                       case 0: str="丝嘴位置";break;
                       case 1: str="原点位"; break;
                       case 2: str="磨削液位置";break;
                       case 3: str="开始插入位"; break;
                       case 4: str="修磨开始位";break;
                       case 5: str="修磨结束位"; break;
                       case 6: str="切断丝位置";break;
                       default:break;
                   }
                   return str;
             }
           }
       }
       Component {
           id: headerView;
           Item {
               width: parent.width;
               height: 30;
               RowLayout {
                   anchors.left: parent.left;
                   anchors.verticalCenter: parent.verticalCenter;
                   spacing: 15;
                   Rectangle{
                       width:10;
                   }
                   Text {
                       text: "";
                       font.bold: true;
                       font.pixelSize: 20;
                       Layout.preferredWidth: 50;
                   }

                   Text {
                       text: "当前位置";
                       font.bold: true;
                       font.pixelSize: 20;
                       Layout.preferredWidth: 100;
                   }

                   Text {
                       text: "当前定位点";
                       font.bold: true;
                       font.pixelSize: 20;
                       Layout.preferredWidth: 110;
                   }
                   Text {
                       text: "状态";
                       font.bold: true;
                       font.pixelSize: 20;
                       Layout.preferredWidth: 50;
                   }
               }
           }
       }

       Component {
           id: orgDelegate;
           Item {
               id: wrapper;
               width: parent.width;
               height: 30;
               RowLayout {
                   anchors.left: parent.left;
                   anchors.verticalCenter: parent.verticalCenter;
                   spacing: 15;
                   Rectangle{
                       width:10;
                   }
                   Text {
                       id: listname;
                       text: listName;
                       color: "black";
                       Layout.preferredWidth: 50;
                       font.pixelSize: 18;
                   }
                   Rectangle{
                       width:100;height: 30
                       color:"yellow"
                       border.color: "black"
                       border.width: 2
                       Text {
                           anchors.centerIn: parent
                           text: listView1.model.curPosText(index)+unittext1;
                           font.pixelSize: 18;
                       }
                   }

                   Rectangle {
                       id:curLocation
                       width: 110; height: 30
                       color:"plum"
                       radius: 3
                       border.color: "gray"
                       border.width: 2
                       Text {
                           anchors.centerIn: parent
                           text: listView1.model.curLocaText(index);
                           font.pixelSize: 18;
                       }

                   }
                   Rectangle{
                       width:50;height: 30
                       color:listView1.model.bState(index) ? "cyan":"lightgreen";
                       Text {
                           text: listView1.model.bState(index) ? "定位中":"";
                           font.pixelSize: 18;
                       }
                   }

               }
           }
       }

       ListView {
           id: listView1;
           width:parent.width;height:parent.height-70;
           anchors.top: parent.top;
           anchors.topMargin: 10;
           delegate: orgDelegate;
           header:headerView
           model: orgModel.createObject(listView1);
           focus: true;
           clip: true
           spacing: 20

   //        FlickableScrollBar {
   //            target: listView
   //            orientation: Qt.Vertical
   //        }
       }
       RowLayout {
           width: parent.width
           height:50
           anchors.left: parent.left;
           anchors.top:listView1.bottom
           spacing: 8;
           Rectangle{
               width:5;
           }
           Text {
               text: "气缸类";
               color: "black";
               Layout.preferredWidth: 50;
               font.pixelSize: 18;
           }
           Rectangle{
               width:50;height: 50
               color:qgOrgValue ? "cyan":"lightgreen"
               Text {
                   anchors.centerIn: parent
                   text: qgOrgValue ? "气缸\n原点":"";
                   font.pixelSize: 18;
               }
           }
           Rectangle{
               width:50;height: 50
               color:upLoadValue ? "cyan":"lightgreen"
               Text {
                   anchors.centerIn: parent
                   text:upLoadValue ? "上载\n夹子":"";
                   font.pixelSize: 18;
               }
           }
           Rectangle{
               width:50;height: 50
               color:chaXinValue ? "cyan":"lightgreen"
               Text {
                   anchors.centerIn: parent
                   text: chaXinValue ? "插芯\n顶针":"";
                   font.pixelSize: 18;
               }
           }
           Rectangle{
               width:50;height: 50
               color:fb180Value ? "cyan":"lightgreen"
               Text {
                   anchors.centerIn: parent
                   text: fb180Value ? "180°\n前后":"";
                   font.pixelSize: 18;
               }
           }
           Rectangle{
               width:50;height: 50
               color:"cyan"
               Text {
                   anchors.centerIn: parent
                   text: (y1Value & (1<<12)) ? "":"180°\n旋转";
                   font.pixelSize: 18;
               }
           }
           Rectangle{
               width:50;height: 50
               color:"cyan"
               Text {
                   anchors.centerIn: parent
                   text: (y1Value & (1<<13)) ? "":"90°\n旋转";
                   font.pixelSize: 18;
               }
           }
       }

   }
//    Buttoncust{                           //测试用的按钮
//        id:reloadBt
//        width: 100; height: 60
//        anchors.bottom: parent.bottom
//        anchors.bottomMargin: 10
//        anchors.right: parent.right
//        anchors.rightMargin: 80
//        label: "test"
//        labelSize: 18
//        radius: 5
//             gradient: Gradient {
//                 GradientStop { position: 0.0; color: "plum" }
//                 GradientStop { position: 1.0; color: "#136F6F6F" }
//             }
//        onButtonClick: {
//            x0Value=x0Value+100;
//            y0Value=0xFFFF;
//            y1Value=0xFFFF;
////          //  console.log("tmp=",tmp);
////            if(tmp===0){
////            bcolor1="red";
////            tmp++;
////          //      console.log(bcolor1);
////            }
////            else{
////                bcolor1="green";
////                tmp=0;
////          //      console.log(bcolor1);
////            }
////         //   console.log("click");
//        }
//    }
}
