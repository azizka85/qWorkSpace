import QtQuick 2.12
import QtGraphicalEffects 1.0

Rectangle {
    property alias iconSource: menuImage.source

    id: menuItem
    width: 64
    height: 64

    Image {
        id: menuImage
        anchors.fill: parent
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true
    }

    ColorOverlay {
        id: menuOverlay
        anchors.fill: menuImage
        source: menuImage
        color: "#ff0000"
        opacity: 0.1
        visible: menuArea.containsMouse
    }

    MouseArea {
        id: menuArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
    }
}
