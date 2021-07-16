import UIKit
import SnapKit

class CompetitionsListView: UIView, LoadableView {
    let collectionView = UICollectionView(frame: .zero,
                                      collectionViewLayout: UICollectionViewFlowLayout())
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
        self.addSubview(self.collectionView)
    }
    
    private func formatViews() {
        self.backgroundColor = .white
        
        self.collectionView.backgroundColor = .clear
        self.collectionView.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
    }
    
    private func addConstraintsToSubviews() {
        collectionView.snp.makeConstraints { make in
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
