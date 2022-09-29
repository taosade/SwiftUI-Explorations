// Toggling full screen cover or a sheet

import SwiftUI

struct Exploration: View
{
    @State private var fullScreenCoverVisible: Bool = false
    @State private var sheetVisible: Bool = false

    var body: some View
    {
        ZStack
        {
            Color.orange.ignoresSafeArea()

            VStack(spacing: 20)
            {
                Button("Toggle Screen Cover")
                {
                    fullScreenCoverVisible.toggle()
                }

                Button("Toggle Sheet")
                {
                    sheetVisible.toggle()
                }
            }
            .padding()
            .background(Color.white)
        }
        .fullScreenCover(isPresented: $fullScreenCoverVisible, content: { SomeView()} )
        .sheet(isPresented: $sheetVisible, content: { SomeView()} )
    }
}

struct SomeView: View
{
    @Environment(\.presentationMode) var presentationMode

    var body: some View
    {
        ZStack(alignment: .topTrailing)
        {
            Color.red.ignoresSafeArea()

            Button(action: { presentationMode.wrappedValue.dismiss() },
            label:
            {
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
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

struct PreviewSomeView: PreviewProvider
{
    static var previews: some View
    {
        SomeView()
    }
}
