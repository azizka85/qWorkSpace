import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 800
    height: 640
    title: qsTr("qWorkspace")

    WorkSpace {
        id: workSpace
        anchors.fill: parent

        menuItems: [

            MenuItem {
                id: jobMenuItem
                color: workSpace.menuColor
                iconSource: "qrc:/icon-job-64x64.png"

                onClick: workSpace.insertFirst(jobItem)
            },

            MenuItem {
                id: unitsMenuItem
                color: workSpace.menuColor
                iconSource: "qrc:/icon-units-64x64.png"

                onClick: workSpace.insertFirst(unitsItem)
            },

            MenuItem {
                id: ffMenuItem
                color: workSpace.menuColor
                iconSource: "qrc:/icon-formation-fluids-64x64.png"

                onClick: workSpace.insertFirst(ffItem)
            },

            MenuItem {
                id: wrMenuItem
                color: workSpace.menuColor
                iconSource: "qrc:/icon-well-reservoir-64x64.png"

                onClick: workSpace.insertFirst(wrItem)
            },

            MenuItem {
                id: zonesMenuItem
                color: workSpace.menuColor
                iconSource: "qrc:/icon-zones-64x64.png"

                onClick: workSpace.insertFirst(zonesItem)
            },

            MenuItem {
                id: wellboreMenuItem
                color: workSpace.menuColor
                iconSource: "qrc:/icon-wellbore-64x64.png"

                onClick: workSpace.insertFirst(wellboreItem)
            },

            MenuItem {
                id: gsMenuItem
                color: workSpace.menuColor
                iconSource: "qrc:/icon-gun-system-64x64.png"

                onClick: workSpace.insertFirst(gsItem)
            },

            MenuItem {
                id: outputMenuItem
                color: workSpace.menuColor
                iconSource: "qrc:/icon-output-64x64.png"

                onClick: workSpace.insertFirst(outputItem)
            }
        ]

        SpaceItem {
            id: jobItem
            anchors.fill: parent

            Rectangle {
                anchors.fill: parent
                color: "red"

                Text {
                    anchors.centerIn: parent
                    text: "job"
                }
            }
        }

        SpaceItem {
            id: unitsItem
            anchors.fill: parent

            Rectangle {
                anchors.fill: parent
                color: "green"

                Text {
                    anchors.centerIn: parent
                    text: "units"
                }
            }
        }

        SpaceItem {
            id: ffItem
            anchors.fill: parent

            Rectangle {
                anchors.fill: parent
                color: "blue"

                Text {
                    anchors.centerIn: parent
                    text: "ff"
                }
            }
        }

        SpaceItem {
            id: wrItem
            anchors.fill: parent

            Rectangle {
                anchors.fill: parent
                color: "yellow"

                Text {
                    anchors.centerIn: parent
                    text: "wr"
                }
            }
        }

        SpaceItem {
            id: zonesItem
            anchors.fill: parent

            Rectangle {
                anchors.fill: parent
                color: "purple"

                Text {
                    anchors.centerIn: parent
                    text: "zones"
                }
            }
        }

        SpaceItem {
            id: wellboreItem
            anchors.fill: parent

            Rectangle {
                anchors.fill: parent
                color: "aqua"

                Text {
                    anchors.centerIn: parent
                    text: "wellbore"
                }
            }
        }

        SpaceItem {
            id: gsItem
            anchors.fill: parent

            Rectangle {
                anchors.fill: parent
                color: "violet"

                Text {
                    anchors.centerIn: parent
                    text: "gs"
                }
            }
        }

        SpaceItem {
            id: outputItem
            anchors.fill: parent

            Rectangle {
                anchors.fill: parent
                color: "silver"

                Text {
                    anchors.centerIn: parent
                    text: "output"
                }
            }
        }
    }       
}
