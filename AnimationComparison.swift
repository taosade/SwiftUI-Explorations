// Comparing SwiftUI's default animation curves

import SwiftUI

struct ExampleRectangle: View
{
    let animation: Animation?

    @Binding var state: Bool

    var body: some View
    {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.red)
            .frame(width: state ? 50 : 250, height: 50)
            .animation(animation, value: state)
    }
}

struct AnimationComparison: View
{
    @State private var rectangleState: Bool = false

    let duration: Double = 5

    var body: some View
    {
        VStack()
        {
            Button("Toggle state: \(rectangleState.description)")
            {
                rectangleState.toggle()
            }

            ExampleRectangle(animation: .default, state: $rectangleState)
            ExampleRectangle(animation: .easeIn(duration: 2), state: $rectangleState)
            ExampleRectangle(animation: .easeOut(duration: 2), state: $rectangleState)
            ExampleRectangle(animation: .easeInOut(duration: 2), state: $rectangleState)
            ExampleRectangle(animation: .linear(duration: 2), state: $rectangleState)
            ExampleRectangle(animation: .spring(response: 1, dampingFraction: 0.2, blendDuration: 2), state: $rectangleState)

            Spacer()
        }
    }
}

struct AnimationComparison_Previews: PreviewProvider
{
    static var previews: some View
    {
        AnimationComparison()
    }
}
