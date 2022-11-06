// Rotation3DEffect applied to ScrollView elements using GeometryReader

import SwiftUI

struct Rotation3DEffectView: View
{
	var body: some View
	{
		ScrollView(.horizontal, showsIndicators: false)
		{
			HStack
			{
				ForEach(0...20, id: \.self)
				{
					index in GeometryReader
					{
						geometry in Rectangle().rotation3DEffect(
							Angle(degrees: rotationFactor(geometry) * 20),
							axis: (x: 0, y: 1, z: 0))
					}
					.frame(width: 200, height: 200)
					.padding()
				}
			}
		}
	}

	func rotationFactor(_ geometry: GeometryProxy) -> Double
	{
		return Double(1 - geometry.frame(in: .global).midX / UIScreen.main.bounds.width * 2)
	}
}

struct Rotation3DEffectView_Previews: PreviewProvider
{
	static var previews: some View
	{
		Rotation3DEffectView()
	}
}
