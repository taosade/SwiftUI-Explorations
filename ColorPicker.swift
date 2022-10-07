// Color picker binded to view's background color

import SwiftUI

struct ColorPickerView: View
{
    @State var selectedColor: Color = .orange

    var body: some View
    {
        ZStack
        {
            selectedColor.ignoresSafeArea()

            ColorPicker(
                "Pick Color",
                selection: $selectedColor,
                supportsOpacity: false)
                .padding()
                .background { Color.white }
        }
    }
}

struct Preview: PreviewProvider
{
    static var previews: some View
    {
        ColorPickerView()
    }
}
