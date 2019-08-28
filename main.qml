import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: mainWindow
    visible: true
    width: 960
    height: 720
    title: qsTr("qWorkspace")

    WorkSpace {
        id: workSpace
        anchors.fill: parent

        menuItems: [

            SpaceMenuItem {
                id: jobMenuItem
                color: workSpace.menuColor
                iconSource: "qrc:/icon-job-64x64.png"

                onClick: workSpace.insertFirst(jobItem)
            },

            SpaceMenuItem {
                id: unitsMenuItem
                color: workSpace.menuColor
                iconSource: "qrc:/icon-units-64x64.png"

                onClick: workSpace.insertFirst(unitsItem)
            },

            SpaceMenuItem {
                id: ffMenuItem
                color: workSpace.menuColor
                iconSource: "qrc:/icon-formation-fluids-64x64.png"

                onClick: workSpace.insertFirst(ffItem)
            },

            SpaceMenuItem {
                id: wrMenuItem
                color: workSpace.menuColor
                iconSource: "qrc:/icon-well-reservoir-64x64.png"

                onClick: workSpace.insertFirst(wrItem)
            },

            SpaceMenuItem {
                id: zonesMenuItem
                color: workSpace.menuColor
                iconSource: "qrc:/icon-zones-64x64.png"

                onClick: workSpace.insertFirst(zonesItem)
            },

            SpaceMenuItem {
                id: wellboreMenuItem
                color: workSpace.menuColor
                iconSource: "qrc:/icon-wellbore-64x64.png"

                onClick: workSpace.insertFirst(wellBoreItem)
            },

            SpaceMenuItem {
                id: gsMenuItem
                color: workSpace.menuColor
                iconSource: "qrc:/icon-gun-system-64x64.png"

                onClick: workSpace.insertFirst(gsItem)
            },

            SpaceMenuItem {
                id: outputMenuItem
                color: workSpace.menuColor
                iconSource: "qrc:/icon-output-64x64.png"

                onClick: workSpace.insertFirst(outputItem)
            },

            SpaceMenuItem {
                id: fullScreenMenuItem
                color: workSpace.menuColor
                iconSource: "qrc:/icon-fullscreen-64x64.png"

                onClick:  mainWindow.visibility = mainWindow.visibility == Window.Windowed ? Window.FullScreen : Window.Windowed;
            }

        ]

        SpaceItem {
            id: jobItem
            anchors.fill: parent
            title: "job"

            Rectangle {
                anchors.fill: parent
                color: "red"

                Text {
                    anchors.centerIn: parent
                    text: jobItem.title
                }
            }
        }

        SpaceItem {
            id: unitsItem
            anchors.fill: parent
            title: "units"

            Rectangle {
                anchors.fill: parent
                color: "green"

                Text {
                    anchors.centerIn: parent
                    text: unitsItem.title
                }
            }
        }

        SpaceItem {
            id: ffItem
            anchors.fill: parent
            title: "ff"

            Rectangle {
                anchors.fill: parent
                color: "blue"

                Text {
                    anchors.centerIn: parent
                    text: ffItem.title
                }
            }
        }

        SpaceItem {
            id: wrItem
            anchors.fill: parent
            title: "wr"

            Rectangle {
                anchors.fill: parent
                color: "yellow"

                Text {
                    anchors.centerIn: parent
                    text: wrItem.title
                }
            }
        }

        SpaceItem {
            id: zonesItem
            anchors.fill: parent
            title: "zones"

            Rectangle {
                anchors.fill: parent
                color: "purple"

                Text {
                    anchors.centerIn: parent
                    text: zonesItem.title
                }
            }
        }

        SpaceItem {
            id: wellBoreItem
            anchors.fill: parent
            title: "wellbore"

            Rectangle {
                anchors.fill: parent
                color: "aqua"

                Text {
                    anchors.centerIn: parent
                    text: wellBoreItem.title
                }
            }
        }

        SpaceItem {
            id: gsItem
            anchors.fill: parent
            title: "gs"

            Rectangle {
                anchors.fill: parent
                color: "violet"

                Text {
                    anchors.centerIn: parent
                    text: gsItem.title
                }
            }
        }

        SpaceItem {
            id: outputItem
            anchors.fill: parent
            title: "output"

            Rectangle {
                anchors.fill: parent
                color: "silver"

                Text {
                    anchors.centerIn: parent
                    text: outputItem.title
                }
            }
        }
    }       
}
