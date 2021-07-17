import UIKit
import SnapKit

class CompetitionMatchesView: UIView, LoadableView {
    private let title = UILabel()
    var activityIndicator = UIActivityIndicatorView(style: .large)
    
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
        self.addSubview(self.title)
    }
    
    private func formatViews() {
        self.backgroundColor = .white
        
        self.title.text = "Hello World"
        self.title.font = .systemFont(ofSize: 16)
        self.title.textColor = .black
    }
    
    private func addConstraintsToSubviews() {
        title.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
