import Foundation
import XCTest
import SnapshotTesting
@testable import VipPresentation

final class LoadBaseMenuUseCaseTests: XCTestCase {
    
    func test_execute_itShouldReturnExpectedMenuOptions() {
        // Given
        let sut = LoadBaseMenuUseCaseMock()
        let expectedMenuOptionToBeReturned: [MenuOption] =  [
            .init(name: "option1", icon: .actions, action: .openSettings),
            .init(name: "option2", icon: .checkmark, action: .openOther),
        ]
        sut.menuOptionToBeReturned = expectedMenuOptionToBeReturned
        // When
        let menuOptionReturned = sut.execute()
        
        // Then
        XCTAssertEqual(menuOptionReturned, expectedMenuOptionToBeReturned)
    }
}
