// Color scheme adaptive colors demo

import SwiftUI

struct ColorSchemeView: View
{
    @Environment(\.colorScheme) var colorScheme

    func myCircle(_ color: Color) -> some View
    {
        return HStack
        {
            Text(color.description.capitalized).font(.title)

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

            myCircle(colorScheme == .light ? .green : .orange)
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
            ColorScheme().preferredColorScheme(.light)

            ColorScheme().preferredColorScheme(.dark)
        }
    }
}
