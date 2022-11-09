// Five star rating selector using overlay mask 

import SwiftUI

struct RatingView: View
{
	@State var rating: Double = 2.69

	var body: some View
	{
		starsView.overlay
		{
			GeometryReader
			{
				geometry in Rectangle()
				.fill(.yellow)
				.mask(alignment: .leading, { starsView })
				.frame(width: geometry.size.width / 5 * rating)
			}
			.allowsHitTesting(false)
		}
	}

	private var starsView: some View
	{
		HStack(spacing: 0)
		{
			ForEach(1...5, id: \.self)
			{
				index in Image(systemName: "star.fill")
				.font(.largeTitle)
				.foregroundColor(.gray)
				.onTapGesture
				{
					withAnimation { rating = Double(index) }
				}
			}
		}
	}
}

struct RatingView_Previews: PreviewProvider
{
	static var previews: some View
	{
		RatingView()
	}
}
