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
* Description :项目当中的引用所有button元素的定义
****************************************************************************/

import QtQuick 2.0

Rectangle {
    id: button
    property int buttonHeight: 75
    property int buttonWidth: 150

    property string label
    property color textColor: buttonLabel.color

    property color onHoverColor: "lightsteelblue"
    property color borderColor: "transparent"

    // buttonColor is set to the button's main color
    property color buttonColor: "lightblue"

    property bool touchenabled: true

    property real labelSize: 14
    // Set appearance properties
    radius: 6
    antialiasing: true
    border.width: 2
    border.color: borderColor
    width: buttonWidth
    height: buttonHeight

    Text {
        id: buttonLabel
        anchors.centerIn: parent
        text: label     // Bind the text to the parent's text
        color: "#DCDCCC"
        font.pointSize: labelSize
         horizontalAlignment: Text.AlignHCenter
    }


    signal buttonClick()

    // Define the clickable area to be the whole rectangle
    MouseArea {
        id: buttonMouseArea
        anchors.fill: parent    // Stretch the area to the parent's dimension
        onClicked: buttonClick()

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
    color: buttonMouseArea.pressed ? Qt.darker(buttonColor, 1.5) : buttonColor
    // Animate the color whenever the color property changes
    Behavior on color { ColorAnimation { duration: 55 } }

    // Scale the button when pressed
    scale: buttonMouseArea.pressed ? 1.1 : 1.0
    // Animate the scale property change
    Behavior on scale { NumberAnimation { duration: 55 } }
    Rectangle{
        id:grayrect
        anchors.fill:parent
        opacity: 0.6
        z:1
        color:buttonMouseArea.enabled ? "transparent":"gray"
    }
}
