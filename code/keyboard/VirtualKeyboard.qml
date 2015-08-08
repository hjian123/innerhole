import QtQuick 2.3
import Pinyin 1.0
import "eventOperate"
import "eventOperate/buttonOps.js" as ButOps
import "eventOperate/eventOps.js" as EventOps
import QtQuick.Layouts 1.1

Rectangle {
    id: vk
    z:100
    property alias text: textEdit.editxt
    property Item editor: textEdit.txtEditor
    property var obj

    signal accepted(var textValue,string trgop)
    signal rejected()

    signal buttonPressed(string op)
    signal viewPressed(string txt)

    property int editorValue
    property string trgop: " "  //保存界面中触发virtualkeyboad的按钮返回的op值，用于设定对应的参数值
    property string leftArrow: "退 格"    //"\u2190"
    property string upperArrow: "\u2191"
    property string cancle : "取\n消"   //"\u00d7"
    property string accept : "确\n认" //"\u221a"
    property string space : "\u0020"
    property string pyin : "\u62FC\u97F3"
    property string zimu : "\u5B57\u6BCD"
    property string zifu : "\u5B57\u7B26"
    property alias vboardtitle: title.text

    property bool   bLower : false
    property bool   bChar : false
    property bool   bNum : true
    property bool checkoutFlag: false

    property bool bPasswd: false       //true时键盘当作密码使用，否则只作为设定值输入
    property string passwdtext: "1234" //密码
    property bool passwdright: true   //密码正确

    property real   layWidth: 80 // parent.width/11
    property real   layHeight: 80 //parent.height/12
    property real   viewHeight:parent.height/14
    property real   fontHeight:10
  //  property real   fontWidth: lineEdit.text.length*parent.width/25

    property int  getValue
    property Item   surface: parent
    //property Item   view: lnView

   // signal sendBtClicked(var textValue)

    anchors {left: parent.left;bottom: parent.bottom}//right: parent.right;
    width: 370;height:470
    radius: 6
    color: "#3E606F"
    //state: "inactive";

  //  JyIME_PinYin{id:pinyin;text:""}
      Text{
          anchors.bottom: textrect.top
          anchors.bottomMargin: 10
          id: title;width:parent.width;height:30;
          text:bPasswd ? "请输入密码":"请输入设定值";
          font.pointSize: 24;color:"black"
          horizontalAlignment: Text.AlignLeft;
      }

      Rectangle{
          id:textrect
        anchors.bottom: spacerec.top
        anchors.bottomMargin: -fontHeight
        width: parent.width;height:viewHeight
        TextEditor{
            id:textEdit;
            width: vk.width; height: viewHeight
      //      onKeyPressed: EventOps.eventOper(key,mod)
    //        Component.onCompleted: sendBtClicked.connect(accepted);
       //     editxt:"1234"
            txtEdechoMode: bPasswd ? TextInput.Password :TextInput.Normal;
         //   txtEdMask: bPasswd ? "0000" : ""
         //   txtEdvalidator: bPasswd ? IntValidator{top:9999;bottom:0000}
           }
        }
           Rectangle{
                  id:spacerec
                  color:"transparent"
                  height: 1.5*fontHeight; width:parent.height;
                  anchors {
                      horizontalCenter: parent.horizontalCenter;margins: 4
                      bottom: eightBt.top
                      bottomMargin: fontHeight
                  }
              }
            Keybutton {
                id:sevenBt
                 anchors{left:zeroBt.left;bottom: fourBt.top;bottomMargin: 10}
                width:layWidth;height:layHeight;text: "7"; op: "7";
                Component.onCompleted: clicked.connect(buttonPressed)
            }
            Keybutton {
                id:fourBt
                 anchors{left:zeroBt.left;bottom: oneBt.top;bottomMargin: 10}
                width:layWidth;height:layHeight;text: "4"; op: "4";
                Component.onCompleted: clicked.connect(buttonPressed)
            }
            Keybutton {
                id:oneBt
                 anchors{left:zeroBt.left;bottom: zeroBt.top;bottomMargin: 10}
                width:layWidth;height:layHeight;text: "1"; op: "1";
                Component.onCompleted: clicked.connect(buttonPressed)
            }
            Keybutton {
                id:eightBt
                anchors{left:backBt.left;bottom: sevenBt.bottom;}
                width:layWidth;height:layHeight;text: "8"; op: "8";
                Component.onCompleted: clicked.connect(buttonPressed)
            }
            Keybutton {
                id:fiveBt
               anchors{left:backBt.left;bottom: fourBt.bottom;}
                width:layWidth;height:layHeight;text: "5"; op: "5";
                Component.onCompleted: clicked.connect(buttonPressed)
            }
            Keybutton {
                id:twoBt
                width:layWidth;height:layHeight;text: "2"; op: "2";
                Component.onCompleted: clicked.connect(buttonPressed)
                anchors{left:backBt.left;bottom: oneBt.bottom;}
            }
            Keybutton {
                id:nineBt
                width:layWidth;height:layHeight;text: "9"; op: "9";
                anchors{right:backBt.right;bottom: eightBt.bottom;}
                Component.onCompleted: clicked.connect(buttonPressed)
            }
            Keybutton {
                id:sixBt
                width:layWidth;height:layHeight;text: "6"; op: "6";
                anchors{right:backBt.right;bottom: fiveBt.bottom;}
                Component.onCompleted: clicked.connect(buttonPressed)
            }
            Keybutton {
                id:threeBt
                width:layWidth;height:layHeight;text: "3"; op: "3";
                anchors{right:backBt.right;bottom: twoBt.bottom;}
                Component.onCompleted: clicked.connect(buttonPressed)
            }
            Keybutton{
                    id:sendBt;width:80;height:170;
                    text:accept;op:accept;
                   anchors.right: abortBt.right
                   anchors.top: nineBt.top
          //         anchors.topMargin: : 180
                    onClicked: {     
                     // console.log(editortext,textEdit.txtEditor.text);
                        if(!bPasswd || checkPasswd() ){
                            editorValue=parseInt(textEdit.txtEditor.text);
                //            console.log("sendBtOnClicked",editorValue,textEdit.txtEditor.text)
                            accepted(editorValue,trgop);
//                            if(bPasswd){
//                                console.log("checkoutFlag to true!!!");
//                                checkoutFlag=true;
//                                bPasswd=false;
//                            }
                        }
                    }
            }
            Keybutton {
                id:zeroBt
                width:layWidth;height:layHeight;text: "0"; op: "0";
                anchors.bottom: parent.bottom
                anchors.bottomMargin: fontHeight
                anchors.left: parent.left
                anchors.leftMargin: 10
                Component.onCompleted: clicked.connect(buttonPressed);
            }
            Keybutton {
                id:backBt
                width:170;height:80;
                anchors.bottom: parent.bottom
                anchors.bottomMargin: fontHeight
                anchors.right: abortBt.left
                anchors.rightMargin: 10
                text: leftArrow; op: leftArrow;
                Component.onCompleted: clicked.connect(buttonPressed)
            }
            Keybutton{
                id:abortBt;width:80;height:170;
                text:cancle;op:cancle;
                anchors.bottom: parent.bottom
                anchors.bottomMargin: fontHeight
                anchors.right: parent.right
                anchors.rightMargin: 10
                Component.onCompleted: clicked.connect(rejected)
                onClicked:{
                    virtualboard.visible=false;
                    passwdright=true;
                    bPasswd=false;
                }
            }
    transitions: Transition {
        NumberAnimation {
            target: vk
            property: "y"
            easing.type: "OutQuad"
            duration: 300
        }
    }
    function checkPasswd(){
        console.log(passwdtext,textEdit.txtEditor.text);
        if(passwdtext===textEdit.txtEditor.text){
            passwdright=true;
            checkoutFlag=true;
            bPasswd=false;
            console.log("passwd is right!!!",bPasswd);
            return true;
        }
        else{
            title.text="密码错误，请重新输入！";
            passwdright=false;
            return false;
        }
    }
//    MouseArea{
//        anchors.fill: parent;
//        onPressed:{
//             mouse.accepted = true
//        }
//        drag.target: vk  // root可拖动
//    }
//    Mask{
//        id: mask
//        z:10
//        visible: vk.visible
//    }
 //   Keys.onPressed: {EventOps.eventOper(event.key,0)}
    onButtonPressed: {
        if(!passwdright){
            passwdright=true;
            title.text="请输入密码！";
            textEdit.txtEditor.text="";
        }
        ButOps.buttonOper(op)
    }
    onViewPressed: {ButOps.viewOper(txt)}
}
