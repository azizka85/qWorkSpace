import QtQuick 2.12
import QtQuick.Controls 1.4 as C1

C1.SplitView {
    property alias spaceItem1: item1
    property alias spaceItem2: item2

    property real ratio: -1

    id: spaceSplit
    width: parent.width
    height: parent.height
    visible: false
    orientation: Qt.Horizontal

    Item {
        readonly property int typeId: 1

        id: item1
    }

    Item {
        readonly property int typeId: 2

        id: item2
    }

    onResizingChanged: if(!resizing) ratio = Math.min(item1.width/spaceSplit.width, item1.height/spaceSplit.height)

    onRatioChanged: resizeItems()

    onWidthChanged: changeItemsWidth()

    onHeightChanged: changeItemsHeight()

    function changeItemsWidth() {
        item1.width = orientation == Qt.Horizontal ? ratio >= 0 && ratio <= 1 ? ratio*parent.width : parent.width/2 : parent.width;
        item2.width = orientation == Qt.Horizontal ? ratio >= 0 && ratio <= 1 ? (1-ratio)*parent.width : parent.width/2 : parent.width;
    }

    function changeItemsHeight() {
        item1.height = orientation == Qt.Vertical ? ratio >= 0 && ratio <= 1 ? ratio*parent.height : parent.height/2 : parent.height;
        item2.height = orientation == Qt.Vertical ? ratio >= 0 && ratio <= 1 ? (1-ratio)*parent.height : parent.height/2 : parent.height;
    }

    function resizeItems() {
        changeItemsWidth();
        changeItemsHeight();
    }
}
