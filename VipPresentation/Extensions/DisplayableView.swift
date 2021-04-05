import Foundation

/// Defines a constrain to use o views that have to hold a model to it's data
/// like Collection and TableViewCells
public protocol DisplayableView {
    associatedtype Model
    var model: Model? { get }
    func configure(with model: Model)
}
