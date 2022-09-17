// Implementation of vertical and horizontal scrollviews

import SwiftUI

struct ScrollViews: View
{
    var body: some View
    {
        ScrollView(.vertical, showsIndicators: false)
        {
            VStack
            {
                ForEach(1..<10)
                {
                    indexV in

                    ScrollView(.horizontal, showsIndicators: false)
                    {
                        HStack
                        {
                            ForEach(1..<10)
                            {
                                indexH in

                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.yellow)
                                    .frame(width: 100, height: 100)
                                    .padding()
                                    .overlay(Text("\(indexV) : \(indexH)"))
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ScrollViews_Previews: PreviewProvider
{
    static var previews: some View
    {
        HStack
        {
            ScrollViews()
        }
    }
}
