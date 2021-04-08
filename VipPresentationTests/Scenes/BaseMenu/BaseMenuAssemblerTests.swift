import Foundation
import XCTest
@testable import VipPresentation

final class BaseMenuAssemblerTests: XCTestCase {
    func test_resolveViewController_itShouldReturnBaseMenuViewController() {
        // Given
        let sut = BaseMenuAssembler()
        
        // When
        let resultingController = sut.resolveViewController()

        // Then
        XCTAssertTrue(resultingController is BaseMenuViewController)
    }
    
    func test_resolveViewController_shouldConfigureSceneProperly() {
        // Given
        let sut = BaseMenuAssembler()
        
        // When
        let resultingController = sut.resolveViewController()
        
        // Then
        guard let viewController = resultingController as? BaseMenuViewController else {
            XCTFail("Expected an 'BaseMenuViewcontroller', but got \(String(describing: resultingController))")
            return
        }
        
        let viewControllerMirror = Mirror(reflecting: viewController)
        
        guard let interactor = viewControllerMirror.firstChild(of: BaseMenuBusinessLogic.self, in: "interactor") else {
            XCTFail("Interactor was not created")
            return
        }
        
        let interactorMirror = Mirror(reflecting: interactor)
        guard interactorMirror.firstChild(of: BaseMenuInteractor.UseCases.self, in: "useCases") != nil else {
            XCTFail("UseCases should't be nil")
            return
        }
        
        guard let presenter = interactorMirror.firstChild(of: BaseMenuPresentationLogic.self, in: "presenter") else {
            XCTFail("Presenter was not created")
            return
        }
        
        guard viewController.router != nil else {
            XCTFail("router should not be nil")
            return
        }
        
        guard let presenterViewController = Mirror(reflecting: presenter).firstChild(of: UIViewController.self, in: "viewController") else {
            XCTFail("presenterViewController should not be nil")
            return
        }
        XCTAssertEqual(viewController, presenterViewController)
        
    }
}

