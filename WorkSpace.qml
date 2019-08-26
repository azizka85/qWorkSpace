import QtQuick 2.12
import QtQuick.Controls 2.4 as C2

Item {
    default property alias controls: privateSpace.children

    property alias menuItems: menuColumn.children
    property alias menuColor: menu.color
    property alias menuBorder: menu.border

    property var mainWindow: null

    id: workSpace

    Rectangle {
        id: menu
        anchors { top: parent.top; bottom: parent.bottom; left: parent.left }
        width: 88
        color: "#4f4f4f"
        border.color: "#202020"
        z: 1
        visible: false

        C2.ScrollView {
            width: parent.width
            height: parent.height-24
            anchors { centerIn: parent }

            Column {
                id: menuColumn
                width: parent.width-24
                height: parent.height
                anchors { centerIn: parent }
                spacing: 12
            }
        }
    }

    Item {
        readonly property int typeId: 0

        id: contentSpace
        anchors { left: parent.left; right: parent.right; top: parent.top; bottom: bottomBar.top }
    }

    Item {
        property var splitters: []
        property var windows: []

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

    Component {
        id: splitter

        SpaceSplit { }
    }

    Component.onCompleted: {
        for(var i = 0; i < controls.length; i++) {
            if(i > 0) privateSpace.splitters.push(splitter.createObject(workSpace));
            controls[i].visible = false;
            controls[i].space = workSpace;
        }
    }

    function hideItem(item)
    {
        unSplit(item);
        freeItem(item);
    }

    function unSplit(item)
    {                
        if(item.visible === true)
        {
            var typeId = item.parent.typeId;

            if(typeId > 0)
            {
                var splitter = item.parent.parent.parent;

                var share = typeId === 1 ? splitter.spaceItem2.children[0] : splitter.spaceItem1.children[0];

                share.parent = splitter.parent;
                splitter.parent = workSpace;
                splitter.visible = false;

                privateSpace.splitters.push(splitter);
            }
        }
    }

    function freeItem(item)
    {
        item.parent = privateSpace;
        item.visible = false;
    }

    function insertFirst(item, orientation, ratio, isFirst)
    {
        if(orientation === undefined) orientation = Qt.Horizontal;
        if(ratio === undefined) ratio = -1;
        if(isFirst === undefined) isFirst = false;

        if(item.visible === false)
        {
            if(contentSpace.children.length > 0)
            {
                var splitter = getSplitter(item, contentSpace.children[0], isFirst, ratio, orientation);

                splitter.parent = contentSpace;
                splitter.visible = true;
            }
            else
            {
                item.parent = contentSpace;
            }

            item.visible = true;
        }
    }

    function insertItem(item, share, orientation, ratio, isFirst)
    {
        if(orientation === undefined) orientation = Qt.Horizontal;
        if(share === undefined) share = null;
        if(ratio === undefined) ratio = -1;
        if(isFirst === undefined) isFirst = false;

        if(item.visible === false)
        {
            if(share !== null && share.visible !== false)
            {
                var shareParent = share.parent;

                var splitter = getSplitter(item, share, isFirst, ratio, orientation);

                splitter.parent = shareParent;
                splitter.visible = true;
                item.visible = true;
            }
            else insertFirst(item);
        }
    }

    function getSplitter(item, share, isFirst, ratio, orientation)
    {
        var splitter = privateSpace.splitters.pop();

        splitter.ratio = ratio;
        splitter.orientation = orientation;

        item.parent = isFirst ? splitter.spaceItem1 : splitter.spaceItem2;
        share.parent = isFirst ? splitter.spaceItem2 : splitter.spaceItem1;

        return splitter;
    }

    function canSplit()
    {
        return contentSpace.children.length > 0 && contentSpace.children[0].typeId === 3;
    }

    function canDock()
    {
        return mainWindow != null;
    }

    function canUnDock()
    {
        return mainWindow == null;
    }

    function splitVertical(item)
    {
        if(item.visible === true)
        {
            var typeId = item.parent.typeId;

            if(typeId > 0)
            {
                var splitter = item.parent.parent.parent;

                splitter.orientation = Qt.Vertical;
            }
        }
    }

    function splitHorizontal(item)
    {
        if(item.visible === true)
        {
            var typeId = item.parent.typeId;

            if(typeId > 0)
            {
                var splitter = item.parent.parent.parent;

                splitter.orientation = Qt.Horizontal;
            }
        }
    }
}
