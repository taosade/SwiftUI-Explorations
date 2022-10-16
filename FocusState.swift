import SwiftUI

struct FocusStateView: View
{
    @State private var userName: String = ""

    @FocusState private var userNameFocused: Bool

    var body: some View
    {
        VStack
        {
            TextField("Enter your name...", text: $userName)
                .focused($userNameFocused)
                .padding()
                .background(Color.black.opacity(0.1))
                .padding()

            Button("Toggle FocusState") { userNameFocused.toggle() }
                .buttonStyle(.bordered)
        }
        .onAppear
        {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1)
            {
                self.userNameFocused = true
            }
        }
    }
}

struct Preview: PreviewProvider
{
    static var previews: some View
    {
        FocusStateView()
    }
}
