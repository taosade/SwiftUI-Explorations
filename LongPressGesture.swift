// Handling long press gestures, finished and abandoned

import SwiftUI

struct LongPressGesture: View
{
	@State private var beingFilled: Bool = false

	@State private var isFilled: Bool = false

	var body: some View
	{
		VStack
		{
			Spacer(minLength: 0)

			Rectangle()
			.fill(isFilled ? Color.green :  Color.accentColor)
			.frame(maxHeight: beingFilled ? .infinity : 100)
			.onTapGesture
			{
				// Reset the view

				if isFilled { beingFilled = false; isFilled = false }
			}
			.onLongPressGesture(minimumDuration: 5, perform: { isFilled = true })
			{
				isPressed in if isPressed
				{
					withAnimation(.linear(duration: 5)) { beingFilled = true }
				}
				else
				{
					DispatchQueue.main.asyncAfter(deadline: .now() + 0.1)
					{
						if !isFilled
						{
							withAnimation(.linear(duration: 2)) { beingFilled = false }
						}
					}
				}
			}
		}.ignoresSafeArea()
	}
}

struct LongPressGesture_Previews: PreviewProvider
{
	static var previews: some View
	{
		LongPressGesture()
	}
}
