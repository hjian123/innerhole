import QtQuick 2.0

Rectangle {
    id: semiauto
    width: 1024; height: 600
    color: "transparent"
    property color fileColor: "plum"
    property color editColor: "powderblue"

    property real partition: 1 / 10

    signal backClick()
    signal nextClick()
    signal manualClick()
    signal autoClick()
    signal devsetClick()
    signal monitorClick()
    signal warnClick()
    signal helpClick()
    Column{
        anchors.fill: parent
        z: 1
        spacing: 20
        Rectangle {
            id: labelList
            height: semiauto.height * partition
            width: semiauto.width
            color: "beige"
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#8C8F8C" }
                GradientStop { position: 0.17; color: "#6A6D6A" }
                GradientStop { position: 0.98;color: "#3F3F3F" }
                GradientStop { position: 1.0; color: "#0e1B20" }
            }
            Labelcust1{
                id:label1;labelWidth: parent.width*1/4;labelHeight:  parent.height
                labeltext: "半自动操作"
                anchors.top:parent.top;anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                touchenabled: false
                labelSize: 20
            }
            Buttoncust{
                id: backbutton
                buttonHeight:50; buttonWidth: 50
                anchors.left: parent.left;anchors.leftMargin: 50
                anchors.verticalCenter:  parent.verticalCenter
                buttonColor:"transparent"
                Image {
                    id: backIcon
                    source: "ptsrc/arrow.png"
                    width:sourceSize.width;height: sourceSize.width
                    fillMode: Image.Pad
                    anchors.centerIn: parent
                    rotation:90
                    Behavior { NumberAnimation { property: "rotation"; easing.type: Easing.OutExpo } }
                }
                    onButtonClick: {
                              backClick();
                    }
         }
        }
        Rectangle {
            id:space
            color: "transparent"
            height:300;width: parent.width;
        }
        Rectangle {
              id: semiautobutlist
              height: ctlmenu.height * 1/3
              width: ctlmenu.width
              color: "beige"
           //   anchors.bottom:parent.bottom
              gradient: Gradient {
                      GradientStop { position: 0.0; color: "#8C8F8C" }
                      GradientStop { position: 0.17; color: "#6A6D6A" }
                      GradientStop { position: 0.98;color: "#3F3F3F" }
                      GradientStop { position: 1.0; color: "#0e1B20" }
                  }
              Buttoncust {
                  id:manualbutton1
                  width: 120; height: 100
                  anchors.top: parent.top
                  anchors.topMargin: 30
                  anchors.left: parent.left
                  anchors.leftMargin: 42
                  label: "手动 \n操作"
                  labelSize: 20
                  radius: 5
                  gradient: Gradient {
                      GradientStop { position: 0.0; color: "plum" }
                      GradientStop { position: 1.0; color: "#136F6F6F" }
                  }
                  onButtonClick: {
                     manualClick();
                  }
              }
              Buttoncust {
                  id:autobutton1
                  width: 120; height: 100
                  anchors.top: parent.top
                  anchors.topMargin: 30
                  anchors.left: manualbutton1.right
                  anchors.leftMargin: 44
                  label: "自动 \n操作"
                  labelSize: 20
                  radius: 5
                  gradient: Gradient {
                      GradientStop { position: 0.0; color: "plum" }
                      GradientStop { position: 1.0; color: "#136F6F6F" }
                  }
                  onButtonClick: {
                      autoClick();
                  }
              }
              Buttoncust {
                  id:devsetbutton1
                  width: 120; height: 100
                  anchors.top: parent.top
                  anchors.topMargin: 30
                  anchors.left: autobutton1.right
                  anchors.leftMargin: 44
                  label: "项目 \n设定"
                  labelSize: 20
                  radius: 5
                  gradient: Gradient {
                      GradientStop { position: 0.0; color: "plum" }
                      GradientStop { position: 1.0; color: "#136F6F6F" }
                  }
                  onButtonClick: {
                      devsetClick();
                  }
              }
              Buttoncust {
                  id:monitorbutton1
                  width: 120; height: 100
                  anchors.top: parent.top
                  anchors.topMargin: 30
                  anchors.right: warncheckbutton1.left
                  anchors.rightMargin: 44
                  label: "运行 \n监控"
                  labelSize: 20
                  radius: 5
                  gradient: Gradient {
                      GradientStop { position: 0.0; color: "plum" }
                      GradientStop { position: 1.0; color: "#136F6F6F" }
                  }
                  onButtonClick: {
                      monitorClick();
                  }
              }
              Buttoncust {
                  id:warncheckbutton1
                  width: 120; height: 100
                  anchors.top: parent.top
                  anchors.topMargin: 30
                  anchors.right: helpfilebutton1.left
                  anchors.rightMargin: 44
                  label: "报警 \n查看"
                  labelSize: 20
                  radius: 5
                  gradient: Gradient {
                      GradientStop { position: 0.0; color: "plum" }
                      GradientStop { position: 1.0; color: "#136F6F6F" }
                  }
                  onButtonClick: {
                     warnClick();
                  }
              }
              Buttoncust {
                  id:helpfilebutton1
                  width: 120; height: 100
                  anchors.top: parent.top
                  anchors.topMargin: 30
                  anchors.right: parent.right
                  anchors.rightMargin: 42
                  label: "帮助 \n文件"
                  labelSize: 20
                  radius: 5
                  gradient: Gradient {
                      GradientStop { position: 0.0; color: "plum" }
                      GradientStop { position: 1.0; color: "#136F6F6F" }
                  }
                  onButtonClick: {
                      helpClick();
                  }
          }
}
    }
}

