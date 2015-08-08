
import QtQuick 2.4
//import QtQml.Models 2.1
//import QtQuick.Controls 1.3
//import an.qt.Comboxcust 1.0
Rectangle {
    id: devsetlearn
    width: 1024; height: 540

//    color: "transparent"
    color: "#6C646A"
    signal datacfmClick();
    signal datasetClick();
    signal comboxcurindexChange();

    signal bkorgClick();
    signal targetpstClick();
    signal addClick();
    signal minusClick();
    property alias comboxindex: combox.currentIndex
    //property alias comboxmodel: ""
    property bool datacofen: true
    property bool datacofirm: true
    property bool adjen: true
    property bool targetpst: true
    property bool bkorg: true
    property bool add: true
    property bool minus: true
    property string presetvalue: "0"
    property string curvalue: "0"
    property string stepvalue: "0"
     gradient: Gradient {
         GradientStop { position: 0.0; color: "#6C646A" }
         GradientStop { position: 1.0; color: Qt.darker("#6A6D6A") }
     }
     Column {
         spacing: 30
         anchors.centerIn: parent
         Row {
             spacing: 150
             Text{
                 id: text1;width:50;height:20;text: qsTr("      当前值"); font.pointSize: 18
                 horizontalAlignment: Text.AlignHCenter
             }
             Text{
                 id: text2;width:50;height:20;text: qsTr("预设值"); font.pointSize: 18
                 horizontalAlignment: Text.AlignHCenter
             }
             Text{
                 id: text3;width:50;height:20;text: qsTr("步距值"); font.pointSize: 18
                 horizontalAlignment: Text.AlignHCenter
             }
     }
         Row {
             Labelcust1{
                 id:currentvalue;labelWidth: 100;labelHeight:  40;labeltext: curvalue;labelSize: 18
             }
             Text{
                 id: text4;width:50;height:20;text: qsTr("度"); font.pointSize: 18
                 horizontalAlignment: Text.AlignHCenter
             }
             Rectangle{
                 id:space
                 width: 40;height: parent.height
                 color: "transparent"
             }

             Labelcust1{
                 id:presetsvalue;labelWidth: 100;labelHeight:  40;labeltext: presetvalue;labelSize: 18
             }
             Text{
                 id: text5;width:50;height:20;text: qsTr("度"); font.pointSize: 18
                 horizontalAlignment: Text.AlignHCenter
             }
             Rectangle{
                 id:space1
                 width: 40;height: parent.height
                 color: "transparent"
             }
             Labelcust1{
                 id:stepv;labelWidth: 100;labelHeight:  40;labeltext: stepvalue;labelSize: 18
             }
             Text{
                 id: text6;width:50;height:20;text: qsTr("度"); font.pointSize: 18
                 horizontalAlignment: Text.AlignHCenter
             }
             Rectangle{
                 id:space2
                 width: 40;height: parent.height
                 color: "transparent"
             }
             Buttoncust {
                 id:dataconfirm
                  buttonWidth:100; buttonHeight:80
                  label: "数据\n确认"
                  labelSize: 20
                  radius: 2
                  touchenabled:datacofen
                  gradient: Gradient {
                     GradientStop { position: 0.0; color: datacofirm ? "green":"plum" }
                     GradientStop { position: 1.0; color: datacofirm ? "green":"#136F6F6F" }
                 }

                  onButtonClick: datacfmClick();
             }
     }
         Row {
             spacing: 50
             Column {
                 spacing: 30

//                 Comboxcust {
//                     id :combox
//                     currentindex:comboxindex
////                     cheight:30
////                     cwidth:300
//                  Component.onCompleted: {
//                     addContent("请选择位置");
//                     addContent("1-原点参照");
//                     addContent("2-确认圆锥");
//                     addContent("3-供给插芯");
//                     addContent("4-孔径OK");
//                     addContent("5-没有接触");
//                     addContent("6-没有通过");
//                     addContent("7-等待位置");
//                     addContent("8-主轴出插芯");
//                     addContent("9-主轴入插芯");
//                  }
//                 }

                Comboboxcust {
                    id:combox
                    items:["请选择位置","1-原点参照","2-确认圆锥","3-供给插芯","4-孔径OK" ,"5-没有接触","6-没有通过",
                                   "7-等待位置","8-主轴出插芯","9-主轴入插芯"]
          //          currentIndex: comboxindex
                }
                 Row {
                     spacing: 180
                     Buttoncust {
                         id:button6
                          buttonWidth:60; buttonHeight:60
                         label: "<"
                         labelSize: 40
                         radius: 2
                         gradient: Gradient {
                             GradientStop { position: 0.0; color: "plum" }
                             GradientStop { position: 1.0; color: "#136F6F6F" }
                         }
                         visible: combox.state==="dropDown"? false:true
                         onButtonClick: {
                             if(comboxindex<=0)comboxindex=0;
                             else comboxindex--;
                         }
                     }
                     Buttoncust {
                         id:button7
                         buttonWidth:60; buttonHeight:60
                         label: ">"
                         labelSize: 40
                         radius: 2
                         gradient: Gradient {
                             GradientStop { position: 0.0; color: "plum" }
                             GradientStop { position: 1.0; color: "#136F6F6F" }
                         }
                         visible: combox.state==="dropDown"? false:true
                         onButtonClick: {
                             if(comboxindex>=combox.count-1)comboxindex=combox.count-1;
                             else comboxindex++;
                           //  console.log("cbItems1.count: ",cbItems1.count);
                         }
                    }
               }
                 Buttoncust {
                 id:button8
                 buttonWidth:200; buttonHeight:100
                 label: "参数设定"
                 labelSize: 36
                 radius: 2
                 gradient: Gradient {
                     GradientStop { position: 0.0; color: "plum" }
                     GradientStop { position: 1.0; color: "#136F6F6F" }
                 }
                 visible: combox.state==="dropDown"? false:true
                 onButtonClick: datasetClick();
             }
             }
             Rectangle{
                 id:space3
                 width: 50;height: parent.height
                 color: "transparent"
             }
             Column {
                 spacing: 30
                 Text{
                     id: text7;width:50;height:20;text: qsTr("调整"); font.pointSize: 18
                     horizontalAlignment: Text.AlignHCenter
                 }
                 Buttoncust {
                     id:button2
                     buttonWidth:100; buttonHeight:100
                     label: targetpst ? "移至\n目标位":"移至\n目标位中"
                     labelSize: 20
                     radius: 2
                     touchenabled:adjen
                     gradient: Gradient {
                         GradientStop { position: 0.0; color: targetpst ? "green":"plum" }
                         GradientStop { position: 1.0; color: targetpst ? "green":"#136F6F6F"  }
                     }
                     onButtonClick: targetpstClick();
                 }
                 Buttoncust {
                     id:button3
                     buttonWidth:100; buttonHeight:100
                     label: bkorg ? "回原点":"回原点中"
                     labelSize: 20
                     radius: 2
                     touchenabled:adjen
                     gradient: Gradient {
                         GradientStop { position: 0.0; color: targetpst ? "green":"plum" }
                         GradientStop { position: 1.0; color: targetpst ? "green":"#136F6F6F"  }
                     }
                     onButtonClick: bkorgClick();
                 }
             }
             Column {
                 spacing: 30
                 Text{
                     id: text8;width:50;height:20;text: qsTr("寸动"); font.pointSize: 18
                     horizontalAlignment: Text.AlignHCenter
                 }
                 Buttoncust {
                     id:button4
                     buttonWidth:100; buttonHeight:100
                     label: "加值"
                     labelSize: 20
                     radius: 2
                     touchenabled:adjen
                     textColor: add ? "red":"#DCDCCC"
                     gradient: Gradient {
                         GradientStop { position: 0.0; color:  "plum" }
                         GradientStop { position: 1.0; color:  "#136F6F6F" }
                     }
                     onButtonClick: addClick();
                 }
                 Buttoncust {
                     id:button5
                      buttonWidth:100; buttonHeight:100
                     label: "减值"
                     labelSize: 20
                     radius: 2
                     textColor: minus ? "red":"#DCDCCC"
                     touchenabled:adjen
                     gradient: Gradient {
                         GradientStop { position: 0.0; color:  "plum" }
                         GradientStop { position: 1.0; color:  "#136F6F6F" }
                     }
                     onButtonClick: minusClick();
                 }

             }

         }
     }
}
