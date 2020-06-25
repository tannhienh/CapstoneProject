import QtQuick 2.13
import QtQuick.Controls 2.13

Item {
    id: listRecents

    ListModel {
        id: listRecentsModel

        ListElement {
            ContactName: "Daniel Nguyen"
            ContactNumber: "+84345657328"
            CallStatus: "Call Received"
            Time: "09:20 May 30"
        }

        ListElement {
            ContactName: "Paul Dao"
            ContactNumber: "+84345657324"
            CallStatus: "Call Made"
            Time: "20:30 Jun 20"
        }

        ListElement {
            ContactName: "Jonh Wick"
            ContactNumber: "+84345657323"
            CallStatus: "Call Missed"
            Time: "08:45 Jun 06"
        }

        ListElement {
            ContactName: "Michael Tran"
            ContactNumber: "+84345657329"
            CallStatus: "Call Missed Outgoing"
            Time: "23:05 Mar 02"
        }

        ListElement {
            ContactName: "Daniel Nguyen"
            ContactNumber: "+84345657328"
            CallStatus: "Call Received"
            Time: "09:20 May 30"
        }

        ListElement {
            ContactName: "Paul Dao"
            ContactNumber: "+84345657324"
            CallStatus: "Call Made"
            Time: "20:30 Jun 20"
        }

        ListElement {
            ContactName: "Jonh Wick"
            ContactNumber: "+84345657323"
            CallStatus: "Call Missed"
            Time: "08:45 Jun 06"
        }

        ListElement {
            ContactName: "Michael Tran"
            ContactNumber: "+84345657329"
            CallStatus: "Call Missed Outgoing"
            Time: "23:05 Mar 02"
        }
    }

    Component {
        id: listRecentsDelegate

        Item {
            width: parent.width
            height: 147

            Text {
                id: contactName
                text: ContactName
                color: "#FFFFFF"
                font.pixelSize: 36
                font.family: ubuntu.name
                anchors {
                    top: parent.top
                    topMargin: 30
                    left: parent.left
                    leftMargin: 40
                }
            }

            Image {
                id: callStatusIcon

                property var srcIcon: "qrc:/Apps/Phone/images/"

                anchors {
                    left: contactName.left
                    verticalCenter: contactNumber.verticalCenter
                }

                source: if (CallStatus === "Call Received")
                            return srcIcon + "call_received.png"
                        else if (CallStatus === "Call Made")
                            return srcIcon + "call_made.png"
                        else if (CallStatus === "Call Missed")
                            return srcIcon + "call_missed"
                        else if (CallStatus === "Call Missed Outgoing")
                            return srcIcon + "call_missed_outgoing"
            }

            Text {
                id: contactNumber
                text: ContactNumber
                color: "#bebebe"
                font.pixelSize: 30
                font.family: ubuntu.name
                anchors {
                    top: contactName.bottom
                    topMargin: 16
                    left: callStatusIcon.right
                    leftMargin: 20
                }
            }

            Text {
                id: timeCall
                text: Time
                color: "#bebebe"
                font.pixelSize: 30
                font.family: ubuntu.name
                anchors {
                    left: parent.left
                    leftMargin: parent.width / 2
                    verticalCenter: contactNumber.verticalCenter
                }
            }

            Image {
                id: callIcon
                source: "qrc:/Apps/Phone/images/call_icon.png"
                anchors {
                    right: parent.right
                    rightMargin: 20
                    verticalCenter: parent.verticalCenter
                }
            }

            Rectangle {
                id: lineBottomItem
                width: parent.width
                height: 2
                anchors.bottom: parent.bottom
                gradient: Gradient {
                    orientation: Gradient.Horizontal
                    GradientStop { position: 0.0; color: "#00474747" }
                    GradientStop { position: 0.5; color: "#a4a4a4" }
                    GradientStop { position: 1.0; color: "#00474747" }
                }
            }
        }
    }

    ListView {
        id: listViewRecents
        anchors.fill: parent
        model: listRecentsModel
        delegate: listRecentsDelegate
        clip: true
        snapMode: ListView.SnapToItem

        // Scrollbar for list recents
        ScrollBar.vertical: ScrollBar {
            parent: listViewRecents.parent
            width: 10
            snapMode: ScrollBar.SnapOnRelease
            anchors {
                top: listViewRecents.top
                left: listViewRecents.right
                leftMargin: 4
                bottom: listViewRecents.bottom
            }
        }
    }
}
