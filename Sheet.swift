// Toggling a sheet on top of the main view

import SwiftUI

struct Exploration: View
{
    @State private var sheetVisible: Bool = false

    var body: some View
    {
        ZStack
        {
            Color.orange.ignoresSafeArea()

            Button(action: { sheetVisible.toggle() }, label:
            {
                Text("Toggle Sheet")
                    .foregroundColor(.orange)
                    .padding()
                    .background(Color.white)
            })


        }
        .sheet(isPresented: $sheetVisible, content: { SomeSheet()} )
    }
}

struct SomeSheet: View
{
    @Environment(\.presentationMode) var presentationMode

    var body: some View
    {
        ZStack(alignment: .topTrailing)
        {
            Color.red.ignoresSafeArea()

            Button(action:
            {
                presentationMode.wrappedValue.dismiss()
            },
            label:
            {
                Image(systemName: "xmark.circle")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .padding()
            })

        }
    }
}

struct PreviewMain: PreviewProvider
{
    static var previews: some View
    {
        Exploration()
    }
}

struct PreviewSheet: PreviewProvider
{
    static var previews: some View
    {
        SomeSheet()
    }
}
