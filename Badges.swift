// Badges on tab/list items

import SwiftUI

struct BadgesView: View
{
    var body: some View
    {
        TabView
        {
            List
            {
                ForEach([1, 2, 3], id: \.self)
                {
                    item in Text("Item #\(item)").badge(item == 2 ? "New!" : nil)
                }
            }.tabItem { Label("List", systemImage: "list.bullet") }

            Color.red.tabItem
            {
                Image(systemName: "rectangle.fill"); Text("Tab Item")
            }
            .tabItem { Label("Tab Item", systemImage: "rectangle.fill") }
            .badge(5)
        }
    }
}

struct Preview: PreviewProvider
{
    static var previews: some View
    {
        BadgesViewView()
    }
}
