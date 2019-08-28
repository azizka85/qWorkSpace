import QtQuick 2.12
import QtQml 2.12
import QtQuick.Controls 2.4

Item {
    readonly property int typeId: 4

    property WorkSpace space: null

    default property alias controls: content.children

    property alias barColor: topBar.color
    property alias barBorder: topBar.border
    property alias insertInItems: insertInRepeater.model

    property string title: "Title"

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

            Menu {
                id: splitMenu

                MenuItem {
                    id: vSplitMenuItem
                    text: "Split vertical"
                    height: visible ? implicitHeight : 0

                    onTriggered: splitVertical()
                }

                MenuItem {
                    id: hSplitMenuItem
                    text: "Split horizontal"
                    height: visible ? implicitHeight : 0

                    onTriggered: splitHorizontal()
                }

                Menu {
                    id: insertInMenu
                    title: "Insert in ..."

                    Repeater {
                        id: insertInRepeater

                        MenuItem {
                            text: modelData.title
                            visible: modelData.visible
                            height: visible ? implicitHeight : 0

                            onTriggered: splitWith(modelData);
                        }
                    }
                }

                MenuItem {
                    id: insertFirstMenuItem
                    text: "Insert first"

                    onTriggered: insertFirst()
                }

                MenuItem {
                    id: unDockMenuItem
                    text: "Open in new window"
                    height: visible ? implicitHeight : 0

                    onTriggered: unDock()
                }

                MenuItem {
                    id: dockMenuItem
                    text: "Dock in main window"
                    height: visible ? implicitHeight : 0
                }

                MenuItem {
                    text: "Close"

                    onTriggered: hide()
                }

                onAboutToShow: {
                    vSplitMenuItem.visible = hSplitMenuItem.visible = canSplit();
                    unDockMenuItem.visible = canUnDock();
                    dockMenuItem.visible = canDock();

                    insertInMenu.enabled = insertInItems.some(item => item.visible);
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

    function unDock()
    {
        if(space != null) space.unDock(spaceItem);
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

    function splitWith(item)
    {
        space.splitWith(item, spaceItem);
    }

    function insertFirst()
    {
        space.hideItem(spaceItem);
        space.insertFirst(spaceItem);
    }
}
