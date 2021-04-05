import UIKit

protocol ___VARIABLE_sceneName___BusinessLogic {
	func doSomething(_ request: ___VARIABLE_sceneName___Scene.Something.Request)
}

protocol ___VARIABLE_sceneName___DataStore {
  // var name: String? { get set }
}

final class ___VARIABLE_sceneName___Interactor: ___VARIABLE_sceneName___BusinessLogic, ___VARIABLE_sceneName___DataStore {
	// MARK: - Inner Types

	struct UseCases {
		// let someUseCase: SomeUseCaseProtocol
	}

	// MARK: - Dependencies

    private let presenter: ___VARIABLE_sceneName___PresentationLogic
	private let useCases: UseCases
	
	// MARK: - Data Store

	// priate(set) var name: String?

	// MARK: - Initialization

	init(
		presenter: ___VARIABLE_sceneName___PresentationLogic,
		useCases: UseCases
	) {
		self.presenter = presenter
		self.useCases = useCases
	}

	// MARK: - ___VARIABLE_sceneName___BusinessLogic
	
	func doSomething(_ request: ___VARIABLE_sceneName___Scene.Something.Request) {
		let response: ___VARIABLE_sceneName___Scene.Something.Response = .init()
		presenter.presentSomething(response)
	}
}
