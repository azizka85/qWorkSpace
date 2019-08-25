import QtQuick 2.12
import QtGraphicalEffects 1.0

Item {
    property alias iconSource: itemImage.source

    signal click

    Image {
        id: itemImage
        width: parent.width
        height: parent.height
        sourceSize: Qt.size(width, height)
        visible: itemArea.containsMouse
    }

    ColorOverlay {
        id: itemOverlay
        anchors.fill: itemImage
        source: itemImage
        color: "#ffffff"
        visible: !itemArea.containsMouse
    }

    MouseArea {
        id: itemArea
        anchors.fill: itemImage
        hoverEnabled: true
        cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
        onClicked: click()
    }
}
