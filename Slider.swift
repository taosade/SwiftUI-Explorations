// Sliders binded to floating point variable

import SwiftUI

struct SliderView: View
{
    @State var sliderValue: Double = 10

    var body: some View
    {
        VStack(spacing: 50)
        {
            Slider(value: $sliderValue, in: 0...20)
                .accentColor(.red)

            Text("\(sliderValue)").font(.largeTitle)

            Slider(
                value: $sliderValue,
                in: 0...20,
                step: 1,
                label: { Text("Slider") },
                minimumValueLabel: { Text("Min") },
                maximumValueLabel: { Text("Max") })
                .labelsHidden()
        }
        .padding(.horizontal)
    }
}

struct Preview: PreviewProvider
{
    static var previews: some View
    {
        SliderView()
    }
}
