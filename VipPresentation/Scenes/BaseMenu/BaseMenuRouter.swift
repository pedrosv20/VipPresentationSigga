import UIKit

protocol BaseMenuRoutingLogic {
	func routeToSettings()
    func routeToOther()
}

protocol BaseMenuDataPassing {
	var dataStore: BaseMenuDataStore? { get }
}

final class BaseMenuRouter: NSObject, BaseMenuRoutingLogic, BaseMenuDataPassing {
	// MARK: - Dependencies
	// swiftlint:disable:next implicitly_unwrapped_optional
	private weak var viewController: UIViewController!

	// MARK: - Properties

	var dataStore: BaseMenuDataStore?

	// MARK: - Initialization

	init(viewController: UIViewController) {
        self.viewController = viewController
        super.init()
    }
	
	// MARK: - BaseMenuRoutingLogic

	func routeToSettings() {
        let controller = UIViewController()
        controller.view.backgroundColor = .green
        viewController.navigationController?.pushViewController(controller, animated: true)
	}
    
    func routeToOther() {
        let controller = UIViewController()
        controller.view.backgroundColor = .systemPink
        viewController.navigationController?.pushViewController(controller, animated: true)
    }
}
