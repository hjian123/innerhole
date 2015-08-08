import QtQuick 2.4
import QtQml.Models 2.1

Rectangle {
    id: countset
    width: 1024; height: 540

    color: "#6C646A"
    gradient: Gradient {
         GradientStop { position: 0.0; color: "#6C646A" }
         GradientStop { position: 1.0; color: Qt.darker("#6A6D6A") }
    }
    property ListView countsetlistview:
    ListView {
      id: countsetlistview
      width: countset.width
      height: countset.height

      model: countsetlistmodel

      snapMode: ListView.SnapOneItem
      orientation: ListView.Horizontal
      boundsBehavior: Flickable.StopAtBounds
      flickDeceleration: 5000
      highlightFollowsCurrentItem: true
      highlightMoveDuration: 240
      highlightRangeMode: ListView.StrictlyEnforceRange
  }

    ObjectModel {
    id: countsetlistmodel

    Rectangle {
        id: countset1
        width: countsetlistview.width
        height: countsetlistview.height
        color: "transparent"
        Grid{
           rows: 4;  columns: 4;  rowSpacing: 20;  columnSpacing: 20
           Labelcust{
               id:labelcust1;labeltext1:"未通过判定";labeltext2:"次";
           }
           Labelcust{
               id:labelcust2;labeltext1:"最大未通过";labeltext2:"次";
           }
           Labelcust{
               id:labelcust3;labeltext1:"最大不接触";labeltext2:"个";
           }
           Labelcust{
               id:labelcust4;labeltext1:"最大受阻尝试";labeltext2:"个";
           }
           Labelcust{
               id:labelcust5;labeltext1:"未通过当前值";labeltext2:"次";
           }
           Labelcust{
               id:labelcust6;labeltext1:"未通过计数";labeltext2:"个";
           }
           Labelcust{
               id:labelcust7;labeltext1:"未接触计数";labeltext2:"个";
           }
           Labelcust{
               id:labelcust8;labeltext1:"受阻当前值";labeltext2:"个";
           }
           Labelcust{
               id:labelcust9;labeltext1:"圆锥判断限值";labeltext2:"次";
           }
           Labelcust{
               id:labelcust10;labeltext1:"修磨往复";labeltext2:"次";
           }
           Labelcust{
               id:labelcust11;labeltext1:"连续未通过";labeltext2:"个";
           }
           Labelcust{
               id:labelcust12;labeltext1:"低速受阻";labeltext2:"个";
           }
           Labelcust{
               id:labelcust13;labeltext1:"圆锥当前值";labeltext2:"次";
           }
           Labelcust{
               id:labelcust14;labeltext1:"修磨往复值";labeltext2:"次";
           }
           Labelcust{
               id:labelcust15;labeltext1:"连续切未过数";labeltext2:"次";
           }
           Labelcust{
               id:labelcust16;labeltext1:"热切时间";labeltext2:"MS";
           }
        }
    }
    Rectangle {
        id: compenvalue    //补偿值
        width: countsetlistview.width
        height: countsetlistview.height
        color: "transparent"
        Row{
            spacing: 20
          anchors.fill: parent
          Column{
              spacing: 20
             Text {
                 id: text1
                 text: "(第一模式有效)"
                 color: "red"
                 font.pointSize: 18
             }
             Rectangle{
                 id:firstmode;color: "transparent"
                 border.color: "red";width: 300;height: 200;border.width: 2
                 Grid{
                     anchors.fill:parent
                     rows: 2;  columns: 2;  rowSpacing: 20;  columnSpacing: 20
                     Labelcust{
                         id:complabel1;labeltext1:"WM1长度";labeltext2:"mm";
                     }
                     Labelcust{
                         id:complabel2;labeltext1:" ";labeltext2:"r/m";
                     }
                     Labelcust{
                         id:complabel3;labeltext1:"WM1最后补偿";labeltext2:"mm";
                     }
                     Labelcust{
                         id:complabel4;labeltext1:" ";labeltext2:"r/m";
                     }
                 }
             }
             Grid{
                 rows: 2;  columns: 2;  rowSpacing: 20;  columnSpacing: 20
                 Labelcust{
                     id:complabel5;labeltext1:"二次补偿";labeltext2:"mm";
                 }
                 Labelcust{
                     id:complabel6;labeltext1:" ";labeltext2:"r/m";
                 }
                 Labelcust{
                     id:complabel7;labeltext1:"遇阻后退长度";labeltext2:"mm";
                 }
                 Labelcust{
                     id:complabel8;labeltext1:" ";labeltext2:"r/m";
                 }
             }
          }
          Column{
              spacing: 20
             Text{
                  id: text2
                  text: "(第二模式有效)"
                  color: "red"
                  font.pointSize: 18
              }
             Grid{
              rows: 4;  columns: 2;  rowSpacing: 20;  columnSpacing: 20
              Labelcust{
                  id:complabel9;labeltext1:"断丝后进丝长度";labeltext2:"mm";
              }
              Labelcust{
                  id:complabel10;labeltext1:"WORK WM2";labeltext2:"mm";
              }
              Labelcust{
                  id:complabel11;labeltext1:"进丝补偿值";labeltext2:"mm";
              }
              Labelcust{
                  id:complabel12;labeltext1:"断丝递进补偿值";labeltext2:"mm";
              }
              Labelcust{
                  id:complabel13;labeltext1:"搜寻圆锥长度";labeltext2:"mm";
              }
              Labelcust{
                  id:complabel14;labeltext1:"断丝间隔设定";labeltext2:"次";
              }
              Labelcust{
                  id:complabel15;labeltext1:"模式2速度";labeltext2:"r/m";
              }
              Labelcust{
                  id:complabel16;labeltext1:"断丝间隔当前";labeltext2:"次";
              }
          }
          }
       }
    }
    Rectangle {
        id: timeset
        width: countsetlistview.width
        height: countsetlistview.height
        color: "transparent"
        Rectangle{
           id:delaysetrect
           color: "transparent"
           anchors.horizontalCenter: parent.horizontalCenter
           Row{
               spacing: 20
               Text{
                   id: text3
                   text: "延时\n设定"
                   font.pointSize: 20
               }
               Grid{
                   rows: 2;  columns: 3;  rowSpacing: 20;  columnSpacing: 20
                   Labelcust{
                       id:complabel17;labeltext1:"顶插芯延时";labeltext2:"MS";
                   }
                   Labelcust{
                       id:complabel18;labeltext1:"夹持时间";labeltext2:"MS";
                   }
                   Labelcust{
                       id:complabel19;labeltext1:"180°确认";labeltext2:"MS";
                   }
                   Labelcust{
                       id:complabel20;labeltext1:"磨削液加注";labeltext2:"MS";
                   }
                   Labelcust{
                       id:complabel21;labeltext1:"松开张力计时";labeltext2:"MS";
                   }
                   Labelcust{
                       id:complabel22;labeltext1:"高速主轴停止";labeltext2:"MS";
                   }
               }
           }
        }
        Rectangle{
            id:timeoutrect
            color: "transparent"
            anchors.top:delaysetrect.bottom;anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            border.color: "red"
            border.width: 2
            Row{
                spacing: 20
                Text{
                    id: text4
                    text: "超时\n报警"
                    font.pointSize: 20
                }
                Labelcust{
                    id:complabel23;labeltext1:"单颗最大\n加工时限";labeltext2:"S";
                }
                Labelcust{
                    id:complabel24;labeltext1:"单颗最小\n最短时限";labeltext2:"S";
                }
                Labelcust{
                    id:complabel25;labeltext1:"单颗当前\n加工计时";labeltext2:"S";
                }
                Labelcust{
                    id:complabel26;labeltext1:"热刀断丝\n最大时间";labeltext2:"S";
                }

            }
        }

   }

}
}
