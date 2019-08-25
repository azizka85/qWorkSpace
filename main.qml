import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4

Window {
    visible: true
    width: 800
    height: 640
    title: qsTr("PerfoMunai'")

    WorkSpace {
        anchors.fill: parent

        SpaceItem {
            anchors.fill: parent

            Rectangle {
                anchors.fill: parent
                color: "yellow"
            }
        }
    }
}
