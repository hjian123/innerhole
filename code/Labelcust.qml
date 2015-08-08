import QtQuick 2.0

Rectangle {
    width: 100
    height: 80
    id:labelcust
    property string labeltext1: "原点"
    property string labeltext2: "°"
    property string labeltext3: "0"
    property alias btcode:label.code
    property bool touchable: true
    property real bottomy: labelcust.y + labelcust.height +parent.y
    signal clicked(string btcode,real bottomy)
    color:"transparent"
    Column{
        spacing: 10
        Text {
            id: text1
            text: labeltext1     // Bind the text to the parent's text
            color: "black"
            font.pointSize: 18
         //   horizontalAlignment: Text.AlignHCenter
        }
        Row {
            spacing: 5
            Labelcust1{
                id:label;labelWidth: 100;labelHeight:  50
                touchenabled: touchable
                labelSize: 16
                labeltext: labeltext3
              //  onLabelClick: clicked(btcode,bottomy)
                Component.onCompleted: labelClick.connect(clicked)
                Rectangle{
                    id:shade
                    anchors.fill:parent
                    radius:1
                    opacity: 0.6
                    z:1
                    color:label.touchenabled ? "transparent":"gray"
                }
           }
            Text {
                id: text2
                text: labeltext2     // Bind the text to the parent's text
                color: "black"
                font.pointSize: 18
             //   horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}

