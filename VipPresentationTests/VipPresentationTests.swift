import XCTest
import SnapshotTesting
@testable import VipPresentation

class VipPresentationTests: XCTestCase {
    
    let recordMode = false

    func test_view() {
        // Given
        let viewController = BaseMenuAssembler().resolveViewController()
//        let nav = UINavigationController(rootViewController: viewController)
        
        // When/Then
        assertSnapshot(matching: viewController, as: .image(on: .iPhone8), record: recordMode)
    }

}
