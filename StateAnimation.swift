// Basic animations on @State variable change

import SwiftUI

struct Animation: View
{
    @State private var rectangleState: Bool = false

    var body: some View
    {
        VStack()
        {
            Button("Toggle state: \(rectangleState.description)")
            {
                withAnimation(.default) { rectangleState.toggle() }
            }

            RoundedRectangle(cornerRadius: rectangleState ? 0 : 50)
                .fill(rectangleState ? Color.green : Color.red)
                .frame(
                    width: rectangleState ? 50 : 250,
                    height: rectangleState ? 50 : 250)
                .rotationEffect(Angle(degrees: rectangleState ? 0 : 180))
                .offset(x: 0, y: rectangleState ? 0 : 200)

            Spacer()
        }
    }
}

struct Animation_Previews: PreviewProvider
{
    static var previews: some View
    {
        Animation()
    }
}
