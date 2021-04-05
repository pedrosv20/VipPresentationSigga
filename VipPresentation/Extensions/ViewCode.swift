import UIKit

protocol ViewCodeConfigurator {
    /// Where you add all your subviews.
    func addSubviews()
    /// Where you should place your constraint related functions / setup.
    func constrainSubviews()
    /// Where you setup something other than constraints and view hierarchy
    func configureAdditionalSettings()
}

extension ViewCodeConfigurator {
    fileprivate func initLayout() {
        addSubviews()
        constrainSubviews()
        configureAdditionalSettings()
    }
}

open class CodedView: UIView, ViewCodeConfigurator {
    // MARK: - Initialization

    public override init(frame: CGRect) {
        super.init(frame: frame)
        initLayout()
    }

    public required init?(coder: NSCoder) {
        fatalError("This view cannot be instantiated from IB.")
    }

    // MARK: - Layout Setup

    open func addSubviews() {
        fatalError("You should override this function in order to setup your CodedView.")
    }

    open func constrainSubviews() {
        fatalError("You should override this function in order to setup your CodedView.")
    }
    
    open func configureAdditionalSettings() {}
    
}

open class CodedTableViewCell: UITableViewCell, ViewCodeConfigurator {
    // MARK: - Initialization

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initLayout()
    }

    public required init?(coder: NSCoder) {
        fatalError("This view cannot be instantiated from IB.")
    }

    // MARK: - Layout Setup

    open func addSubviews() {
        fatalError("You should override this function in order to setup your CodedView.")
    }

    open func constrainSubviews() {
        fatalError("You should override this function in order to setup your CodedView.")
    }
    
    open func configureAdditionalSettings() {}
}

open class CodedCollectionViewCell: UICollectionViewCell, ViewCodeConfigurator {
    // MARK: - Initialization
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initLayout()
    }

    public required init?(coder: NSCoder) {
        fatalError("This view cannot be instantiated from IB.")
    }

    // MARK: - Layout Setup

    open func addSubviews() {
        fatalError("You should override this function in order to setup your CodedView.")
    }

    open func constrainSubviews() {
        fatalError("You should override this function in order to setup your CodedView.")
    }
    
    open func configureAdditionalSettings() {}
}
