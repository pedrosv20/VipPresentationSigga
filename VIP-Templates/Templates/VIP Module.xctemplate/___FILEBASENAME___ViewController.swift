import UIKit

protocol ___VARIABLE_sceneName___DisplayLogic: AnyObject {
	func displaySomething(_ viewModel: ___VARIABLE_sceneName___Scene.Something.ViewModel)
}

final class ___VARIABLE_sceneName___ViewController: UIViewController {
	// MARK: - Dependencies

    var router: (NSObjectProtocol & ___VARIABLE_sceneName___RoutingLogic & ___VARIABLE_sceneName___DataPassing)?
    private let interactor: ___VARIABLE_sceneName___BusinessLogic

	// MARK: - Properties

    weak var customView: ___VARIABLE_sceneName___ViewProtocol?

	// MARK: - Initialization

    init(interactor: ___VARIABLE_sceneName___BusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	// MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
		// Do something
    }

    override func loadView() {
        view = ___VARIABLE_sceneName___View()
        customView = view as? ___VARIABLE_sceneName___ViewProtocol
    }

}
// MARK: - ___VARIABLE_sceneName___DisplayLogic
extension ___VARIABLE_sceneName___ViewController: ___VARIABLE_sceneName___DisplayLogic {
	func displaySomething(_ viewModel: ___VARIABLE_sceneName___Scene.Something.ViewModel) {
		customView?.displaySomething(viewModel)
	} 
}
