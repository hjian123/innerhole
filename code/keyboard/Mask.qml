import QtQuick 2.0
import QtQuick.Window 2.1


Rectangle {
    id:mask
    //anchors.fill: getRoot(this)
    color: 'lightgrey'
    opacity: 0.5
    z:5
    MouseArea{
        anchors.fill: parent;
        onPressed:{
             mouse.accepted = true
        }
    }
    function getRoot(item){
        return (item.parent !== null) ? getRoot(item.parent) : item;
    }
    Component.onCompleted: {
        this.parent = getRoot(this);
        this.anchors.fill = parent;
    }
}
