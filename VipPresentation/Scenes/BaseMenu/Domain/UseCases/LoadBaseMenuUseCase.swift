import UIKit

struct MenuOption: Equatable {
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
            .init(name: "Settings", icon: UIImage.strokedCheckmark, action: .openSettings),
            .init(name: "Organizational Structure", icon: UIImage.actions, action: .openOther),
            .init(name: "Sinchronism", icon: UIImage.checkmark, action: .openOther),
            .init(name: "Logout", icon: UIImage.remove, action: .openOther),
        ]
    }
}
