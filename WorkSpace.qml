import QtQuick 2.12
import QtQuick.Controls 2.4 as C2

Item {
    default property alias controls: privateSpace.children

    Rectangle {
        id: menu
        anchors { top: parent.top; bottom: parent.bottom; left: parent.left }
        width: 88
        color: "#4f4f4f"
        border.color: "#202020"
        z: 1
        visible: false

        C2.ScrollView {
            anchors.fill: parent

            Column {
                id: menuItems
                width: parent.width-24
                height: parent.height-24
                anchors { centerIn: parent }
                spacing: 12

                MenuItem {
                    id: jobMenuItem
                    color: menu.color
                    iconSource: "qrc:/icon-job-64x64.png"
                }

                MenuItem {
                    id: unitsMenuItem
                    color: menu.color
                    iconSource: "qrc:/icon-units-64x64.png"
                }

                MenuItem {
                    id: ffMenuItem
                    color: menu.color
                    iconSource: "qrc:/icon-formation-fluids-64x64.png"
                }

                MenuItem {
                    id: wrMenuItem
                    color: menu.color
                    iconSource: "qrc:/icon-well-reservoir-64x64.png"
                }

                MenuItem {
                    id: zonesMenuItem
                    color: menu.color
                    iconSource: "qrc:/icon-zones-64x64.png"
                }

                MenuItem {
                    id: wellboreMenuItem
                    color: menu.color
                    iconSource: "qrc:/icon-wellbore-64x64.png"
                }

                MenuItem {
                    id: gsMenuItem
                    color: menu.color
                    iconSource: "qrc:/icon-gun-system-64x64.png"
                }

                MenuItem {
                    id: outputMenuItem
                    color: menu.color
                    iconSource: "qrc:/icon-output-64x64.png"
                }
            }
        }
    }

    Item {
        readonly property int typeId: 0

        id: contentSpace
        anchors { left: parent.left; right: parent.right; top: parent.top; bottom: bottomBar.top }
    }

    Item {
        id: privateSpace
        visible: false
    }

    Rectangle {
        id: bottomBar
        color: menu.color
        border.color: menu.border.color
        height: 30
        anchors { left: menu.visible ? menu.right : parent.left; right: parent.right; bottom: parent.bottom }

        BarItem {
            width: 24
            height: 24
            iconSource: "qrc:/icon-menu.svg"
            anchors { left: parent.left; verticalCenter: parent.verticalCenter; leftMargin: 3 }

            onClick: menu.visible = !menu.visible
        }
    }
}
