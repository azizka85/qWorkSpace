import QtQuick 2.12
import QtQuick.Controls 1.4

Item {
    property WorkSpace space

    property alias contentItem: content

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

            Menu {
                id: splitMenu

                MenuItem { text: "Split vertical" }

                MenuItem { text: "Split horizontal" }

                MenuItem { text: "Open in new window" }

                MenuItem { text: "Close" }
            }
        }
    }

    Item {
        id: content
        anchors { left: parent.left; right: parent.right; top: topBar.bottom; bottom: parent.bottom }
    }
}
