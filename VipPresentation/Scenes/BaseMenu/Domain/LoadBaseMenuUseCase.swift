import UIKit

struct MenuOption {
    let name: String
    let icon: UIImage
    let action: Action

    struct Action: Equatable {
        let name: String
        let id: UUID = .init()
    }
}

extension MenuOption.Action {
    static let openSettings: MenuOption.Action = .init(name: "openSettings")
    static let openOther: MenuOption.Action = .init(name: "openOther")
}

protocol LoadBaseMenuUseCaseProtocol {
    func execute() -> [MenuOption]
}

final class LoadBaseMenuUseCase: LoadBaseMenuUseCaseProtocol {
    func execute() -> [MenuOption] {
        [
            .init(name: "Settings", icon: UIImage.add, action: .openSettings),
            .init(name: "Other", icon: UIImage.add, action: .openOther),
            .init(name: "Julinha", icon: UIImage.add, action: .openOther),
        ]
    }
}
