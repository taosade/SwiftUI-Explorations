// Clipping view with a dinamically chosen path

import SwiftUI

enum AvailableShapes: Shape, CaseIterable
{
	case circle, rectangle, roundedRectangle

	var name: String
	{
		switch self
		{
			case .circle: return "Circle"
			case .rectangle: return "Rectangle"
		case .roundedRectangle: return "Rounded Rectangle"
		}
	}

	func path(in rect: CGRect) -> Path
	{
		switch self
		{
			case .circle: return Circle().path(in: rect)
			case .rectangle: return Rectangle().path(in: rect)
			case .roundedRectangle: return RoundedRectangle(cornerRadius: 50).path(in: rect)
		}
	}
}

struct ContentView: View
{
	@State var shape: AvailableShapes = .circle

	var body: some View
	{
		ZStack
		{
			Rectangle()
			.frame(width: 200, height: 200)
			.clipShape(shape)

			Picker("Choose shape", selection: $shape)
			{
				ForEach(AvailableShapes.allCases, id: \.self)
				{
					shape in Text(shape.name)
				}
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider
{
	static var previews: some View
	{
		ContentView()
	}
}
