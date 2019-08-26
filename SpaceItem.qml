import QtQuick 2.12
import QtQuick.Controls 1.4 as C1

Item {
    property WorkSpace space

    default property alias controls: content.children

    property alias barColor: topBar.color
    property alias barBorder: topBar.border

    Rectangle {
        id: topBar
        color: "#4f4f4f"
        border.color: "#202020"
        height: 30
        anchors { left: parent.left; right: parent.right; top: parent.top }

        BarItem {
            width: 24
            height: 24
            iconSource: "qrc:/icon-split.svg"
            anchors { right: parent.right; verticalCenter: parent.verticalCenter; rightMargin: 3 }

            onClick: splitMenu.popup()

            C1.Menu {
                id: splitMenu

                C1.MenuItem {
                    text: "Split vertical"
                    visible: canSplit()
                }

                C1.MenuItem {
                    text: "Split horizontal"
                    visible: canSplit()
                }

                C1.MenuItem {
                    text: "Open in new window"
                    visible: canUndock()
                }

                C1.MenuItem {
                    text: "Close"
                }
            }
        }
    }

    Item {
        id: content
        anchors { left: parent.left; right: parent.right; top: topBar.bottom; bottom: parent.bottom }
    }

    function canSplit() {
        return true;
    }

    function canUndock() {
        return true;
    }
}
