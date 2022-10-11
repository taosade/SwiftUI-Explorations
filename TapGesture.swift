// Catching tap (single/multiple) gestures

import SwiftUI

struct TapGestureView: View
{
    @State var state: Bool = true

    func myButton(_ title: String) -> some View
    {
        return Text(title)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background { Color.black }
            .cornerRadius(20)
    }

    var body: some View
    {
        VStack
        {
            RoundedRectangle(cornerRadius: 20)
                .fill(state ? .red : .orange)

            Button(
                action: { state.toggle() },
                label: { myButton("Regular button") })

            myButton("Tap gesture")
                .onTapGesture { state.toggle() }

            myButton("Double tap gesture")
                .onTapGesture(count: 2, perform:  { state.toggle() })
        }
        .padding()
    }
}

struct Preview: PreviewProvider
{
    static var previews: some View
    {
        TapGestureView()
    }
}
