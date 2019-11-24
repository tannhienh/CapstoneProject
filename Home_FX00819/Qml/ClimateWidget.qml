import QtQuick 2.13

Item {
    id: climate

    Rectangle {
        id: climateBg
        color: "#1B1B1B"
        opacity: 0.5
        anchors.fill: parent
    }

    Item {
        id: climateTitle
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height * 0.2 // 110

        Text {
            text: "Climate"
            color: "White"
            font.pixelSize: 36
            font.family: firaSans.name
            anchors.centerIn: parent
        }
    }

    Item {
        id: position
        anchors.top: climateTitle.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height * 0.12 // 66

        Item {
            id: driverTextItem
            width: parent.width * 0.35// / 3 // 205
            height: parent.height
            anchors.left: parent.left

            Text {
                id: driverText
                text: "DRIVER"
                color: "White"
                font.pixelSize: 32
                font.family: ubuntu.name
                anchors.centerIn: parent
            }

            Image {
                id: lineDriver
                source: "qrc:/Images/Climate/widget_climate_line.png"
                width: driverText.width // 111
                anchors.top: driverText.bottom
                anchors.horizontalCenter: driverText.horizontalCenter
            }
        }

        Item {
            id: passengerTextItem
            width: parent.width * 0.35 // / 3 // 205
            height: parent.height
            anchors.right: parent.right

            Text {
                id: passengerText
                text: "PASSENGER"
                color: "White"
                font.pixelSize: 32
                font.family: ubuntu.name
                anchors.centerIn: parent
            }

            Image {
                id: linePassenger
                source: "qrc:/Images/Climate/widget_climate_line.png"
                width: passengerText.width // 175
                anchors.top: passengerText.bottom
                anchors.horizontalCenter: passengerText.horizontalCenter
            }
        }
    }


    Image {
        id: windBg
        source: "qrc:/Images/Climate/widget_climate_wind_level_0.png"
        anchors.centerIn: parent
    }

    Image {
        source: "qrc:/Images/Climate/widget_climate_wind_level_4.png"
        anchors.centerIn: parent
    }

    Image {
        id: seatDriver
        source: "qrc:/Images/Climate/widget_climate_arrow_seat.png"
        x: 91
        y: 215
    }

    Image {
        id: faceArrowDriver
        source: "qrc:/Images/Climate/widget_climate_arrow_face_cold.png"
        x: 60//52
        y: 238
    }

    Image {
        id: footArrowDriver
        source: "qrc:/Images/Climate/widget_climate_arrow_foot_cold.png"
        x: 35 //28
        y: 250 //257
    }

    Image {
        id: seatPassenger
        source: "qrc:/Images/Climate/widget_climate_arrow_seat.png"
        x: 490
        y: 215
    }

    Image {
        id: faceArrowPassenger
        source: "qrc:/Images/Climate/widget_climate_arrow_face_cold.png"
        x: 458 //450
        y: 238
    }

    Image {
        id: footArrowPassenger
        source: "qrc:/Images/Climate/widget_climate_arrow_foot_cold.png"
        x: 433 // 426
        y: 250 // 257
    }

    Item {
        id: temperItem
        anchors.top: windBg.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height * 0.14 // 71.5


        Item {
            width: parent.width * 0.35
            height: parent.height
            anchors.left: parent.left

            Text {
                id: driverTemp
                text: climateModel.driver_temp + "\xB0C"
                color: "White"
                font.pixelSize: 55
                font.family: ubuntu.name
                anchors.centerIn: parent
            }
        }

        Item {
            width: parent.width * 0.3
            height: parent.height
            anchors.centerIn: parent

            Image {
                source: "qrc:/Images/Climate/widget_climate_ico_fan.png"
                anchors.centerIn: parent
            }
        }


        Item {
            width: parent.width * 0.35
            height: parent.height
            anchors.right: parent.right

            Text {
                id: passengerTemp
                text: climateModel.passenger_temp + "\xB0C"
                color: "White"
                font.pixelSize: 55
                font.family: ubuntu.name
                anchors.centerIn: parent
            }
        }
    }

    Item {
        id: modeItem
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: parent.height * 0.24 // 132

        Item {
            width: parent.width * 0.35
            height: parent.height
            anchors.left: parent.left

            Text {
                text: "AUTO"
                color: "White"
                font.pixelSize: 48
                font.family: cantarell.name
                anchors.centerIn: parent
            }
        }

        Item {
            width: parent.width * 0.3
            height: parent.height
            anchors.centerIn: parent

            Column {
                anchors.centerIn: parent
                spacing: 4
                Text {
                    text: "OUTSIDE"
                    color: "White"
                    font.pixelSize: 28
                    font.family: cantarell.name
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    text: "27.5" + "\xB0C"
                    color: "White"
                    font.pixelSize: 38
                    font.family: ubuntu.name
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }

        Item {
            width: parent.width * 0.35
            height: parent.height
            anchors.right: parent.right

            Text {
                text: "SYNC"
                color: "White"
                font.pixelSize: 48
                font.family: cantarell.name
                anchors.centerIn: parent
            }
        }
    }
}
