import QtQuick 2.0

Rectangle{
    id:comboboxcust
    property variant items: ["test0", "test1", "test2", "test3"]
    property alias selectedItem: chosenItemText.text;
    property alias currentIndex: listView.currentIndex;
    property alias count: listView.count;
    property bool touchabled: true
    signal comboClicked;
    width: 300;
    height: 40;
    smooth:true;
    Rectangle {
        id:chosenItem
        radius:4;
        width:parent.width;
        height:comboboxcust.height;
        color: "#2EB3FF"
        smooth:true;
        Text {
            anchors.top: parent.top;
            anchors.left: parent.left;
            anchors.margins: 3;
            anchors.verticalCenter: parent.verticalCenter
            id:chosenItemText
            text:comboboxcust.items[0];
            font.family: "Arial"
            font.pointSize: 14;
            smooth:true
        }
        MouseArea {
            anchors.fill: parent;
            enabled: touchabled
            onClicked: {
                comboboxcust.state = comboboxcust.state==="dropDown"?"":"dropDown"
            }
        }
        Rectangle{
            id:grayrect
            anchors.fill:parent
            opacity: 0.6
            z:1
            color:touchabled ? "transparent":"gray"
        }
    }
    Rectangle {
        id:dropDown
        width:comboboxcust.width;
        height:0
        clip:true;
        radius:4;
        anchors.top: chosenItem.bottom;
        anchors.topMargin: 2
        color: "lightgray"
        opacity: 1
        z:1
        Rectangle{
            id: dropDownMask
            height: 3
            width:parent.width
            anchors.top: parent.top
        }
        ListView {
            id:listView
            height:250
            width: dropDown.width-4
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: dropDownMask.bottom
            anchors.topMargin: -1
            z:2
            model: comboboxcust.items
            currentIndex: 0
            delegate: Item{
                width:listView.width;
                height: comboboxcust.height;
                Rectangle {
                    id: mouseMoveHighLight
                    width:listView.width;
                    height:comboboxcust.height;
                    color: "green";
                    opacity: 0
                    radius: 4
                    z:1
                }
                Text {
                    text: modelData
                    anchors.top: parent.top;
                    anchors.left: parent.left;
                    anchors.margins: 5;
                    font.pointSize: 14;
                    z:2
                }
                MouseArea {
                    anchors.fill: parent;
                 //   hoverEnabled: true
                    onClicked: {
                       comboboxcust.state = ""
                        var preSelection = chosenItemText.text
                        chosenItemText.text = modelData
                        if(chosenItemText.text != preSelection){
                            comboboxcust.comboClicked();
                        }
                        listView.currentIndex = index;
                    }
               //     onEntered: mouseMoveHighLight.opacity = 0.5;
              //      onExited: mouseMoveHighLight.opacity = 0;
                }
            }
            highlight: Rectangle {
                width:listView.width;
                height:comboboxcust.height;
                color: "green";
                radius: 4
            }
        }
        MouseArea{
            anchors.fill: dropDown
            hoverEnabled: true
            onExited: {
                if(!containsMouse)
                    comboboxcust.state = "";
            }
        }
    }
    states: State {
        name: "dropDown";
        PropertyChanges { target: dropDown; height:30*comboboxcust.items.length+4 }
    }
    transitions: Transition {
        NumberAnimation { target: dropDown; properties: "height"; easing.type: Easing.OutExpo; duration: 200 }
    }
}
