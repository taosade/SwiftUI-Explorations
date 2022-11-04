// Handling drag gesture while preserving the offset

import SwiftUI

struct DragGestureView: View
{
	@State private var offsetValue: CGSize = .zero
	@State private var offsetSaved: CGSize = .zero

	var body: some View
	{
		Text("\(Image(systemName: "arrow.up.left.and.arrow.down.right")) Drag me!")
		.font(.largeTitle)
		.padding()
		.background(Color.orange)
		.offset(offsetValue)
		.gesture(DragGesture()
			.onChanged { value in offsetValue = CGSize(width: offsetSaved.width + value.translation.width, height: offsetSaved.height + value.translation.height) }
			.onEnded { value in offsetSaved = offsetValue })
	}
}

struct DragGestureView_Previews: PreviewProvider
{
	static var previews: some View
	{
		DragGestureView()
	}
}
