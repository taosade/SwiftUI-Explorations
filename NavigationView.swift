// Navigation views with custom bar items

import SwiftUI

struct HomeView: View
{
    var body: some View
    {
        NavigationView
        {
            ZStack
            {
                NavigationLink("Link to the Apple View", destination: AppleView())
            }
            .navigationTitle("Home View")
            .navigationBarItems(trailing: NavigationLink(destination: AppleView(), label:
            {
                HStack
                {
                    Image(systemName: "applelogo")

                    Text("Apple View")
                }
            }))
        }
    }
}

struct AppleView: View
{
    @Environment(\.presentationMode) var presentationMode

    var body: some View
    {
        ZStack
        {
            Color.orange.ignoresSafeArea()

            Button("Dismiss the view")
            {
                presentationMode.wrappedValue.dismiss()
            }
            .foregroundColor(.white)
        }
        .navigationTitle("Apple View")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action:
        {
            self.presentationMode.wrappedValue.dismiss()
        })
        {
            HStack
            {
                Image(systemName: "house")
                Text("Custom Back")
            }
            .foregroundColor(.white)
        })
    }
}

struct PreviewMain: PreviewProvider
{
    static var previews: some View
    {
        HomeView()
    }
}

struct PreviewAppleView: PreviewProvider
{
    static var previews: some View
    {
        NavigationView
        {
            AppleView()
        }
    }
}
