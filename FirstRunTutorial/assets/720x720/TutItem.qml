import bb.cascades 1.0
//This is the ListItemComponent created for the list view on a Q10/Q5.
Container {
    id: testing
    layout: DockLayout {
    }
    preferredWidth: 720.0
    preferredHeight: 720.0
    verticalAlignment: VerticalAlignment.Fill
    horizontalAlignment: HorizontalAlignment.Fill
    Container {
        verticalAlignment: VerticalAlignment.Center
        horizontalAlignment: HorizontalAlignment.Center
        leftPadding: 20.0
        topPadding: 20.0
        rightPadding: 20.0
        bottomPadding: 20.0
        Label {
            //this is where  pull the data from the XML file and tell it which data to use for the label
            text: ListItemData.title + ListItemData.info
            textStyle.fontSize: FontSize.PointValue
            textStyle.fontWeight: FontWeight.W100
            textStyle.fontSizeValue: 10.0
            textStyle.textAlign: TextAlign.Center
            multiline: true
            horizontalAlignment: HorizontalAlignment.Fill
        }
    }
    Container {
        verticalAlignment: VerticalAlignment.Bottom
        horizontalAlignment: HorizontalAlignment.Center
        bottomPadding: 25.0
        Label {
            //this is a page number also pulled from the XML
            text: ListItemData.chrono
        }
    }
}
