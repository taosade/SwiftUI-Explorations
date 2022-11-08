// Restricting view to be dragged within spicific bounds only

import SwiftUI

struct DragGestureBoundedView: View
{
	@State private var offsetX: CGFloat = 0
	{
		didSet
		{
			if offsetX < (200 - UIScreen.main.bounds.width) / 2
			{
				offsetX = (200 - UIScreen.main.bounds.width) / 2
			}
			else if offsetX > (UIScreen.main.bounds.width - 200) / 2
			{
				offsetX = (UIScreen.main.bounds.width - 200) / 2
			}
		}
	}

	@State private var offsetY: CGFloat = 0
	{
		didSet
		{
			if offsetY < (100 - UIScreen.main.bounds.height) / 2
			{
				offsetY = (100 - UIScreen.main.bounds.height) / 2
			}
			else if offsetY > (UIScreen.main.bounds.height - 100) / 2
			{
				offsetY = (UIScreen.main.bounds.height - 100) / 2
			}
		}
	}

	@State private var savedOffsetX: CGFloat = 0
	@State private var savedOffsetY: CGFloat = 0

	var body: some View
	{
		Rectangle()
		.fill(.orange)
		.frame(width: 200, height: 100)
		.offset(x: offsetX, y: offsetY)
		.gesture(DragGesture()
			.onChanged
			{
				value in

				offsetX = savedOffsetX + value.translation.width
				offsetY = savedOffsetY + value.translation.height
			}
			.onEnded
			{
				value in

				savedOffsetX = offsetX
				savedOffsetY = offsetY
			})
	}
}

struct DragGestureBoundedView_Previews: PreviewProvider
{
	static var previews: some View
	{
		DragGestureBoundedView()
	}
}
