import Foundation
import XCTest
@testable import VipPresentation

final class BaseMenuInteractorTests: XCTestCase {
    
    func test_loadOptionsList_shouldReturnCorrectResponse() {
        // MARK: - Given
        let presenterSpy = BaseMenuPresenterSpy()
        let loadBaseMenuUseCaseMock = LoadBaseMenuUseCaseMock()
        loadBaseMenuUseCaseMock.menuOptionToBeReturned = [
            .init(name: "firstOption", icon: .actions, action: .openOther),
            .init(name: "secondOption", icon: .actions, action: .openOther),
            .init(name: "thirdOption", icon: .actions, action: .openOther)
        ]
        let sut = BaseMenuInteractor(
            presenter: presenterSpy,
            useCases: .init(loadBaseMenuUseCase: loadBaseMenuUseCaseMock)
        )
        let request = BaseMenuScene.MenuOptionList.Request.init()
        
        // MARK: - When
        sut.loadOptionsList(request)
        
        // MARK: - Then
        XCTAssertTrue(presenterSpy.presentMenuOptionListCalled)
        XCTAssertEqual(presenterSpy.presentMenuOptionListResponseReceived?.optionsList.count, 3)
    }
    
    func test_presentSelectedOption_shouldReturnCorrectResponse() {
        // MARK: - Given
        let presenterSpy = BaseMenuPresenterSpy()
        let loadBaseMenuUseCaseMock = LoadBaseMenuUseCaseMock()
        loadBaseMenuUseCaseMock.menuOptionToBeReturned = [
            .init(name: "firstOption", icon: .actions, action: .openOther),
            .init(name: "secondOption", icon: .actions, action: .openSettings),
            .init(name: "thirdOption", icon: .actions, action: .openOther)
        ]
        let sut = BaseMenuInteractor(
            presenter: presenterSpy,
            useCases: .init(loadBaseMenuUseCase: loadBaseMenuUseCaseMock)
        )
        let request = BaseMenuScene.SelectOption.Request.init(indexPath: .init(row: 1, section: 0))
        
        // MARK: - When
        sut.loadOptionsList(.init())
        sut.didSelectOption(request)
        
        // MARK: - Then
        XCTAssertTrue(presenterSpy.presentSelectedOptionCalled)
        XCTAssertEqual(presenterSpy.presentSelectedOptionResponseReceived?.action, .openSettings)
    }
}


final class BaseMenuPresenterSpy: BaseMenuPresentationLogic {
    private(set) var presentMenuOptionListCalled = false
    private(set) var presentMenuOptionListResponseReceived: BaseMenuScene.MenuOptionList.Response?
    func presentMenuOptionList(_ response: BaseMenuScene.MenuOptionList.Response) {
        presentMenuOptionListCalled = true
        presentMenuOptionListResponseReceived = response
    }
    
    private(set) var presentSelectedOptionCalled = false
    private(set) var presentSelectedOptionResponseReceived: BaseMenuScene.SelectOption.Response?
    func presentSelectedOption(_ response: BaseMenuScene.SelectOption.Response) {
        presentSelectedOptionCalled = true
        presentSelectedOptionResponseReceived = response
    }
    
}

final class LoadBaseMenuUseCaseMock: LoadBaseMenuUseCaseProtocol {
    var menuOptionToBeReturned: [MenuOption] = [ .init(name: "teste", icon: .actions, action: .openOther) ]
    func execute() -> [MenuOption] {
        return menuOptionToBeReturned
    }
}
