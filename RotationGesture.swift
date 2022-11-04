// Handling rotation gesture while preserving the agle

import SwiftUI

struct RotationGestureView: View
{
	@State private var angleValue: Angle = Angle()
	@State private var angleSaved: Angle = Angle()

	var body: some View
	{
		Text("\(Image(systemName: "arrow.triangle.2.circlepath")) Rotate me!")
		.font(.largeTitle)
		.rotationEffect(angleValue)
		.gesture(RotationGesture()
			.onChanged { value in angleValue = angleSaved + value }
			.onEnded { value in angleSaved = angleValue })
	}
}

struct RotationGestureView_Previews: PreviewProvider
{
	static var previews: some View
	{
		RotationGestureView()
	}
}
