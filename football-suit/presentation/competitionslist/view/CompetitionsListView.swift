import UIKit
import SnapKit

class CompetitionsListView: UIView {
    private let title = UILabel()
    
    init() {
        super.init(frame: .zero)
        self.buildViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViews() {
        self.addSubviews()
        self.formatViews()
        self.addConstraintsToSubviews()
    }
    
    private func addSubviews() {
        self.addSubviews([self.title])
    }
    
    private func formatViews() {
        self.backgroundColor = .white
        
        self.title.tintColor = .black
        self.title.font = .systemFont(ofSize: 24)
        self.title.textAlignment = .center
    }
    
    private func addConstraintsToSubviews() {
        title.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension CompetitionsListView {
    func setTitle(_ title: String) {
        self.title.text = title
    }
}
