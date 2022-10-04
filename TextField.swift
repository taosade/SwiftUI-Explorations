// Simple textfield

import SwiftUI

struct TextFields: View
{
    @State private var showAlert: Bool = false
    @State private var textValue: String = ""

    var body: some View
    {
        ZStack
        {
            Color.orange.ignoresSafeArea()

            HStack
            {
                TextField("Type something", text: $textValue)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading)

                Button(action: { showAlert = true }, label:
                {
                    Image(systemName: "return")
                        .foregroundColor(.white)
                        .padding(.trailing)
                })
            }
        }.alert(isPresented: $showAlert)
        {
            Alert(title: Text(textValue.trimmingCharacters(in: .whitespacesAndNewlines).count == 0 ? "Text field is empty" : textValue))
        }
    }
}

struct Preview: PreviewProvider
{
    static var previews: some View
    {
        TextFields()
    }
}
