// Native pull-to-refresh modifier attached to an async function

import SwiftUI

final class RefreshableDataService
{
	func getData() async throws -> [String]
	{
		try? await Task.sleep(nanoseconds: 1_000_000_000)

		return ["Apple", "Orange", "Banana", "Pear", "Melon"].shuffled()
	}
}

@MainActor
final class RefreshableViewModel: ObservableObject
{
	private var DM = RefreshableDataService()

	@Published private(set) var data = [String]()

	func getData() async
	{
		do
		{
			self.data = try await DM.getData()
		}
		catch { print(error.localizedDescription) }
	}
}

struct Refreshable: View
{
	@StateObject private var VM = RefreshableViewModel()

	var body: some View
	{
		NavigationStack
		{
			ScrollView
			{
				VStack
				{
					ForEach(VM.data, id: \.self)
					{
						item in Text(item).font(.title)
					}
				}
			}
			.navigationTitle("Refresh me!")
			.refreshable { await VM.getData() }
			.task { await VM.getData() }
		}
	}
}

struct Refreshable_Previews: PreviewProvider
{
	static var previews: some View
	{
		Refreshable()
	}
}
