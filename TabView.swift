import SwiftUI

struct MyTabView: View
{
    let colors: [Color] = [.red, .green, .blue]

    @State var selectedColor: Color = .red

    var body: some View
    {
        TabView(selection: $selectedColor)
        {
            ForEach(colors, id: \.self)
            {
                color in ColorTab(colors: colors, selectedColor: $selectedColor)
                    .tabItem { Label(color.description.capitalized, systemImage: "paintbrush.pointed") }
                    .tag(color)
            }
        }.accentColor(selectedColor)
    }
}

struct ColorTab: View
{
    let colors: [Color]

    @Binding var selectedColor: Color

    var body: some View
    {
        NavigationView
        {
            ZStack
            {
                selectedColor

                HStack
                {
                    ForEach(colors, id: \.self)
                    {
                        color in if color != selectedColor
                        {
                            Button(action: { selectedColor = color}, label:
                            {
                                Circle()
                                    .fill(color)
                                    .frame(width: 100, height: 100)
                            })
                        }
                    }
                }
            }.navigationTitle(selectedColor.description.capitalized)
        }
    }
}

struct Preview: PreviewProvider
{
    static var previews: some View
    {
        MyTabView()
    }
}
