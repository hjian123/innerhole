import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

Rectangle {
    width: 1024;
    height: 520;
  //  color: "black";
    property color viewcolor
    id:warnc
    gradient: Gradient {
    GradientStop { position: 0.0; color: "#8C8F8C" }
    GradientStop { position: 0.17; color: "#6A6D6A" }
    GradientStop { position: 0.98;color: "#3F3F3F" }
    GradientStop { position: 1.0; color: "#0e1B20" }
    }
  //  property color currentcolor: "blue"
    property alias warnModel: listView.model
    property alias viewCount: listView.count
    Rectangle{
        color:viewcolor // "black";
        width: parent.width
        height: parent.height-80
        Component {
            id: phoneModel;
            ListModel {
                id:listModel
                ListElement{
                    warnTime: "1233445";    //报警发生的时间
                    warnNumber: "1234";  //报警编号
                    warnContent: "jkafjdfjfjdjfjfkfjfiefakiefkia"; //报警内容
                    warnColor: "yellow";   //报警显示的颜色
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
                    spacing: 8;
                    Text {
                        text: "时间";
                        font.bold: true;
                        font.pixelSize: 20;
                        color: "white";
                        Layout.preferredWidth: 80;
                        Component.onCompleted: {console.log(z);}
                    }

                    Text {
                        text: "编号";
                        font.bold: true;
                        font.pixelSize: 20;
                        color: "white";
                        Layout.preferredWidth: 80;
                    }

                    Text {
                        text: "报警内容";
                        font.bold: true;
                        font.pixelSize: 20;
                        color: "white";
                        Layout.fillWidth: true;
                    }
                }
            }
        }
        Component {
            id: phoneDelegate;
            Item {
                id: wrapper;
                width: parent.width;
                height: 30;
              //  property alias color1: col1.color
    //            MouseArea {
    //                anchors.fill: parent;
    //                onClicked: {
    //                    wrapper.ListView.view.currentIndex = index ;
    //                    mouse.accepted = true;
    //                }

    //                onDoubleClicked: {
    //                    wrapper.ListView.view.model.remove(index);
    //                    mouse.accepted = true;
    //                }
    //            }

                RowLayout {
                    anchors.left: parent.left;
                    anchors.verticalCenter: parent.verticalCenter;
                    spacing: 8;
                    Text {
                        id: time;
                        text: warnTime;
                        color: "white";
                        Layout.preferredWidth: 80;
                        Component.onCompleted: {console.log(z);}
                    }

                    Text {
                        text: warnNumber;
                        color: "white";
                        font.pixelSize: 18;
                        Layout.preferredWidth: 80;
                    }

                    Text {
                        text: warnContent;
                        color: warnColor;
                        font.pixelSize: 18;
                        Layout.fillWidth: true;
                    }
                }
            }
        }
        ListView {
        id: listView;
      //  property color currentcolor: "blue"
        anchors.fill: parent;

        delegate: phoneDelegate;
        model: phoneModel.createObject(listView);
        header: headerView;
 //       footer: footerView;
        focus: true;
        clip: true

        FlickableScrollBar {
            target: listView
            orientation: Qt.Vertical
        }

//        highlight: Rectangle{
//            color: "lightblue";
//        }

//        onCurrentIndexChanged:{
//            if( listView.currentIndex >=0 ){
//                var data = listView.model.get(listView.currentIndex);
//                listView.footerItem.text = data.name + " , " + data.cost + " , " + data.manufacturer;
//            }else{
//                listView.footerItem.text = "";
//            }
//        }

//        Component.onCompleted: {
//            listView.footerItem.clean.connect(listView.model.clear);
//            listView.footerItem.add.connect(listView.addOne);
//        }
    }
   }
    Buttoncust {
        id:dampBt              //消声按钮
        width: 100; height: 50
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 50
        label: "消 声"
        labelSize: 20
        radius: 5
        gradient: Gradient {
            GradientStop { position: 0.0; color: "plum" }
            GradientStop { position: 1.0; color: "#136F6F6F" }
        }
        onButtonClick: {
            addOneWarn(Qt.formatDateTime(new Date(), "yyyy-MM-dd\nhh:mm:ss"),"0011","上载下载夹子动作错误","red");
        }
    }
    Buttoncust {
        id:resetBt              //复位按钮
        width: 100; height: 50
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.left: dampBt.right
        anchors.leftMargin: 50
        label: "复 位"
        labelSize: 20
        radius: 5
        touchenabled:resetenable;
        gradient: Gradient {
            GradientStop { position: 0.0; color: "plum" }
            GradientStop { position: 1.0; color: "#136F6F6F" }
        }
        onButtonClick: {

        }
    }
    Buttoncust {
        id:confirmBt              //确认按钮
        width: 100; height: 50
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 50
        label: "确 认"
        labelSize: 20
        radius: 5
        gradient: Gradient {
            GradientStop { position: 0.0; color: "plum" }
            GradientStop { position: 1.0; color: "#136F6F6F" }
        }
        onButtonClick: {

        }
    }

    function addOneWarn(time,number,content,color){
        listView.model.append(
                    {
                        "warnTime": time,
                        "warnNumber": number,
                        "warnContent": content,
                        "warnColor": color
                    }
                );
    }

}
