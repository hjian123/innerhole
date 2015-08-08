import QtQuick 2.3
import QtQuick.Controls 1.2

Rectangle {
    id:tEdit

    property alias editxt : txtEdit.text
    property alias pos : txtEdit.cursorPosition

    property Item txtEditor: txtEdit
    property alias txtEdechoMode: txtEdit.echoMode
    property alias txtEdMask: txtEdit.inputMask
  //  property alias txtEdlength: txtEdit.maximumLength
    property alias txtEdvalidator: txtEdit.validator

  //  property var textValue
    property real mainHit: parent.height
    property real mainWid: parent.width

    signal keyPressed(int key,int mod)


    width: parent.width; height:parent.height
    color: "#eee";radius:5    

    TextInput{
        id: txtEdit
        wrapMode:TextEdit.Wrap; selectByMouse:true
        anchors{
            bottom: parent.bottom;bottomMargin: 3;
            top:parent.top;topMargin: 3;
            right:parent.right;rightMargin: 3;
            left:parent.left;leftMargin: 3}
        horizontalAlignment: Qt.AlignLeft

        font{family: "Helvetica";pointSize: Math.max(mainWid > mainHit ? mainHit * .5 : mainWid * .6,1)}
        onFocusChanged: {activeFocus?virtualboard.visible=true:virtualboard.visible=false}
//        Keys.onPressed :{
//            event.accepted = true; //截获键盘事件
//            if(event.modifiers & Qt.ControlModifier)
//                tEdit.keyPressed(event.key,1);
//            else
//                tEdit.keyPressed(event.key,0);
//        }
    }
//    Keybutton{
//        id:sendBt
//        anchors.right: parent.right
//        anchors.bottom: parent.bottom
//        width: layWidth;height: viewHeight;
//        text:accept;op:accept;
//        onClicked: {
//            textValue=parseInt(editxt);
//            tEdit.sendBtClicked(textValue);
//        }
//    }
//    Keybutton{
//        id:abortBt
//        anchors.right: sendBt.left
//        anchors.bottom: parent.bottom
//        width: layWidth;height: viewHeight;
//        text:cancle;op:cancle;
//        Component.onCompleted: clicked.connect(rejected)
//        onClicked: virtualboard.visible=false
//    }
}
