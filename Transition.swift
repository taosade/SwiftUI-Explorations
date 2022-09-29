// View transition from bottom of the screen

import SwiftUI

struct Transitions: View
{
    @State var showRectangle: Bool = false

    var body: some View
    {
        ZStack(alignment: .bottom)
        {
            VStack
            {
                Button("Toggle transition state")
                {
                    withAnimation()
                    {
                        showRectangle.toggle()
                    }
                }

                Spacer()
            }

            if showRectangle
            {
                RoundedRectangle(cornerRadius: 35)
                    .frame(height: UIScreen.main.bounds.height / 2)
                    .transition(.move(edge: .bottom))
            }
        }.ignoresSafeArea(edges: .bottom)
    }
}

struct Transitions_Previews: PreviewProvider
{
    static var previews: some View
    {
        Transitions()
    }
}
