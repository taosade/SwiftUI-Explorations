// Editable list view

import SwiftUI

struct ListView: View
{
    @State private var countries: [String] = ["England", "USA", "France", "Israel"]
    @State private var isEditing: Bool = false

    var body: some View
    {
        NavigationView
        {
            List
            {
                Section
                {
                    ForEach(countries, id: \.self) { country in Text(country) }
                    .onDelete(perform: { atOffsets in countries.remove(atOffsets: atOffsets) })
                    .onMove(perform: { fromOffsets, toOffset in countries.move(fromOffsets: fromOffsets, toOffset: toOffset) })
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Countries")
            .toolbar
            {
                ToolbarItem(placement: .bottomBar)
                {
                    Button(action: {  withAnimation() { isEditing.toggle() } }, label:
                    {
                        HStack
                        {
                            Image(systemName: isEditing ? "checkmark.circle" : "pencil.circle")

                            Text(isEditing ? "Done" : "Edit")
                        }
                    })
                }

                ToolbarItem(placement: .bottomBar)
                {
                    Button(action: {  withAnimation() { countries.append("Some country") } }, label:
                    {
                        HStack
                        {
                            Image(systemName: "plus.circle")

                            Text("Add")
                        }
                    })
                }
            }.environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
        }
    }
}

struct Preview: PreviewProvider
{
    static var previews: some View
    {
        ListView()
    }
}
