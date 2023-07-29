// Debounced search bar with a search scope selector and suggestions

import SwiftUI
import Combine

enum Cuisine: String { case french, italian, japanese }

struct Restaurant: Identifiable
{
	var id = UUID().uuidString
	var name: String
	var cuisine: Cuisine
}

/// Mockup data manager class
final class SearchableDataService
{
	func getRestaurants() async throws -> [Restaurant]
	{
		[
			Restaurant(name: "Le Baguette", cuisine: .french),
			Restaurant(name: "John Carlo's", cuisine: .italian),
			Restaurant(name: "Tokyo City", cuisine: .japanese)
		]
	}
}

@MainActor
final class SearchableViewModel: ObservableObject
{
	enum SearchScope: Hashable
	{
		case all, cuisine(cuisine: Cuisine)

		var title: String
		{
			switch self
			{
				case .all: return "All"
				case .cuisine(cuisine: let cuisine): return cuisine.rawValue.capitalized
			}
		}
	}

	private var DS = SearchableDataService()
	private var restaurants = [Restaurant]()
	private var cancellables = [AnyCancellable]()

	@Published private(set) var displayedRestaurants = [Restaurant]()
	@Published var searchText = ""
	@Published var searchScope: SearchScope = .all
	@Published private(set) var allSearchScopes: [SearchScope] = []

	init()
	{
		$searchText
		.combineLatest($searchScope)
		.debounce(for: 0.3, scheduler: DispatchQueue.main)
		.sink
		{
			[weak self] (searchText, searchScope) in

			self?.filterRestaurants(searchText: searchText, searchScope: searchScope)
		}
		.store(in: &cancellables)
	}

	func filterRestaurants(searchText: String, searchScope: SearchScope)
	{
		let token = searchText.trimmingCharacters(in: .whitespaces).lowercased()

		self.displayedRestaurants = self.restaurants.filter
		{
			restaurant in if
			(
				// Filter by name

				token.isEmpty ||
				restaurant.name.lowercased().contains(token) ||
				restaurant.cuisine.rawValue.contains(token)
			) &&
			(
				// Filter by scope

				searchScope == .all ||
				searchScope.title == restaurant.cuisine.rawValue.capitalized
			)
			{ return true }

			return false
		}
	}

	func getRestaurants() async
	{
		do
		{
			self.restaurants = try await DS.getRestaurants()

			self.allSearchScopes = [.all] + Set(self.restaurants
				.map { restaurant in restaurant.cuisine })
				.map { cuisine in SearchScope.cuisine(cuisine: cuisine) }
		}
		catch { print(error.localizedDescription) }

		self.filterRestaurants(searchText: self.searchText, searchScope: self.searchScope)
	}

	func getSuggestions() -> [String]
	{
		let token = searchText.trimmingCharacters(in: .whitespaces).lowercased()

		var suggestions = [String]()

		// Name suggestions

		self.restaurants.forEach
		{
			restaurant in if restaurant.name.lowercased().contains(token)
			{
				suggestions.append(restaurant.name)
			}
		}

		// Scope suggestions

		self.allSearchScopes.forEach
		{
			scope in if scope != .all && scope.title.lowercased().contains(token)
			{
				suggestions.append(scope.title)
			}
		}

		return suggestions
	}
}

struct Searchable: View
{
	@StateObject private var VM = SearchableViewModel()

	var body: some View
	{
		NavigationStack
		{
			ScrollView
			{
				VStack(spacing: 20)
				{
					ForEach(VM.displayedRestaurants)
					{
						restaurant in RestaurantView(restaurant: restaurant)
					}
				}
			}
			.navigationTitle("Restaurants")
			.searchable(text: $VM.searchText)
			.searchScopes($VM.searchScope)
			{
				ForEach(VM.allSearchScopes, id: \.self) { scope in Text(scope.title).tag(scope) }
			}
			.searchSuggestions
			{
				if VM.searchText.count <= 3 // Display suggestions only if search text is up to 3 characters long
				{
					ForEach(VM.getSuggestions(), id: \.self) { suggestion in Text(suggestion).searchCompletion(suggestion) }
				}
			}
		}.task { await VM.getRestaurants() }
	}
}

struct RestaurantView: View
{
	let restaurant: Restaurant

	var body: some View
	{
		HStack(spacing: 0)
		{
			Image(systemName: "fork.knife.circle")
			.resizable()
			.frame(width: 50, height: 50)
			.padding(.horizontal)

			VStack(alignment: .leading)
			{
				Text(restaurant.name).font(.title2)

				Text(restaurant.cuisine.rawValue.capitalized).foregroundColor(.secondary)
			}

			Spacer()
		}
	}
}

struct Searchable_Previews: PreviewProvider
{
	static var previews: some View
	{
		Searchable()
	}
}
