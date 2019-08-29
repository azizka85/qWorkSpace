import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.4

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

        ScrollView {
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

    Component {
        id: dockWindow

        Window {
            visible: false
            width: 960
            height: 720
            title: qsTr("qWorkspace")
        }
    }

    Component.onCompleted: {
        for(var i = 0; i < controls.length; i++)
        {
            if(i > 0) privateSpace.splitters.push(splitter.createObject(workSpace));
            if(i > 0) privateSpace.windows.push(dockWindow.createObject(workSpace));
            controls[i].visible = false;
            controls[i].space = workSpace;

            var items = [];

            for(var j = 0; j < controls.length; j++) if(controls[i] !== controls[j]) items.push(controls[j]);

            controls[i].insertInItems = items;
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

    function dock(item)
    {

    }

    function freeItem(item)
    {
        item.parent = privateSpace;
        item.visible = false;
    }

    function unDock(item)
    {
        hideItem(item);

        var w = getWindow();

        item.parent = w.contentItem;
        item.visible = true;

        w.show();
    }

    function splitWith(item1, item2)
    {
        hideItem(item2);
        insertItem(item2, item1);
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

    function getWindow(title)
    {
        if(title === undefined) title = Window.window.title;

        var w = privateSpace.windows.pop();

        w.title = title;

        return w;
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
