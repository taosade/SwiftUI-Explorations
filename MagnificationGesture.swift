// Handling magnification gestures (pinch to zoom)

import SwiftUI

struct MagnificationGestureView: View
{
	@State private var magnifyAmountC: CGFloat = 0
	@State private var magnifyAmountR: CGFloat = 0

	@State private var magnifySavedAmount: CGFloat = 0

	var body: some View
	{
		VStack(spacing: 100)
		{
			// Magnification bounces once the view is let go

			Circle()
			.fill(.orange)
			.frame(width: 100, height: 100)
			.scaleEffect(1 + magnifyAmountC)
			.gesture(
				MagnificationGesture()
				.onChanged { value in if value > 1 {  magnifyAmountC = value - 1 } }
				.onEnded { _ in withAnimation { magnifyAmountC = 0 } })

			// Magnification stays once the view is let go

			Rectangle()
			.fill(.orange)
			.frame(width: 100, height: 100)
			.scaleEffect(1 + magnifyAmountR + magnifySavedAmount)
			.gesture(
				MagnificationGesture()
				.onChanged { value in magnifyAmountR = value - 1 }
				.onEnded
				{
					_ in

					magnifySavedAmount += magnifyAmountR

					magnifyAmountR = 0
				})
		}
	}
}

struct LongPressGesture_Previews: PreviewProvider
{
	static var previews: some View
	{
		MagnificationGestureView()
	}
}
