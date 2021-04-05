import UIKit

enum BaseMenuScene { 
	// MARK: Interactor Use Cases
	
	enum MenuOptionList {
		struct Request {}
		struct Response {
            let optionsList: [MenuOption]
        }
		struct ViewModel {
            let model: [Model]
            struct Model {
                let text: String
                let image: UIImage
            }
        }
	}
    
    enum SelectOption {
        struct Request {
            let indexPath: IndexPath
        }
        struct Response {
            let action: MenuOption.Action
        }
        struct ViewModel {}
    }
}
