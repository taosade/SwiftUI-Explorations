// Displaying context menu on tap and hold

import SwiftUI

struct ContextMenus: View
{
    @State private var backgroundColor: Color = .white

    var body: some View
    {
        ZStack
        {
            backgroundColor.ignoresSafeArea()

            HStack
            {
                Image(systemName: "hand.tap.fill")

                Text("Touch and hold")
            }
            .foregroundColor(.white)
            .padding()
            .background(.black)
            .cornerRadius(10)
            .contextMenu(menuItems:
            {
                Button("🍊 Orange")     { backgroundColor = .orange }
                Button("🍌 Banana")     { backgroundColor = .yellow }
                Button("🍓 Strawberry") { backgroundColor = .red    }
                Button("🥑 Avocado")    { backgroundColor = .green  }
                Button(
                    action: { backgroundColor = .white },
                    label: { Label("Reset", systemImage: "xmark.circle.fill") })
            })
        }
    }
}

struct Preview: PreviewProvider
{
    static var previews: some View
    {
        ContextMenus()
    }
}
