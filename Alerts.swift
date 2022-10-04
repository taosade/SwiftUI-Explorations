// Presenting various alerts using a custom function

import SwiftUI

struct Alerts: View
{
    @State private var alertShow: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMessage: String = ""
    @State private var backgroundColor: Color = .black

    enum MyAlerts
    {
        case error
        case warning
        case success
    }

    func showAlert(_ message: String = "", _ alertType: MyAlerts = .error)
    {
        switch alertType
        {
            case .error:
                alertTitle = "Error"
                withAnimation() { backgroundColor = .red }

            case .warning:
                alertTitle = "Warning"
                withAnimation() { backgroundColor = .orange }

            case .success:
                alertTitle = "Success"
                withAnimation() { backgroundColor = .green }
        }

        alertMessage = message

        alertShow = true
    }

    var body: some View
    {
        ZStack
        {
            backgroundColor.ignoresSafeArea()

            VStack(spacing: 40)
            {
                Button("Error")   { showAlert("Some error occured!")           }
                Button("Warning") { showAlert("You've been warned!", .warning) }
                Button("Success") { showAlert("It's all good, man!", .success) }
            }
            .font(.title)
            .foregroundColor(.white)
        }
        .alert(isPresented: $alertShow)
        {
            Alert(
                title: Text(alertTitle),
                message: Text(alertMessage),
                primaryButton: .default(Text("OK")),
                secondaryButton: .cancel() { withAnimation() { backgroundColor = .black } })
        }
    }
}

struct Preview: PreviewProvider
{
    static var previews: some View
    {
        Alerts()
    }
}
