import SwiftUI

class HapticManager
{
	static let instance: HapticManager = HapticManager()

	func notification(_ type: UINotificationFeedbackGenerator.FeedbackType)
	{
		let generator = UINotificationFeedbackGenerator()

		generator.notificationOccurred(type)
	}
}

struct HapticManagerView: View
{
	var body: some View
	{
		VStack(alignment: .leading, spacing: 50)
		{
			Button("\(Image(systemName: "iphone.radiowaves.left.and.right")) Success")
			{
				HapticManager.instance.notification(.success)
			}

			Button("\(Image(systemName: "iphone.radiowaves.left.and.right")) Warning")
			{
				HapticManager.instance.notification(.warning)
			}

			Button("\(Image(systemName: "iphone.radiowaves.left.and.right")) Error")
			{
				HapticManager.instance.notification(.error)
			}
		}.font(.largeTitle)
	}
}

struct HapticManagerView_Previews: PreviewProvider
{
	static var previews: some View
	{
		HapticManagerView()
	}
}
