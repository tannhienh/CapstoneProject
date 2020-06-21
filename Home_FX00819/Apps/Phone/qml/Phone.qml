import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.VirtualKeyboard 2.13
import QtQuick.VirtualKeyboard.Styles 2.13
import QtQuick.VirtualKeyboard.Settings 2.13

Item {
    id: phoneItem

    PhoneContacts {
        id: phoneContacts
        width: (parent.width / 3) + 4
        topMargin: 85
        visible: true
        height: parent.height - 85
    }

    PhoneInputArea {
        width: parent.width - (phoneContacts.position * phoneContacts.width) - 80
        anchors {
            top: parent.top
            right: parent.right
            bottom: parent.bottom
            margins: 40
        }
    }

    // Keyboard for input search contacts
    InputPanel {
        id: keyboardMap
        y: parent.height
        anchors.left: parent.left
        anchors.right: parent.right

        states: State {
            name: "ShowKeyboard"
            when: Qt.inputMethod.visible
            PropertyChanges {
                target: keyboardMap
                y: parent.height - keyboardMap.height
            }
        }

        transitions: Transition {
            from: ""
            to: "ShowKeyboard"
            reversible: true
            NumberAnimation {
                property: "y"
                duration: 400
                easing.type: Easing.InOutQuad
            }
        }
    }

    Connections {
        target: statusBar
        onBackButtonClicked: {
            phoneContacts.close()
        }
    }
}
