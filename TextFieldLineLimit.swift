// An example of expandable multiline textfield with a limited line range

import SwiftUI

struct TextFieldView: View
{
	@State var text: String = ""

    var body: some View
	{
		VStack
		{
			TextField("Type something…", text: $text, axis: .vertical)
			.textFieldStyle(.roundedBorder)
			.lineLimit(3...5) // Defines the range of textfield's line count

			Group
			{
				Button("Add a line of text")
				{
					if text.count != 0 { text.append("\n") }

					text.append("Some text #\(Int.random(in: 100...999))")
				}

				Button("Empty") { text = "" }
			}
			.buttonStyle(.borderedProminent)
		}
		.padding()
	}
}

struct TextFieldView_Previews: PreviewProvider
{
	static var previews: some View
	{
		TextFieldView()
	}
}
