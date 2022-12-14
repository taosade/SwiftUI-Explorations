// Receive published events and update view with onReceive modifier

import SwiftUI

struct ContentView: View
{
	@State var date: Date = Date()

	let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

	var body: some View
	{
		Text("\(date)")
		.font(.system(size: 50, design: .monospaced))
		.padding()
		.onReceive(timer) { date in self.date = date }
	}
}

struct ContentView_Previews: PreviewProvider
{
	static var previews: some View
	{
		ContentView()
	}
}
