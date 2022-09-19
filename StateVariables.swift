// Exploring @State variables behavior

import SwiftUI

struct StateVariables: View
{
    let colors: [Color] = [
        .red, .blue, .orange, .green,
        .mint, .brown, .cyan, .gray,
        .indigo, .pink, .purple, .teal, .yellow
    ]

    @State var backgroundColor: Color = Color.gray
    @State var counterColor: Color = Color.black
    @State var title: String = "No buttons were pressed"
    @State var count: Int = 0

    var body: some View
    {
        ZStack
        {
            backgroundColor.ignoresSafeArea()

            VStack(spacing: 50)
            {
                Text(title).font(.title)

                Text(String(count)).font(.largeTitle)
                    .foregroundColor(counterColor)
                    .background(Circle().fill(Color.white).frame(width: 100, height: 100))

                HStack(spacing: 20)
                {
                    Button("Button #1")
                    {
                        var newColor: Color

                        repeat { newColor = colors.randomElement()! }
                        while newColor == .gray || newColor == backgroundColor

                        backgroundColor = newColor

                        title = "Button #1 was pressed"

                        count += 1
                    }

                    Button("Button #2")
                    {
                        var newColor: Color

                        repeat { newColor = colors.randomElement()! }
                        while newColor == .gray || newColor == counterColor

                        counterColor = newColor

                        title = "Button #2 was pressed"

                        if count > 0 { count -= 1 }
                    }
                }
                .font(.title)
                .foregroundColor(Color.black)
            }
        }
    }
}

struct StateVariables_Previews: PreviewProvider
{
    static var previews: some View
    {
        StateVariables()
    }
}
