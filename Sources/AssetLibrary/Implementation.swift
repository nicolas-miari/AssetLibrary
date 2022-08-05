import Foundation
import Asset

internal class AssetLibraryImplementation: AssetLibrary {

  // MARK: - Operation

  func directoryWrapper() -> FileWrapper {
    // TODO: Implement
    return FileWrapper(directoryWithFileWrappers: [:])
  }

  func addAsset<T>(_ asset: T) where T : Asset {
    assets.append(asset)
  }

  func assets<T>(ofType: T.Type) -> [T] where T : Asset {
    return assets.compactMap { $0 as? T }
  }

  // MARK: - Private Implementation

  private var assets: [any Asset] = []

  func loadContents(from directory: FileWrapper) throws {
    /*
     TODO: Implement

     Each subdirectory holds the assets for a given type.
     Determine the type of each subdirectory, and decode each of its regular files into the
     appropriate type.
     */
  }

  
  func registerAssetDecoder<T: Asset&Decodable>(for type: T.Type) {
    let decoder: (Data) throws -> T = { (data) throws -> T in
      let asset = try JSONDecoder().decode(T.self, from: data)
      return asset
    }
  }
}
