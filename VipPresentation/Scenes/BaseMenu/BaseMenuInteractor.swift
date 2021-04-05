import UIKit

protocol BaseMenuBusinessLogic {
	func loadOptionsList(_ request: BaseMenuScene.MenuOptionList.Request)
    func didSelectOption(_ request: BaseMenuScene.SelectOption.Request)
}

protocol BaseMenuDataStore {
  // var name: String? { get set }
}

final class BaseMenuInteractor: BaseMenuBusinessLogic, BaseMenuDataStore {
	// MARK: - Inner Types

	struct UseCases {
        let loadBaseMenuUseCase: LoadBaseMenuUseCaseProtocol
	}

	// MARK: - Dependencies

    private let presenter: BaseMenuPresentationLogic
	private let useCases: UseCases
    
    private var menuOptions: [MenuOption] = []
	
	// MARK: - Data Store

	// priate(set) var name: String?

	// MARK: - Initialization

	init(
		presenter: BaseMenuPresentationLogic,
		useCases: UseCases
	) {
		self.presenter = presenter
		self.useCases = useCases
	}

	// MARK: - BaseMenuBusinessLogic
	
	func loadOptionsList(_ request: BaseMenuScene.MenuOptionList.Request) {
        let optionsList = useCases.loadBaseMenuUseCase.execute()
        menuOptions = optionsList
        presenter.presentMenuOptionList(.init(optionsList: optionsList))
	}
    
    func didSelectOption(_ request: BaseMenuScene.SelectOption.Request) {
        let response = menuOptions[request.indexPath.row].action
        presenter.presentSelectedOption(.init(action: response))
    }
}
