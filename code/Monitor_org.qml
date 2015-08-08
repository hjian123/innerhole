import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

Rectangle {
    width: 500;
    height: 300;
    color: "white";
    id:warnh
    property color currentcolor: "blue"
    property alias warnModel: listView.model
    property alias viewCount: listView.count
    Component {
        id: phoneModel;
        ListModel {
            id:listModel
            ListElement{
                listName: "左旋转"
                curPosText:"000.00"
                unittext1: "度";
                curLocaText: "确认圆锥位"
                stateColor: "green";
                stateText:""
            }
            ListElement{
                listName: "主轴"
                curPosText:"0.00"
                unittext1: "mm";
                curLocaText: "上载插芯位"
                stateColor: "cyan";
                stateText:""
            }
            ListElement{
                listName: "右旋转"
                curPosText:"0.00"
                unittext1: "度";
                curLocaText: "激光扫描位"
                stateColor: "cyan";
                stateText:""
            }
            ListElement{
                listName: "进丝"
                curPosText:"0.00"
                unittext1: "mm";
                curLocaText: "原点位"
                stateColor: "cyan";
                stateText:""
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
        id: phoneDelegate;
        Item {
            id: wrapper;
            width: parent.width;
            height: 30;
            RowLayout {
                anchors.left: parent.left;
                anchors.verticalCenter: parent.verticalCenter;
                spacing: 15;
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
                        text: curPosText+unittext1;
                        font.pixelSize: 18;
                    }
                }

                Rectangle {
                    id:curLocaBt
                    width: 110; height: 30
                    color:"plum"
                    radius: 3
                    border.color: "gray"
                    border.width: 2
                    Text {
                        anchors.centerIn: parent
                        text: curLocaText;
                        font.pixelSize: 18;
                    }

                }
                Rectangle{
                    width:50;height: 30
                    color:stateColor
                    Text {
                        text: stateText;
                        font.pixelSize: 18;
                    }
                }

            }
        }
    }

    ListView {
        id: listView;
        width:parent.width;height:parent.height-70;
        anchors.top: parent.top;
        anchors.topMargin: 10;
        delegate: phoneDelegate;
        header:headerView
        model: phoneModel.createObject(listView);
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
        anchors.top:listView.bottom
        spacing: 10;
        Text {
            text: "气缸类";
            color: "black";
            Layout.preferredWidth: 50;
            font.pixelSize: 18;
        }
        Rectangle{
            width:50;height: 50
            color:"cyan"
            Text {
                anchors.centerIn: parent
                text: "气缸\n原点";
                font.pixelSize: 18;
            }
        }
        Rectangle{
            width:50;height: 50
            color:"cyan"
            Text {
                anchors.centerIn: parent
                text: "上载\n夹子";
                font.pixelSize: 18;
            }
        }
        Rectangle{
            width:50;height: 50
            color:"cyan"
            Text {
                anchors.centerIn: parent
                text: "插芯\n顶针";
                font.pixelSize: 18;
            }
        }
        Rectangle{
            width:50;height: 50
            color:"cyan"
            Text {
                anchors.centerIn: parent
                text: "180°\n前后";
                font.pixelSize: 18;
            }
        }
        Rectangle{
            width:50;height: 50
            color:"cyan"
            Text {
                anchors.centerIn: parent
                text: "180°\n旋转";
                font.pixelSize: 18;
            }
        }
        Rectangle{
            width:50;height: 50
            color:"cyan"
            Text {
                anchors.centerIn: parent
                text: "90°\n旋转";
                font.pixelSize: 18;
            }
        }
    }
}
