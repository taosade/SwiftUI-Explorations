// Async image loading with a failure placeholder

import SwiftUI

struct AsyncImageView: View
{
    let url: URL? = URL(string: "https://melihov.tech/images/handsome.png")

    var body: some View
    {
        ZStack
        {
            Color.gray

            AsyncImage(url: url)
            {
                phase in switch phase
                {
                    case .empty: ProgressView()

                    case .success(let returnedImage): returnedImage.resizable()

                    default: Image(systemName: "xmark.octagon.fill")
                }
            }
        }.frame(width: 200, height: 200)
    }
}

struct Preview: PreviewProvider
{
    static var previews: some View
    {
        AsyncImageView()
    }
}
