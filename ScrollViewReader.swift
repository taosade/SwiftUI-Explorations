// Using ScrollViewReader to scroll the ScrollView to specific item

import SwiftUI

struct ScrollViewReaderView: View
{
	@State private var input: String = ""
	
	@State private var scrollIndex: Int = 0

	var body: some View
	{
		VStack(spacing: 0)
		{
			HStack(spacing: 16)
			{
				TextField("Choose an item to scroll to…", text: $input)
				.padding()
				.background(Color.white)
				.keyboardType(.numberPad)

				Button("GO")
				{
					if let index = Int(input) { scrollIndex = index }
				}
				.buttonStyle(.borderedProminent)
			}
			.padding()
			.background(Color.orange)

			ScrollView
			{
				ScrollViewReader
				{
					proxy in ForEach(1...99, id: \.self)
					{
						index in Text("This is item #\(index)")
						.frame(height: 100)
						.frame(maxWidth: .infinity)
						.background(Color.white)
						.shadow(radius: 6)
						.padding()
						.id(index)
					}
					.onChange(of: scrollIndex, perform:
					{
						value in withAnimation { proxy.scrollTo(value, anchor: .center) }
					})
				}
			}
		}
	}
}

struct ScrollViewReaderView_Previews: PreviewProvider
{
	static var previews: some View
	{
		ScrollViewReaderView()
	}
}
