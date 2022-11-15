// Three kinds of local notifications: interval, scheduled, location based

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager
{
	static let instance = NotificationManager()

	func requestAuthorization()
	{
		let options: UNAuthorizationOptions = [.alert, .badge, .sound]

		UNUserNotificationCenter.current().requestAuthorization(options: options, completionHandler:
		{
			(success, error) in

			print("Authorization \(success ? "granted" : "denied")")

			if let error = error { print("\(error.localizedDescription)") }
		})
	}

	func intervalNotification()
	{
		let content = UNMutableNotificationContent()

		content.title = "This is a time interval notification"
		content.sound = .default
		content.badge = 1

		let request = UNNotificationRequest(
			identifier: UUID().uuidString,
			content: content,
			trigger: UNTimeIntervalNotificationTrigger(
				timeInterval: 5, repeats: false))

		UNUserNotificationCenter.current().add(request)
	}

	func scheduledNotification()
	{
		let content = UNMutableNotificationContent()

		content.title = "This is a scheduled notification"
		content.sound = .default
		content.badge = 2

		let dateComponents = Calendar.current.dateComponents(
			[.hour, .minute, .second],
			from: Date.now.addingTimeInterval(5))

		let request = UNNotificationRequest(
			identifier: UUID().uuidString,
			content: content,
			trigger: UNCalendarNotificationTrigger(
				dateMatching: dateComponents,
				repeats: false))

		UNUserNotificationCenter.current().add(request)
	}

	func locationNotification()
	{
		let content = UNMutableNotificationContent()

		content.title = "This is a location notification"
		content.sound = .defaultRingtone
		content.badge = 3

		let location = CLCircularRegion(
			center: CLLocationCoordinate2D(latitude: 40, longitude: 40),
			radius: 1000,
			identifier: UUID().uuidString)

		location.notifyOnEntry = true

		location.notifyOnExit = false

		let request = UNNotificationRequest(
			identifier: UUID().uuidString,
			content: content,
			trigger: UNLocationNotificationTrigger(region: location, repeats: false))

		UNUserNotificationCenter.current().add(request)
	}

	func cancelNotifications()
	{
		// Remove all delivered notifications from notifications area

		UNUserNotificationCenter.current().removeAllDeliveredNotifications()

		// Cancel all pending notifications

		UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
	}
}

struct GeometryReaderView: View
{
	var body: some View
	{
		VStack(alignment: .leading, spacing: 50)
		{
			Button("Request authorization")
			{
				NotificationManager.instance.requestAuthorization()
			}

			Button("Interval notification")
			{
				NotificationManager.instance.intervalNotification()
			}

			Button("Scheduled notification")
			{
				NotificationManager.instance.scheduledNotification()
			}

			Button("Location notification")
			{
				NotificationManager.instance.locationNotification()
			}

			Button("Cancel notifications")
			{
				NotificationManager.instance.cancelNotifications()
			}

			Button("Reset badge")
			{
				UIApplication.shared.applicationIconBadgeNumber = 0
			}
		}
	}
}

struct GeometryReaderView_Previews: PreviewProvider
{
	static var previews: some View
	{
		GeometryReaderView()
	}
}
