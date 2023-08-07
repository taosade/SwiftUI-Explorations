// Defining custom view modifiers using .modifier() and View extensions

import SwiftUI

struct MyButtonViewModifier: ViewModifier
{
	let backgroundColor: Color

	init(backgroundColor: Color = .orange)
	{
		self.backgroundColor = backgroundColor
	}

	func body(content: Content) -> some View
	{
		content
		.font(.headline)
		.foregroundColor(.white)
		.frame(height: 50)
		.frame(maxWidth: .infinity)
		.background(backgroundColor)
		.cornerRadius(10)
		.padding()
	}
}

extension View
{
	func myButtonViewModifier(backgroundColor: Color = .blue) -> some View
	{
		self.modifier(MyButtonViewModifier(backgroundColor: backgroundColor))
	}
}

struct CustomViewModifierView: View
{
	var body: some View
	{
		VStack
		{
			// Applying view modifier with .modifier()

			Text("My Button").modifier(MyButtonViewModifier())

			Text("My Button").modifier(MyButtonViewModifier(backgroundColor: .red))

			// Applying view modifier with View's extension

			Text("Another Button").myButtonViewModifier()

			Text("Another Button").myButtonViewModifier(backgroundColor: .purple)
		}
	}
}

struct CustomViewModifierView_Previews: PreviewProvider
{
	static var previews: some View
	{
		CustomViewModifierView()
	}
}
