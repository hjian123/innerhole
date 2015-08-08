import QtQuick 2.3

BorderImage {
    id: button

    property alias text: buttonText.text
    property string op:" "

    signal clicked(string op)

    source: "images/button.png"; clip: true
    border { left: 5; top: 5; right: 5; bottom: 5 }


    Rectangle {
        id: shade
        anchors {fill: button;}
        radius: 10;
        color: "black";
        opacity: 0
    }

    Text {
        id: buttonText
        anchors { centerIn: parent; }
        font.family: "Times New Roman"
        font.pixelSize: parent.width > parent.height ? parent.height * .6 : parent.width * .6
        color: "black";
        styleColor: "black";
        smooth: true
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: button.clicked(op)
    }

    states: State {
        name: "pressed"; when: mouseArea.pressed === true
        PropertyChanges { target: shade; opacity: .3 }
    }
}
