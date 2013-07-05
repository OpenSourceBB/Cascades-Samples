import bb.cascades 1.0

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
            text: ListItemData.chrono
        }
    }
}
