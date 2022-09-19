import XCTest
import Asset

@testable import AssetLibrary

final class AssetLibraryTests: XCTestCase {

  func testPersistence() throws {

    let library = AssetLibraryFactory.newLibrary()

    let image = ImageAsset(name: "image 1", identifier: "0000")
    let sound = SoundAsset(name: "sound 1", identifier: "0001")

    library.addAsset(image)
    library.addAsset(sound)

    let directory = try library.directoryWrapper()

    let restored = try AssetLibraryFactory.loadAssetLibrary(from: directory, assetTypes: [ImageAsset.self, SoundAsset.self])

    let images = restored.assets(ofType: ImageAsset.self)
    let sounds = restored.assets(ofType: SoundAsset.self)

    XCTAssertEqual(images[0].identifier, image.identifier)
    XCTAssertEqual(sounds[0].identifier, sound.identifier)
  }
}

// MARK: - Supporting Types

class ImageAsset: NSObject, Asset {
  var name: String
  let identifier: String
  init(name: String, identifier: String) {
    self.name = name
    self.identifier = identifier
  }
}

class SoundAsset: NSObject, Asset {
  var name: String
  let identifier: String
  init(name: String, identifier: String) {
    self.name = name
    self.identifier = identifier
  }
}
