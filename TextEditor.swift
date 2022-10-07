// Text editor with a simple input handler

import SwiftUI

struct TextEditorView: View
{
    @State private var textValue: String = ""
    @State private var textShow: Bool = false

    var body: some View
    {
        NavigationView
        {
            VStack
            {
                NavigationLink(destination: Text(textValue), isActive: $textShow) {}

                TextEditor(text: $textValue).border(Color.black, width: 1)

                Button(action: { textShow = true }, label:
                {
                    Text("Show")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background { Color.black }
                })
            }
            .padding(.horizontal)
            .navigationTitle("Text Field")
        }
    }
}

struct Preview: PreviewProvider
{
    static var previews: some View
    {
        TextEditorView()
    }
}
