import QtQuick 2.13
import QtQuick.Controls 2.13

ApplicationWindow {
    id: root

    // Screen Full HD 1920x1080 pixel
    visible: true
    visibility: "FullScreen"
//    width: 1920
//    height: 1080
    title: qsTr("Home Screen")

    //-----------------------------------------------------------------------//
    // Load Fonts from attached resource fonts.qrc

    // Font Cantarell
    FontLoader {
        id: cantarell
        source: "qrc:/Font/Cantarell-Regular.ttf"
    }

    // Font FiraSans
    FontLoader {
        id: firaSans
        source: "qrc:/Font/FiraSans-Regular.ttf"
    }

    // Font Helvetica
    FontLoader {
        id: helvetica
        source: "qrc:/Font/Helvetica-Neue-Regular.ttf"
    }

    // Font Ubuntu
    FontLoader {
        id: ubuntu
        source: "qrc:/Font/Ubuntu-Regular.ttf"
    }
    //-----------------------------------------------------------------------//

    // Background Image
    // 1920x1080
    Image {
        id: bgImage
        source: "qrc:/Images/Home/home_bg.png"
        anchors.fill: parent
    }

    // Status bar
    // width: 1920
    // height: 85
    StatusBar {
        id: statusBar
        onBackButtonClicked: mainAreaStackView.pop()
        isShowBackButton: mainAreaStackView.depth == 1 ? false : true
    }

    // Stack view Main Area
    // Main area: include Widgets area and Menu area
    // also Application area
    //
    // When open an application, corresponding application
    // was push into main area
    //
    // with: 1920
    // height: 995
    StackView {
        id: mainAreaStackView
        initialItem: MainArea{}
        anchors {
            top: statusBar.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        onCurrentItemChanged: {
            currentItem.forceActiveFocus()
        }
    }
}