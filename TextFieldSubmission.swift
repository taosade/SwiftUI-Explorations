// Submitting text field data with simple validation

import SwiftUI

struct TextFields: View
{
    @State private var alertShow: Bool = false
    @State private var alertTitle: String = ""
    @State private var textValue: String = ""
    @State private var textItems: [String] = []

    func addItem()
    {
        let textItem = textValue.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if textItem.isEmpty
        {
            alertShow = true; alertTitle = "Text field is empty!"

            return
        }

        if textItems.contains(textItem)
        {
            alertShow = true; alertTitle = "Text item already present!"

            return
        }

        textItems.append(textItem)

        textValue = ""
    }

    var body: some View
    {
        NavigationView
        {
            List
            {
                ForEach(textItems, id: \.self) { textItem in Text(textItem) }
            }
            .navigationTitle("Text Items")
            .toolbar
            {
                ToolbarItem(placement: .bottomBar)
                {
                    HStack
                    {
                        TextField("Type something", text: $textValue, onCommit: addItem)
                            .textFieldStyle(.roundedBorder)

                        Button(
                            action: addItem,
                            label: { Image(systemName: "return") })
                    }
                }
            }
        }.alert(isPresented: $alertShow) { Alert(title: Text(alertTitle)) }
    }
}

struct Preview: PreviewProvider
{
    static var previews: some View
    {
        TextFields()
    }
}
