import bb.cascades 1.0

Page {
    id: popUp
    //Here we need an objectName so we can use Qsettings to store a bool property
    objectName: "popUp"
    //This is the bool property that will determine if the tutorial should pop up or not
    property bool firstRun: _app.getValueFor(popUp.objectName, true)

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
                    //This will reset the bool value to default so the tutorial 
                    //will launch next time the app is run
                    firstRun = true
                    //What we do here is set the bool property to true then save it
                    _app.saveValueFor(popUp.objectName, popUp.firstRun)
                }
            }
        }
        attachedObjects: [
            Sheet {
                id: tutorialSheet
                //For this sample I chose to use a sheet for the "pop up" tutorial
                Page {
                    titleBar: TitleBar {
                        id: tBar
                        acceptAction: ActionItem {
                            title: "Close"
                            onTriggered: {
                                //for this action we simply close the sheet without storing any new value
                                tutorialSheet.close()
                            }
                        }
                        dismissAction: ActionItem {
                            id: dismissForever
                            title: "Dismiss"
                            onTriggered: {
                                //Dismissing the tutorial will result in the tutorial sheet being closed
                                tutorialSheet.close()
                                //but it will also set the bool property to false 
                                popUp.firstRun = false
                                //and store it to prevent the tutorial from opening on the next launch
                                _app.saveValueFor(popUp.objectName, popUp.firstRun)
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
                            //this is the xml file that contains all the information that appears on 
                            //the slides of the tutorial
                            source: "tutorial.xml"
                        }
                        listItemComponents: [
                            ListItemComponent {
                                type: "item"
                                //here we are calling in a custom ListItemComponent (the TutItem.qml file)
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
        //when the main.qml is created (app is launched) we check the bool property to see if the 
        //tutorial needs to run or not
        if (firstRun != false) {
            //So if the bool property isn't false, the tutorial sheet will automatically open
            tutorialSheet.open()
        }
    }
}
