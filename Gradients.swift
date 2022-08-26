// SwiftUI's gradients demo

import SwiftUI

struct Gradients: View
{
    var body: some View
    {
        ScrollView
        {
            VStack(spacing: 0)
            {
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.white]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing))
                    .aspectRatio(1, contentMode: .fit)

                Rectangle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [Color.white, Color.orange]),
                            center: .center,
                            startRadius: 0,
                            endRadius: 300))
                    .aspectRatio(1, contentMode: .fit)

                Rectangle()
                    .fill(
                        AngularGradient(
                            gradient: Gradient(colors: [Color.white, Color.purple]),
                            center: .center,
                            angle: .degrees(90)))
                    .aspectRatio(1, contentMode: .fit)

                Rectangle()
                    .fill(
                        EllipticalGradient(
                            gradient: Gradient(colors: [Color.white, Color.mint]),
                            center: .center,
                            startRadiusFraction: 0,
                            endRadiusFraction: 1))
                    .aspectRatio(2, contentMode: .fit)
            }
        }
    }
}

struct Gradients_Previews: PreviewProvider
{
    static var previews: some View
    {
        Gradients()
    }
}
