import UIKit

protocol BaseMenuPresentationLogic {
	func presentMenuOptionList(_ response: BaseMenuScene.MenuOptionList.Response)
    func presentSelectedOption(_ response: BaseMenuScene.SelectOption.Response)
}

final class BaseMenuPresenter: BaseMenuPresentationLogic {
	// MARK: - Dependencies
	
	weak var viewController: BaseMenuDisplayLogic?
	
	// MARK: - BaseMenuPresentationLogic
	
	func presentMenuOptionList(_ response: BaseMenuScene.MenuOptionList.Response) {
        let model: [BaseMenuScene.MenuOptionList.ViewModel.Model] = response.optionsList.map {
            BaseMenuScene.MenuOptionList.ViewModel.Model.init(text: $0.name, image: $0.icon)
        }
        let viewModel = BaseMenuScene.MenuOptionList.ViewModel.init(model: model)
		viewController?.displayMenuOptions(viewModel)
	}
    
    func presentSelectedOption(_ response: BaseMenuScene.SelectOption.Response) {
        switch response.action {
        case .openOther:
            viewController?.displayOther()
        case .openSettings:
            viewController?.displaySettings() 
        default:
            ()
        }
    }
}
