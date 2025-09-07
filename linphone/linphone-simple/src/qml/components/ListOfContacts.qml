import QtQuick 2.4
import Ubuntu.Components 1.3
import QtQuick.LocalStorage 2.0

import "../js/db.js" as FavContactsDB
import Linphone 1.0

Column {

    anchors.horizontalCenter: parent.horizontalCenter

    ListView {
        id: listOfContacts
        interactive: false
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter

        height: units.gu(7) * contactsModel.count

        model: contactsModel
        delegate: contactsDelegate
    }

    Component {
        id: contactsDelegate

        ListItem {
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            divider.visible: false
            clip: true
            highlightColor: "transparent"

            leadingActions: ListItemActions {
                actions: Action {
                    iconName: "delete"
                    text: i18n.tr("Delete")
                    onTriggered: {
                        FavContactsDB.deleteContact(model.id)
                        contactsModel.initialize()
                    }
                }
            }

            trailingActions: ListItemActions {
                actions: Action {
                        iconName: "contact-new"
                        text: i18n.tr("Add")

                        onTriggered: {
                            for (var i = 0; i < favoriteContacts.children.length; i++) {
                                if (favoriteContacts.children[i].emptyFavContact) {

                                    var id = favoriteContacts.children[i].identifier
                                    var name = sip_addr.split("@")[0]
                                    FavContactsDB.storeFavContact(Date(), id, name, sip_addr, "icon")

                                    favoriteContacts.children[i].updateFavContact()

                                    break
                                }
                            }
                        }
                    }
            }

            MouseArea {
                anchors.left: parent.left
                anchors.right: parent.right
                height: layout.height

                onClicked: {
                    mainCol.visible = !mainCol.visible
                    outgoingCallComponent.showId = sip_addr.split("@")[0]
                    outgoingCallComponent.showDomain = sip_addr.split("@")[1]
                    Linphone.call(sip_addr)
                    onCallFav = true
                    onCall = true

                    //You call a favorite contact so disable the speaker
                    Linphone.disableSpeaker();
                    speakerEnabled = false;
                }

                ListItemLayout {
                    id:layout
                    title.text: name //sip_addr.split("@")[0]
                    title.color: theme.sip_addr === "Ubuntu.Components.Themes.SuruDark"
                        ? Theme.palette.normal.baseText
                        : darkColor

                    //subtitle.text: i18n.tr("")
                    summary.text: sip_addr

                    width: parent.width
                    anchors.horizontalCenter: parent.horizontalCenter

                    Image {
                        SlotsLayout.position: SlotsLayout.Leading
                        sourceSize.width: units.gu(4.5)
                        sourceSize.height: width
                        source: "../../assets/contact-grey.svg"
                    }

                    Icon {
                        name: "call-start"
                        SlotsLayout.position: SlotsLayout.Trailing
                        width: units.gu(2.5)
                        color: lighterColor
                    }
                }
            }
        }
    }

    ListModel {
        id: contactsModel
        Component.onCompleted: initialize()

        function initialize() {
            contactsModel.clear();

            var contacts = FavContactsDB.getLatestContacts()

            //Newer recent contacts on top
            for (var i = contacts.rows.length; i >= 0 ; --i) {
                if (contacts.rows.item(i)) {
                    contactsModel.append({
                        name: contacts.rows.item(i).sipaddress,
                        sip_addr: contacts.rows.item(i).sipaddress,
                        id: contacts.rows.item(i).identifier
                    });
                }
            }
        }
    }

    Connections {
        target: mainPage
        onUpdateContactList: contactsModel.initialize()
    }
}
