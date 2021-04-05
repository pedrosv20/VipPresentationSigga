import UIKit

protocol BaseMenuAssembling {
     func resolveViewController() -> UIViewController
}

final class BaseMenuAssembler: BaseMenuAssembling {
     func resolveViewController() -> UIViewController {
         let presenter = BaseMenuPresenter()

        let useCases: BaseMenuInteractor.UseCases = .init(loadBaseMenuUseCase: LoadBaseMenuUseCase())

         let interactor = BaseMenuInteractor(
             presenter: presenter,
             useCases: useCases
         )

         let viewController = BaseMenuViewController(
             interactor: interactor
         )

         let router = BaseMenuRouter(
             viewController: viewController
         )

         router.dataStore = interactor
         presenter.viewController = viewController
         viewController.router = router

         return viewController
     }
}
