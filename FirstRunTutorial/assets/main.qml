import bb.cascades 1.0

Page {
    id: popUp
    objectName: "popUp"
    property bool firstRun: app.getValueFor(popUp.objectName, true)

    Container {
        layout: DockLayout {
        }
        verticalAlignment: VerticalAlignment.Fill
        horizontalAlignment: HorizontalAlignment.Fill
        Container {
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            Container {
                Label {
                    text: "Status"
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle.fontSize: FontSize.PointValue
                    textStyle.fontSizeValue: 12.0
                    textStyle.fontWeight: FontWeight.W400
                    textStyle.textAlign: TextAlign.Center
                    multiline: true
                }
            }
            Label {
                text: if (firstRun != false) {
                    "Popups Enabled"
                } else {
                    "Popups Disabled"
                }
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                textStyle.fontSize: FontSize.PointValue
                textStyle.fontSizeValue: 8.0
                textStyle.fontWeight: FontWeight.W100
                textStyle.textAlign: TextAlign.Center
            }
            Button {
                horizontalAlignment: HorizontalAlignment.Center
                text: "Reset"
                onClicked: {
                    firstRun = true
                    app.saveValueFor(popUp.objectName, popUp.firstRun)
                }
            }
        }
        attachedObjects: [
            Sheet {
                id: tutorialSheet
                Page {
                    titleBar: TitleBar {
                        id: tBar
                        acceptAction: ActionItem {
                            title: "Close"
                            onTriggered: {
                                tutorialSheet.close()
                            }
                        }
                        dismissAction: ActionItem {
                            id: dismissForever
                            title: "Dismiss"
                            onTriggered: {
                                tutorialSheet.close()
                                popUp.firstRun = false
                                app.saveValueFor(popUp.objectName, popUp.firstRun)
                            }
                        }
                        title: "Tutorial"
                    }
                    ListView {
                        id: tutList
                        layout: StackListLayout {
                            orientation: LayoutOrientation.LeftToRight
                        }
                        scrollIndicatorMode: ScrollIndicatorMode.None
                        flickMode: FlickMode.SingleItem
                        dataModel: XmlDataModel {
                            source: "tutorial.xml"
                        }
                        listItemComponents: [
                            ListItemComponent {
                                type: "item"
                                TutItem {
                                }
                            }
                        ]

                    }
                }
            }
        ]
    }
    onCreationCompleted: {
        if (firstRun != false) {
            tutorialSheet.open()
        }
    }
}
