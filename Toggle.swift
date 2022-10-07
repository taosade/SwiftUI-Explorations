// Toggles with booleans binded

import SwiftUI

struct ToggleView: View
{
    @State private var red:   Bool = false
    @State private var green: Bool = false
    @State private var blue:  Bool = false

    var body: some View
    {
        NavigationView
        {
            VStack
            {
                Toggle("Red", isOn: $red).toggleStyle(SwitchToggleStyle(tint: .red))

                Toggle("Green", isOn: $green).toggleStyle(SwitchToggleStyle(tint: .green))

                Toggle("Blue", isOn: $blue).toggleStyle(SwitchToggleStyle(tint: .blue))

                Circle().foregroundColor(Color(
                    red: red     ? 1 : 0,
                    green: green ? 1 : 0,
                    blue: blue   ? 1 : 0))
            }
            .padding(.horizontal)
            .navigationTitle("Toggle Colors")
        }
    }
}

struct Preview: PreviewProvider
{
    static var previews: some View
    {
        ToggleView()
    }
}
