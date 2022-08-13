// Function to decode a static JSON file from app's bundle

import SwiftUI

extension Bundle
{
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T
    {
        guard let url = self.url(forResource: file, withExtension: nil) else
        {
            fatalError("Failed to locate '\(file)' in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else
        {
            fatalError("Failed to load '\(file)' from bundle.")
        }

        guard let decoded = try? JSONDecoder().decode(T.self, from: data) else
        {
            fatalError("Failed to decode '\(file)' from bundle.")
        }

        return decoded
    }
}
