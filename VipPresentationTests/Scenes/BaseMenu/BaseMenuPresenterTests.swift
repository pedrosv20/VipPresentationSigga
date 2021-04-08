import Foundation
import XCTest
import SnapshotTesting
@testable import VipPresentation

final class BaseMenuPresenterTestes: XCTestCase {
    
    let baseMenuViewControllerSpy = BaseMenuViewControllerSpy()
    let recordMode = false
    
    func test_presentMenuOptionList_itShouldReturnCorrectViewModel() {
        // Given
        let sut = makeSut(viewController: baseMenuViewControllerSpy)
        let response = BaseMenuScene.MenuOptionList.Response.init(optionsList: [
            .init(name: "teste", icon: .remove, action: .openSettings)
        ])
        
        let expectedViewModelToBeReturned = BaseMenuScene.MenuOptionList.ViewModel.init(model: [.init(text: "teste", image: .remove)])
        // When
        sut.presentMenuOptionList(response)
        
        
        // Then
        XCTAssertTrue(baseMenuViewControllerSpy.displayMenuOptionsCalled)
        XCTAssertEqual(baseMenuViewControllerSpy.viewModelReceived?.model.first?.text, expectedViewModelToBeReturned.model.first?.text)
        XCTAssertEqual(baseMenuViewControllerSpy.viewModelReceived?.model.first?.image, expectedViewModelToBeReturned.model.first?.image)
        assertSnapshot(matching: baseMenuViewControllerSpy.viewModelReceived?.model, as: .dump, record: recordMode)
    }
    
    func test_presentSelectedOption_isSettings_itShouldCallDisplaySettingsInViewController() {
        // Given
        let sut = makeSut(viewController: baseMenuViewControllerSpy)
        let response = BaseMenuScene.SelectOption.Response.init(action: .openSettings)
        // When
        sut.presentSelectedOption(response)
        
        // Then
        XCTAssertTrue(baseMenuViewControllerSpy.displaySettingsCalled)
        XCTAssertFalse(baseMenuViewControllerSpy.displayOtherCalled)
    }
    
    func test_presentSelectedOption_isOther_itShouldCallDisplayOtherInViewController() {
        // Given
        let sut = makeSut(viewController: baseMenuViewControllerSpy)
        let response = BaseMenuScene.SelectOption.Response.init(action: .openOther)
        // When
        sut.presentSelectedOption(response)
        
        // Then
        XCTAssertTrue(baseMenuViewControllerSpy.displayOtherCalled)
        XCTAssertFalse(baseMenuViewControllerSpy.displaySettingsCalled)
    }
    
    private func makeSut(viewController: BaseMenuDisplayLogic) -> BaseMenuPresenter {
        let sut = BaseMenuPresenter()
        sut.viewController = viewController
        return sut
    }
}

final class BaseMenuViewControllerSpy: BaseMenuDisplayLogic {
    private(set) var displayMenuOptionsCalled = false
    var viewModelReceived: BaseMenuScene.MenuOptionList.ViewModel?
    func displayMenuOptions(_ viewModel: BaseMenuScene.MenuOptionList.ViewModel) {
        displayMenuOptionsCalled = true
        viewModelReceived = viewModel
    }
    
    private(set) var displaySettingsCalled = false
    func displaySettings() {
        displaySettingsCalled = true
    }
    
    private(set) var displayOtherCalled = false
    func displayOther() {
        displayOtherCalled = true
    }
    
    
}
