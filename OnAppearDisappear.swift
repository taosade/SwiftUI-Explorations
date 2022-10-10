// Catching view's appear/disappear events

import SwiftUI

struct PickerView: View
{
    @State var count: Int = 0

    var body: some View
    {
        NavigationView
        {
            ScrollView
            {
                LazyVStack
                {
                    ForEach(0..<50)
                    {
                        _ in RoundedRectangle(cornerRadius: 20)
                            .frame(height: 100)
                            .onAppear    { count += 1 }
                            .onDisappear { count -= 1 }
                    }
                }.padding(.horizontal)
            }.navigationTitle("Count is \(count)")
        }
    }
}

struct Preview: PreviewProvider
{
    static var previews: some View
    {
        PickerView()
    }
}
