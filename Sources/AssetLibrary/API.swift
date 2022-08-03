import Foundation
import Asset

/**
 Defines the public interface for an asset library object.
 */
public protocol AssetLibrary {

  // MARK: - Operation

  /// Adds the specified asset to the library.
  func addAsset<T: Asset>(_ asset: T)

  /// Retrieves all assets of the specified type.
  func assets<T: Asset>(ofType: T.Type) -> [T]


}
