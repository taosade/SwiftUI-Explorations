// Stepper with custom bounds and step size

import SwiftUI

struct StepperView: View
{
    @State var circleWidth: CGFloat = 100
    
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                Circle()
                    .frame(width: circleWidth)
                    .animation(.default, value: circleWidth)

                Stepper("Size: \(Int(circleWidth))",
                    value: $circleWidth,
                    in: 100...200,
                    step: 20)
            }
            .navigationTitle("Adjust Size")
            .padding(.horizontal)
        }
    }
}

struct Preview: PreviewProvider
{
    static var previews: some View
    {
        StepperView()
    }
}
