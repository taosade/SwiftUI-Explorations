import SwiftUI

struct OnSubmitView: View
{
    @State private var input: String = ""

    var body: some View
    {
        TextField("Enter something to send...", text: $input)
            .onSubmit
            {
                print("Submitted text: \(input)")

                input = ""
            }
            .submitLabel(.send)
            .padding()
            .background(Color.black.opacity(0.1))
            .padding()
    }
}

struct Preview: PreviewProvider
{
    static var previews: some View
    {
        OnSubmitView()
    }
}
