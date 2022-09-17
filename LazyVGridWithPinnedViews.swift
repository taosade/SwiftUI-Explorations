// Scrollable grid with pinned headers

import SwiftUI

struct LazyVGridWithPinnedViews: View
{
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View
    {
        ScrollView
        {
            LazyVGrid(
                columns: columns,
                pinnedViews: [.sectionHeaders]
            )
            {
                Section(header:
                    Text("Section #1")
                        .padding()
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.blue)
                )
                {
                    ForEach(0..<20)
                    {
                        index in

                        Rectangle().frame(height: 100)
                    }
                }

                Section(header:
                    Text("Section #2")
                        .padding()
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.red)
                )
                {
                    ForEach(0..<20)
                    {
                        index in

                        Rectangle().frame(height: 100)
                    }
                }
            }
        }
    }
}

struct LazyVGridWithPinnedViews_Previews: PreviewProvider
{
    static var previews: some View
    {
        LazyVGridWithPinnedViews()
    }
}
