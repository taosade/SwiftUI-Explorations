import SwiftUI

struct ActionSheets: View
{
    enum Season: String, CaseIterable, Identifiable
    {
        var id: String { return self.rawValue }

        case winter
        case spring
        case summer
        case fall
    }

    @State private var actionSheetPresented: Bool = false
    @State private var actionSheetTitle: String = ""
    @State private var actionSheetButtons: [ActionSheet.Button] = []

    func showActionSheet(season: Season)
    {
        actionSheetPresented = true

        actionSheetTitle = "Choose your \(season.id) activity!"

        switch season
        {
            case .winter:
                actionSheetButtons = [.default(Text("Play snowballs"))]
            case .spring:
                actionSheetButtons = [.default(Text("Do spring stuff"))]
            case .summer:
                actionSheetButtons = [.default(Text("Play beach volleyball"))]
            case .fall:
                actionSheetButtons = [.default(Text("Celebrate thanksgiving"))]
        }

        actionSheetButtons.append(contentsOf: [
            .default(Text("Simply enjoy \(season.id)")),
            .destructive(Text("I want to stay home"))])
    }

    var body: some View
    {
        VStack(spacing: 30)
        {
            ForEach(Season.allCases)
            {
                season in Button(
                    action: { showActionSheet(season: season) },
                    label: { Text(season.id.capitalized).font(.title) })
            }
        }.actionSheet(isPresented: $actionSheetPresented)
        {
            ActionSheet(
                title: Text(actionSheetTitle),
                buttons: actionSheetButtons)
        }
    }
}

struct Preview: PreviewProvider
{
    static var previews: some View
    {
        ActionSheets()
    }
}
