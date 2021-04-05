import UIKit

final class BaseMenuViewTableDataSource: NSObject, UITableViewDataSource {
    typealias Options = BaseMenuScene.MenuOptionList.ViewModel.Model
    // MARK: - Private Properties
    
    private var optionsList: [Options]?
    
    // MARK: - Initialization
    
    init(optionsList: [Options] = []) {
        self.optionsList = optionsList
    }
    
    // MARK: - Public functions
    
    func updateOptions(newOptions: [Options]) {
        optionsList = newOptions
    }
    
    // MARK: - UITableViewDataSource

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        optionsList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BaseMenuTableViewCell.self), for: indexPath) as? BaseMenuTableViewCell else { return .init() }

        cell.backgroundColor = .clear

        if let optionsList = optionsList {
            let model: BaseMenuTableViewCell.Model = .init(
                text: optionsList[indexPath.row].text,
                image: optionsList[indexPath.row].image
            )
            cell.configure(with: model)
        }

        cell.selectionStyle = .none
        return cell
    }
}
