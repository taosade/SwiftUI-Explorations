// Color scheme adaptive colors demo

import SwiftUI

struct ColorSchemeView: View
{
    @Environment(\.colorScheme) var colorScheme

    func myCircle(_ color: Color, adaptive: Bool = false) -> some View
    {
        return HStack
        {
            Text(adaptive ? "Adaptive \(color.description)" : color.description.capitalized)
                .font(.title)

            Spacer()

            Circle().fill(color).frame(width: 100, height: 100)
        }
    }

    var body: some View
    {
        VStack(spacing: 30)
        {
            myCircle(.primary)

            myCircle(.secondary)

            myCircle(.black)

            myCircle(.white)

            myCircle(
                colorScheme == .light ? .green : .orange,
                adaptive: true)
        }
        .padding(.horizontal)
    }
}

struct Preview: PreviewProvider
{
    static var previews: some View
    {
        Group
        {
            ColorSchemeView().preferredColorScheme(.light)

            ColorSchemeView().preferredColorScheme(.dark)
        }
    }
}
