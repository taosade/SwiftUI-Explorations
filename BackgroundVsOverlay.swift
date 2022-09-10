// Playing around with view's backgrounds and overlays

import SwiftUI

struct BackgroundVsOverlay: View
{
    var body: some View
    {
        Circle()
            .fill(Color.red)
            .frame(width: 200, height: 200)
            .background(
                Rectangle()
                    .fill(Color.orange)
                    .frame(width: 250, height: 250),
                alignment: .topLeading
            )
            .overlay(
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 100, height: 100),
                alignment: .bottomTrailing
            )
    }
}

struct Frame_Previews: PreviewProvider
{
    static var previews: some View
    {
        BackgroundVsOverlay()
    }
}
