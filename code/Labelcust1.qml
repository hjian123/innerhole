/****************************************************************************
*         shenzhen SDC
*
*         (c) Copyright YYYY
*
*         All rights reserved.
*
* Filename :Rootsheet.qml
* Programmer(s): hjian
*
* Created : 2015/05/21
* Description :项目当中Label的定义
****************************************************************************/

import QtQuick 2.0

Rectangle {
    // Identifier of the item
    id: labelcust1

    // These properties act as constants, useable outside this QML file
    property int labelHeight: 75
    property int labelWidth: 150

    // Attaches to the Text element's text content
    property alias labeltext: text1.text
    property color textColor: "black"

    property bool touchenabled:true
    // The color highlight when the mouse hovers on the rectangle
    property color onHoverColor: "lightsteelblue"
    property color borderColor: "transparent"

    // buttonColor is set to the button's main color
    property color labelColor: "lightsteelblue"

    property string code:" "
    property real bottomy: labelcust1.y + labelcust1.height +parent.y
  //  signal clicked(string btcode,real bottomy)

    property real labelSize: 14
    // Set appearance properties
    radius: 1
    antialiasing: true
    border.width: 2
    border.color: borderColor
    width: labelWidth
    height: labelHeight
//    gradient: Gradient {
//        GradientStop { position: 0.0; color: labelColor }
//        GradientStop { position: 1.0; color: "#136F6F6F" }
//    }
  //  color: labelColor
    Text {
        id: text1
        anchors.centerIn: parent
        text: "label"   // Bind the text to the parent's text
        color: textColor
        font.pointSize: labelSize
        horizontalAlignment: Text.AlignHCenter
    }

    // buttonClick() is callable and a signal handler,
    // onButtonClick is automatically created
    signal labelClick(string btcode,real bottomy)

    // Define the clickable area to be the whole rectangle
    MouseArea {
        id: labelMouseArea
        anchors.fill: parent    // Stretch the area to the parent's dimension
        onClicked: labelClick(code,bottomy)

        // If true, then onEntered and onExited called if mouse hovers in the mouse area
        // If false, a button must be clicked to detect the mouse hover
        hoverEnabled: true

        enabled: touchenabled
        // Display a border if the mouse hovers on the button mouse area
        onEntered: parent.border.color = onHoverColor
        //Remove the border if the mouse exits the button mouse area
        onExited:  parent.border.color = borderColor
    }

    // Change the color of the button when pressed
    color: labelMouseArea.pressed ? Qt.darker(labelColor, 1.5) : labelColor
    // Animate the color whenever the color property changes
    Behavior on color { ColorAnimation { duration: 55 } }

    // Scale the button when pressed
    scale: labelMouseArea.pressed ? 1.1 : 1.0
    // Animate the scale property change
    Behavior on scale { NumberAnimation { duration: 55 } }
}
