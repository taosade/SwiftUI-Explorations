// Various date pickers binded to a date variable

import SwiftUI

struct DatePickerView: View
{
    @State var selectedDate: Date = .now

    var body: some View
    {
        NavigationView
        {
            VStack
            {
                DatePicker("Pick a date", selection: $selectedDate)
                    .datePickerStyle(.wheel)
                    .labelsHidden()

                DatePicker(selection: $selectedDate, label: { Text("Pick a date") })
                    .datePickerStyle(.graphical)
                    .labelsHidden()

                DatePicker("Pick a date", selection: $selectedDate)
                    .datePickerStyle(.compact)
            }
            .navigationTitle("Pick a date")
            .padding(.horizontal)
        }
    }
}

struct Preview: PreviewProvider
{
    static var previews: some View
    {
        DatePickerView()
    }
}
