import UIKit
import SnapKit

class CompetitionsListView: UIView, LoadableView {
    let tableView = UITableView()
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
        self.addSubview(self.tableView)
    }
    
    private func formatViews() {
        self.backgroundColor = .white
        
        self.tableView.backgroundColor = .clear
        self.tableView.tableFooterView = UIView()
    }
    
    private func addConstraintsToSubviews() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension CompetitionsListView {
    func displayLoading() {
        self.showLoading(at: self)
    }
    
    func removeLoading() {
        self.hideLoading()
    }
}
