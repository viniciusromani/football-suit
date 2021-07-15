import UIKit

extension UIView {
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach(addSubview)
    }
}

extension UIStackView {
    func addArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach(addArrangedSubview)
    }
    
    func removeArrangedSubviews() {
        arrangedSubviews.forEach(removeArrangedSubview)
    }
}
