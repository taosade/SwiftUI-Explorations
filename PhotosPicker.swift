// Example of the native PhotosPicker usage

import SwiftUI
import PhotosUI

@MainActor
final class PhotosPickerViewModel: ObservableObject
{
	@Published private(set) var image: UIImage? = nil

	var selectedItem: PhotosPickerItem? = nil
	{
		didSet
		{
			guard let selectedItem else { return }

			Task
			{
				guard
					let data = try? await selectedItem.loadTransferable(type: Data.self),
					let image = UIImage(data: data)
				else { return }

				self.image = image
			}
		}
	}
}

struct PhotosPickerView: View
{
	@StateObject private var viewModel = PhotosPickerViewModel()

	var body: some View
	{
		VStack
		{
			if let image = viewModel.image
			{
				Image(uiImage: image)
				.resizable()
				.scaledToFill()
				.frame(width: 200, height: 200)
				.cornerRadius(20)
			}

			PhotosPicker(
				"\(Image(systemName: "photo")) Select an image",
				selection: $viewModel.selectedItem,
				matching: .images)
		}
	}
}

struct PhotosPickerView_Previews: PreviewProvider
{
	static var previews: some View
	{
		PhotosPickerView()
	}
}
