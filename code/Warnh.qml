import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

Rectangle {
    width: 360;
    height: 300;
    color: "black";
    id:warnh
    property color currentcolor: "blue"
    property alias warnModel: listView.model
    property alias viewCount: listView.count
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
