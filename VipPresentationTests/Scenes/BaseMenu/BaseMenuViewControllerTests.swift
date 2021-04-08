import Foundation
import XCTest
@testable import VipPresentation

final class BaseMenuViewControllerTests: XCTestCase {
    
    let baseMenuRouterSpy = BaseMenuRouterSpy()
    lazy var sut: BaseMenuViewController = {
        let sut = BaseMenuViewController(interactor: BaseMenuInteractorDummy())
        sut.router = baseMenuRouterSpy
        return sut
    }()
    
    func test_displaySettingsCalled_itShouldCall_routeToSettings() {
        // Given / When
        sut.displaySettings()
        
        // Then
        XCTAssertTrue(baseMenuRouterSpy.routeToSettingsCalled)
    }
    
    func test_displayOthercalled_itShouldCall_routeToOther() {
        // Given / When
        sut.displaySettings()
        
        // Then
        XCTAssertTrue(baseMenuRouterSpy.routeToSettingsCalled)
    }
}

final class BaseMenuRouterSpy: NSObject, BaseMenuRoutingLogic, BaseMenuDataPassing {
    var dataStore: BaseMenuDataStore?
    
    private(set) var routeToSettingsCalled = false
    func routeToSettings() {
        routeToSettingsCalled = true
    }
    
    private(set) var routeToOtherCalled = false
    func routeToOther() {
        routeToOtherCalled = true
    }
}

final class BaseMenuInteractorDummy: BaseMenuBusinessLogic {
    func loadOptionsList(_ request: BaseMenuScene.MenuOptionList.Request) {}
    
    func didSelectOption(_ request: BaseMenuScene.SelectOption.Request) {}
}
