import UIKit

protocol BaseMenuViewProtocol where Self: UIView {
	func reloadData()
}

final class BaseMenuView: CodedView, BaseMenuViewProtocol {
	// MARK: - Constants

    private enum Metrics {
        static let rowHeight: CGFloat = 100
        static let bottomSheetViewHeight: CGFloat = 300
    }
    
    private let tableViewDataSource: BaseMenuViewTableDataSource
    
	// MARK: - UI Components

    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var bottomSheetView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.layer.masksToBounds = true
        table.layer.cornerRadius = 8
        table.estimatedRowHeight = UITableView.automaticDimension
        table.rowHeight = UITableView.automaticDimension
        table.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        table.dataSource = tableViewDataSource
        table.separatorStyle = .none
        table.register(
            BaseMenuTableViewCell.self,
            forCellReuseIdentifier: String(describing: BaseMenuTableViewCell.self)
        )
        return table
    }()
    
    // MARK: - Dependencies


	// MARK: - Initialization

    init(
        tableViewDataSource: BaseMenuViewTableDataSource,
        tableViewDelegate: UITableViewDelegate
    ) {
        self.tableViewDataSource = tableViewDataSource
        super.init(frame: .zero)
        self.tableView.delegate = tableViewDelegate
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - ViewCode Setup

    override func addSubviews() {
        addSubview(backgroundView)
        backgroundView.addSubview(bottomSheetView)
        bottomSheetView.addSubview(tableView)
    }

    override func constrainSubviews() {
        constrainBackgroundView()
        constrainBottomSheetView()
        constrainTableView()
    }

    override func configureAdditionalSettings() {
        backgroundColor = .white
    }

	// MARK: - Constraints Setup

    private func constrainBackgroundView() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(
                equalTo: self.topAnchor
            ),
            backgroundView.leadingAnchor.constraint(
                equalTo: self.leadingAnchor
            ),
            backgroundView.bottomAnchor.constraint(
                equalTo: self.bottomAnchor
            ),
            backgroundView.trailingAnchor.constraint(
                equalTo: self.trailingAnchor
            )
        ])
    }
    
    private func constrainBottomSheetView() {
        NSLayoutConstraint.activate([
            bottomSheetView.topAnchor.constraint(
                equalTo: backgroundView.topAnchor,
                constant: Metrics.bottomSheetViewHeight
            ),
            bottomSheetView.leadingAnchor.constraint(
                equalTo: backgroundView.leadingAnchor
            ),
            bottomSheetView.bottomAnchor.constraint(
                equalTo: backgroundView.bottomAnchor
            ),
            bottomSheetView.trailingAnchor.constraint(
                equalTo: backgroundView.trailingAnchor
            )
        ])
    }
    
    private func constrainTableView() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(
                equalTo:  bottomSheetView.leadingAnchor
            ),
            tableView.topAnchor.constraint(
                equalTo: bottomSheetView.topAnchor
            ),
            tableView.trailingAnchor.constraint(
                equalTo: bottomSheetView.trailingAnchor
            ),
            tableView.bottomAnchor.constraint(
                equalTo: bottomSheetView.bottomAnchor
            )
        ])
    }

    // MARK: - Public API
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func updateTableViewHeight(_ height: CGFloat) {
        NSLayoutConstraint.activate([
            tableView.heightAnchor.constraint(equalToConstant: height)]
        )
    }
}
