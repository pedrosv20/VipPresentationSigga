import UIKit

extension BaseMenuTableViewCell {
    typealias Model = BaseMenuScene.MenuOptionList.ViewModel.Model
}

final class BaseMenuTableViewCell: CodedTableViewCell {
    // MARK: - Dependencies

    var model: Model?

    // MARK: - ViewMetrics

    private enum ViewMetrics {
        static let margin: CGFloat = 20
        static let cellSpacing: CGFloat = 10
        static let iconImageViewLeading: CGFloat = 8
        static let optionLabelHeight: CGFloat = 25
    }

    // MARK: - UIComponents

    private lazy var roundedView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .clear
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var iconImageView: UIImageView = {
        let view = UIImageView()
        view.image = .add
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        view.layer.cornerRadius = 8
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var optionLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Dependencies

    // MARK: - Setup Layout

    override func addSubviews() {
        contentView.addSubview(roundedView)
        roundedView.addSubview(iconImageView)
        roundedView.addSubview(optionLabel)
    }

    override func constrainSubviews() {
        configureRoundedView()
        configureIconImageView()
        configureOptionLabel()
    }

    // MARK: - Setup Constraints

    private func configureRoundedView() {
        NSLayoutConstraint.activate([
            roundedView.centerYAnchor.constraint(
                equalTo: centerYAnchor
            ),
            roundedView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: ViewMetrics.cellSpacing
            ),
            roundedView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: ViewMetrics.margin
            ),
            roundedView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -ViewMetrics.margin
            ),
            contentView.heightAnchor.constraint(
                equalToConstant: 60
            ),
        ])
    }

    
    private func configureIconImageView() {
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(
                equalTo: roundedView.centerYAnchor
            ),
            iconImageView.topAnchor.constraint(
                equalTo: roundedView.topAnchor
            ),
            iconImageView.bottomAnchor.constraint(
                equalTo: roundedView.bottomAnchor
            ),
            iconImageView.leadingAnchor.constraint(
                equalTo: roundedView.leadingAnchor,
                constant: ViewMetrics.iconImageViewLeading
            ),
            iconImageView.widthAnchor.constraint(
                equalTo: iconImageView.heightAnchor
            ),
            iconImageView.heightAnchor.constraint(
                equalToConstant: ViewMetrics.optionLabelHeight
            ),
        ])
    }

    private func configureOptionLabel() {
        NSLayoutConstraint.activate([
            optionLabel.topAnchor.constraint(
                equalTo: roundedView.topAnchor,
                constant: ViewMetrics.cellSpacing
            ),
            optionLabel.bottomAnchor.constraint(
                equalTo: roundedView.bottomAnchor,
                constant: -ViewMetrics.cellSpacing
            ),
            optionLabel.leadingAnchor.constraint(
                equalTo: iconImageView.trailingAnchor,
                constant: ViewMetrics.margin
            ),
            optionLabel.trailingAnchor.constraint(
                equalTo: roundedView.trailingAnchor,
                constant: -ViewMetrics.margin
            ),
            optionLabel.heightAnchor.constraint(
                equalToConstant: ViewMetrics.optionLabelHeight
            ),
        ])
    }

    // MARK: - Cell Lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()
        model = nil
    }
}

extension BaseMenuTableViewCell: DisplayableView {
    func configure(with model: Model) {
        optionLabel.text = model.text
        iconImageView.image = model.image
        self.model = model
    }
}
