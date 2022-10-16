// Attaching swipe actions to list items

import SwiftUI

struct SwipeActionsView: View
{
    var body: some View
    {
        NavigationView
        {
            List
            {
                ForEach([1, 2, 3, 4, 5], id: \.self)
                {
                    item in Text("Item #\(item)")
                        .swipeActions(edge: .trailing, allowsFullSwipe: false)
                        {
                            Button
                            {
                                // Delete action handler
                            }
                            label: { Label("Delete", systemImage: "trash.fill") }.tint(.red)

                            Button("Archive")
                            {
                                // Archive action handler
                            }
                            .tint(.black)
                        }
                        .swipeActions(edge: .leading, allowsFullSwipe: true)
                        {
                            Button
                            {
                                // Check action handler
                            }
                            label: { Label("Check", systemImage: "checkmark") }.tint(.green)
                        }
                }
            }.navigationTitle("List Items")
        }
    }
}

struct Preview: PreviewProvider
{
    static var previews: some View
    {
        SwipeActionsView()
    }
}
