// Segmented chart example

import SwiftUI
import Charts

enum Gender: String {
	case male
	case female
}

struct Stats {
	let city: String
	let population: Int
	let gender: Gender
}

struct ChartView: View {
	let stats: [Stats]

	var body: some View {
		Chart {
			ForEach(stats, id: \.city) { stat in
				BarMark(
					x: .value("City", stat.city),
					y: .value("Population", stat.population)
				)
				.foregroundStyle(by: .value("Gender", stat.gender.rawValue))
			}
		}
	}
}

struct ChartView_Previews: PreviewProvider {
	static var previews: some View {
		NavigationStack {
			ChartView(
				stats: [
					.init(city: "NY", population: 10_164_966, gender: .female),
					.init(city: "NY", population: 9_581_261, gender: .male),
					.init(city: "LA", population: 5_133_906, gender: .female),
					.init(city: "LA", population: 4_982_799, gender: .male)
				]
			)
			.preferredColorScheme(.dark)
		}
	}
}
