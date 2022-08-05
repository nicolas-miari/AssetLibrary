import Foundation

/**
 The purpose of the factory is to hide the concrete implementation of the AssetLibrary protocol.

 Clients of the service should obtain an opaque instance from the fatory and operate on it.
 */
public class AssetLibraryFactory {

  /**
   Instantiates an empty asset library.
   */
  public static func newLibrary() -> some AssetLibrary {
    return AssetLibraryImplementation()
  }

  /**
   Instantiates a new asset library with the contents of the specified directory.
   */
  public static func loadAssetLibrary(from directory: FileWrapper) throws -> some AssetLibrary {
    let library = AssetLibraryImplementation()
    try library.loadContents(from: directory)
    return library
  }
}
