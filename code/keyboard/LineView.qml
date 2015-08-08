import QtQuick 2.3

ListView {
   id:view
   property real mainHi: parent.height
   property real mainWi: parent.width

   signal clicked(string txt);

   width:vk.width;   height: mainHi;   spacing: 2
   orientation: Qt.Horizontal
   snapMode:ListView.SnapOneItem
   model: myModel;   clip: true
   delegate: Rectangle {
              id: displayRect
              height:mainHi; width: shTxt.width
              property int strLenth : modelData.length
              color: buttonMouseArea.pressed ? Qt.darker("#3E606F", 1.5) : Qt.darker("#3E606F", 1.2)
              Text {
                  text: index+1;color: "white"; smooth: true;
                  font.pixelSize: Math.max(mainWi > mainHi ? mainHi * .3 : mainWi * .3,1)
              }
              Text {
                  id:shTxt
                  text: modelData
                  anchors.centerIn: parent
                  font.pixelSize: Math.max(mainWi > mainHi ? mainHi * .6 : mainWi * .7,1)
                  color: "white"; styleColor: "white"; smooth: true
              }


              MouseArea {
                  id :buttonMouseArea
                  anchors.fill: parent
                  onClicked:{view.clicked(modelData);}
              }
         }

   ListModel{
       id:myModel
   }
    }
