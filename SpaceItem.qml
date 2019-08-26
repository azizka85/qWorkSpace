import QtQuick 2.12
import QtQuick.Controls 1.4 as C1

Item {
    readonly property int typeId: 4

    property WorkSpace space: null

    default property alias controls: content.children

    property alias barColor: topBar.color
    property alias barBorder: topBar.border

    id: spaceItem

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
                    id: vSplitMenuItem
                    text: "Split vertical"

                    onTriggered: splitVertical()
                }

                C1.MenuItem {
                    id: hSplitMenuItem
                    text: "Split horizontal"

                    onTriggered: splitHorizontal()
                }

                C1.MenuItem {
                    id: unDockMenuItem
                    text: "Open in new window"
                }

                C1.MenuItem {
                    id: dockMenuItem
                    text: "Dock in main window"
                }

                C1.MenuItem {
                    text: "Close"

                    onTriggered: hide()
                }

                onPopupVisibleChanged: {
                    vSplitMenuItem.visible = hSplitMenuItem.visible = canSplit();
                    unDockMenuItem.visible = canUnDock();
                    dockMenuItem.visible = canDock();
                }
            }
        }
    }

    Item {
        id: content
        anchors { left: parent.left; right: parent.right; top: topBar.bottom; bottom: parent.bottom }
    }

    function canSplit()
    {
        return space != null && space.canSplit();
    }

    function canUnDock()
    {
        return space != null && space.canUnDock();
    }

    function canDock()
    {
        return space != null && space.canDock();
    }

    function hide()
    {
        if(space != null) space.hideItem(spaceItem);
    }

    function splitVertical()
    {
        if(space != null) space.splitVertical(spaceItem);
    }

    function splitHorizontal()
    {
        if(space != null) space.splitHorizontal(spaceItem);
    }
}
