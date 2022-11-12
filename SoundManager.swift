// A singleton which plays sounds from app's bundle

import SwiftUI
import AVKit

class SoundManager
{
	static let instance = SoundManager()

	var player: AVAudioPlayer?

	func playSound(_ name: String)
	{
		guard let url = Bundle.main.url(forResource: name, withExtension: ".mp3") else { return }

		do
		{
			player = try AVAudioPlayer(contentsOf: url)

			player?.play()
		}
		catch let error { print(error.localizedDescription) }
	}
}

struct SoundManagerView: View
{
	var body: some View
	{
		VStack(spacing: 50)
		{
			Button("\(Image(systemName: "music.note")) Play sound")
			{
				SoundManager.instance.playSound("mp3FileName")
			}
			.font(.largeTitle)
		}
	}
}

struct SoundManagerView_Previews: PreviewProvider
{
	static var previews: some View
	{
		SoundManagerView()
	}
}
