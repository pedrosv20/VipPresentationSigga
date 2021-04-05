import UIKit

protocol BaseMenuDisplayLogic: AnyObject {
	func displayMenuOptions(_ viewModel: BaseMenuScene.MenuOptionList.ViewModel)
    func displaySettings()
    func displayOther()
}

final class BaseMenuViewController: UIViewController {
	// MARK: - Dependencies

    var router: (NSObjectProtocol & BaseMenuRoutingLogic & BaseMenuDataPassing)?
    private let interactor: BaseMenuBusinessLogic

	// MARK: - Properties

    weak var customView: BaseMenuViewProtocol?
    private var dataSource: BaseMenuViewTableDataSource

	// MARK: - Initialization

    init(
        interactor: BaseMenuBusinessLogic,
        dataSource: BaseMenuViewTableDataSource = .init()
    ) {
        self.interactor = interactor
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	// MARK: - Life Cycle

    override func loadView() {
        view = BaseMenuView(
            tableViewDataSource: dataSource,
            tableViewDelegate: self
        )
        customView = view as? BaseMenuViewProtocol
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.loadOptionsList(.init())
    }

}
// MARK: - BaseMenuDisplayLogic
extension BaseMenuViewController: BaseMenuDisplayLogic {
	func displayMenuOptions(_ viewModel: BaseMenuScene.MenuOptionList.ViewModel) {
        dataSource.updateOptions(newOptions: viewModel.model)
		customView?.reloadData()
	}
    
    func displaySettings() {
        router?.routeToSettings()
    }
    
    func displayOther() {
        router?.routeToOther()
    }
}

extension BaseMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor.didSelectOption(.init(indexPath: indexPath))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
