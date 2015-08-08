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
    id:root
    clip:true

    signal clear(int index,bool value)
    signal setBtClicked(int index)
    property color currentcolor: "blue"
    property alias warnModel: listView.model
    property alias viewCount: listView.count

    property string currentText1 :"1" //当前值显示
    property string currentText2  :"12"
    property string currentText3  :"123"
    property string currentText4 :"1234"
    property string currentText5 :"12345"
    property string currentText6 :"123456"

    property string setText1  :"6" //设定值显示
    property string setText2 :"65"
    property string setText3 :"654"
    property string setText4 :"6543"
    property string setText5 :"65432"
    property string setText6 :"654321"

    property int setZero: 0     //清零对应位的状态

    property alias year1 : verRect.tyear1
    property alias year2 : verRect.tyear2
    property alias month1 : verRect.tmonth1
    property alias month2 : verRect.tmonth2
    property alias day1 : verRect.tday1
    property alias day2 : verRect.tday2



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
            id: showModel;
            ListModel {
                id:listModel
                ListElement{
                    listname: "总产量"
//                    currentText:"00000"
//                    setText:"00000"
                }
                ListElement{
                    listname: "OK产量"
                 //   currentText:"00000"
                 //   setText:"00000"
                }
                ListElement{
                    listname: "未接触数"
                //    currentText:"00000"
                //    setText:"00000"
                }
                ListElement{
                    listname: "未通过数"
                //    currentText:"00000"
                //    setText:"00000"
                }
                ListElement{
                    listname: "电热切刀"
                //    currentText:"00000"
                //    setText:"00000"
                }
                ListElement{
                    listname: "修整工具"
               //     currentText:"00000"
               //     setText:"00000"
                }

                function sText(index) {
                            sText.text = [
                               setText1,
                               setText2,
                               setText3,
                               setText4,
                               setText5,
                               setText6
                 //               "1","2","3","4","5",setText1
                            ]
                    console.log("sText",index,sText.text[index]);
                        return sText.text[index];
                }
                function cText(index) {         //改用专门一个函数脚本进行赋值
                            cText.text = [
                               currentText1,
                               currentText2,
                               currentText3,
                               currentText4,
                               currentText5,
                               currentText6
                            ]
                    console.log("cText",index,cText.text[index]);
                        return cText.text[index];
                }
                function bsetZero(index) {
                            bsetZero.text = [
                               setZero & (1<<10),
                               setZero & (1<<5),
                               setZero & (1<<6),
                               setZero & (1<<7),
                               setZero & (1<<8),
                               setZero & (1<<9)
                            ]
                    console.log("bsetZero",bsetZero.text[index]);
                        return bsetZero.text[index];
                }
            }
        }

        Component {
            id: showDelegate;
            Item {
                id: wrapper;
                width: parent.width;
                height: 50;
                RowLayout {
                    anchors.left: parent.left;anchors.leftMargin: 20
                    anchors.verticalCenter: parent.verticalCenter;
                    spacing: 15;
                    Text {
                        id: listNameText;
                        text: listname;
                        color: "black";
                        Layout.preferredWidth: 80;
                        font.pixelSize: 22
                    }
                    Rectangle{
                        width:100;height:40
                        color: "black";
                        border.color: "white"
                        border.width: 1
                        Text {
                            text: listView.model.cText(index);   //listView.model.currentText(index);
                            color: "yellow";
                            font.pixelSize: 22;
                            anchors.centerIn: parent
                        }
                        Layout.preferredWidth: 100;
                    }
                    Rectangle{
                        width:100;height:40
                        color: "black";
                        border.color: "gray"
                        border.width: 1
                        Text {
                            text: listView.model.sText(index);
                            color: "red";
                            font.pixelSize: 22;
                            anchors.centerIn: parent
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: setBtClicked(index);
                        }
                        Layout.preferredWidth: 100;
                    }

                    Buttoncust {
                        id:setZeroBt              //清零按钮
                        width: 100; height: 40
                        label: "清 零"
                        labelColor:"black"
                        labelSize: 22
                        radius: 5
                        color:listView.model.bsetZero(index) ? "lightgreen" :"cyan"
                        onButtonClick: {
                              clear(index,listView.model.bsetZero(index));
                        }
                    }
                }
            }
        }
        Component {
            id: showheader;
            Item {
                width: parent.width;
                height: 30;
                RowLayout {
                    anchors.left: parent.left;anchors.leftMargin: 20
                    anchors.verticalCenter: parent.verticalCenter;
                    spacing: 15;
                    Text {
                        text: "";
                        font.bold: true;
                        font.pixelSize: 22;
                        Layout.preferredWidth: 80;
                    }

                    Text {
                        text: " 当前值";
                        font.bold: true;
                        font.pixelSize: 22;
                        Layout.preferredWidth: 100;
                    }

                    Text {
                        text: " 设定值";
                        font.bold: true;
                        font.pixelSize: 22;
                        Layout.preferredWidth: 100;
                    }
                }
            }
        }

        ListView {
            id: listView;

            anchors.fill: parent;
            delegate: showDelegate;
            header: showheader
            model: showModel.createObject(listView);
            focus: true;
            clip: true
            spacing: 20
        }
   }
   Rectangle{
       id:verRect
       width: parent.width*2/5+20;height:300
       anchors.right: parent.right
       anchors.rightMargin: parent.width/16-18
       anchors.top:parent.top
       anchors.topMargin: 20
       color: "#6C646A"
       border.color: "black"
       border.width: 2
       radius: 5
       property string tyear1 : "15" //设定值显示
       property string tyear2 : "15"
       property string tmonth1 : "01"
       property string tmonth2 : "02"
       property string tday1 : "23"
       property string tday2 : "24"
       Component {
           id: versionModel;
           ListModel {
               id:listModel
               ListElement{
                   nameText1: "PLC程序版本："
                   versionText:"ID141-PRG001-1A"
                   nameText2: "最后修改时间："
//                   year: "2015"
//                   month: "07";
//                   day:"01"
               }
               ListElement{
                   nameText1: "LCD程序版本："
                   versionText:"ID141-SCN001-1A"
                   nameText2: "最后修改时间："
//                   year: "2015"
//                   month: "07";
//                   day:"01"
               }
               function year(index) {           //改用专门一个函数脚本进行赋值
                           year.text = [
                               verRect.tyear1,
                              verRect.tyear2
//                               "12",
//                               "34"
                           ]
                   console.log("year",index,year.text[index]);
                       return year.text[index];
               }
               function month(index) {           //改用专门一个函数脚本进行赋值
                           month.text = [
                              verRect.tmonth1,
                              verRect.tmonth2
//                               "12",
//                               "34"
                           ]
                   console.log("month",index,month.text[index]);
                       return month.text[index];
               }
               function day(index) {           //改用专门一个函数脚本进行赋值
                           day.text = [
                              verRect.tday1,
                              verRect.tday2
                           ]
                   console.log("day",index,day.text[index]);
                       return day.text[index];
               }
           }
       }

       Component {
           id: versionDelegate;
           Item {
               id: wrapper1;
               width: parent.width;
               height: 30;
               Text {
                   id:text1
                   text: nameText1;
                   anchors{
                       left:parent.left;leftMargin: 20
                       top:parent.top;topMargin: 15
                   }
                   color: "black";
                   font.pixelSize: 22;
               }
               Text {
                   id: verText;
                   anchors{
                       left:text1.right;leftMargin: 5
                       top:text1.top;
                   }
                   text: versionText;
                   color: "black";
                   font.pixelSize: 22;
               }
               Text {
                   id: text2;
                   anchors{
                       left:text1.left;
                       top:text1.bottom;topMargin: 18
                   }
                   text: nameText2;
                   color: "black";
                   font.pixelSize:22
               }
               Rectangle{
                   color:"lightgreen"
                   width:50;height:25
                   id:yearRect
                   anchors{
                       left:text2.right;leftMargin: 5
                       top:text2.top;topMargin: -5
                   }
                   Text{
                       anchors.centerIn: parent
                       text:listView1.model.year(index);
                       font.pixelSize:20
                   }
               }
               Text {
                   id: text3;
                   anchors{
                       left:yearRect.right;leftMargin: 5
                       top:text2.top
                   }
                   text: "年";
                   color: "black";
                   font.pixelSize: 22
               }
               Rectangle{
                   color:"lightgreen"
                   width:25;height:25
                   id:monthRect
                   anchors{
                       left:text3.right;leftMargin: 5
                       top:yearRect.top
                   }
                   Text{
                       anchors.centerIn: parent
                       text:listView1.model.month(index);
                       font.pixelSize:20
                   }
               }
               Text {
                   id: text4;
                   anchors{
                       left:monthRect.right;leftMargin: 5
                       top:text2.top
                   }
                   text: "月";
                   color: "black";
                   font.pixelSize: 22;
               }
               Rectangle{
                   color:"lightgreen"
                   width:25;height:25
                   id:dayRect
                   anchors{
                       left:text4.right;leftMargin: 5
                       top:yearRect.top
                   }
                   Text{
                       anchors.centerIn: parent
                       text: listView1.model.day(index);
                       font.pixelSize:20
                   }
               }
               Text {
                   id: text5;
                   anchors{
                       left:dayRect.right;leftMargin: 5
                       top:text2.top
                   }
                   text: "日";
                   color: "black";
                   font.pixelSize: 22;
               }

           }
       }

       ListView {
           id: listView1;
           width:parent.width;height:parent.height-70;
           anchors.top: parent.top;
           anchors.topMargin: 10;
           delegate: versionDelegate;
           model: versionModel.createObject(listView1);
           focus: true;
           clip: true
           spacing: 50
       }
       RowLayout{
           anchors.left:parent.left;anchors.leftMargin: 20
           anchors.bottom: parent.bottom
           anchors.bottomMargin: 20
           spacing: 10
           clip:true
           Image {
               width: 100; height: 100
             //  fillMode:Image.Stretch
               source: "ptsrc/tanhao.png"
           }
           Text {
               text: "本机内所有技术文件属于本公司所有，\n未经许可，请勿将本机的PLC及人机画\n面的源程序数据复制、引用或用于其\n他商业活动";
               color: "black";
               font.pixelSize: 22
           }
       }
   }
       Buttoncust{                           //测试用的按钮
           id:reloadBt
           width: 100; height: 60
           anchors.bottom: parent.bottom
           anchors.bottomMargin: 10
           anchors.right: parent.right
           anchors.rightMargin: 80
           label: "test"
           labelSize: 18
           radius: 5
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "plum" }
                    GradientStop { position: 1.0; color: "#136F6F6F" }
                }
           onButtonClick: {
               setZero=setZero+100;
               verRect.tyear1++;
               verRect.tmonth1++;
              console.log("click");
           }
       }

}
