import bb.cascades 1.0

Page {
    Container {
        TextField {
            id: inputField
            objectName: "inputField"
            
            input {
                onSubmitted: {
                    //Here is where we save the value or string
                    _app.saveValueFor(inputField.objectName, inputField.text)
                    outputText.text = inputField.text
                    instructionsLabel.visible = false
                    testLabel.visible = true
                }
            }
        
        }
        Label {
            id: outputText
            //Here is where we call or get that value and display it
            text: _app.getValueFor(inputField.objectName, "No Text Set")
            textStyle.base: SystemDefaults.TextStyles.BigText
        }
        Container {
            id: instructionsLabel
            topPadding: 100.0
            visible: true
            Label {
                text: "Type a string of text into the field above and press enter."
                multiline: true
                textStyle.fontSize: FontSize.Large
                textStyle.fontWeight: FontWeight.W100
            }
        }
        Container {
            id: testLabel
            topPadding: 100.0
            visible: false
            Label {
                text: "Now close the app, and the Label above should still have the text you set it to when you open the app back up!"
                multiline: true
                textStyle.fontSize: FontSize.Large
                textStyle.fontWeight: FontWeight.W100
                textStyle.color: Color.Red
            }
        }
    }
}
