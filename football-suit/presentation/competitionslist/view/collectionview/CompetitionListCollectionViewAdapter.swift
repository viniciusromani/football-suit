import UIKit

protocol CompetitionListCollectionViewAdapterDelegate: AnyObject {
    
}

class CompetitionListCollectionViewAdapter: NSObject {
    private let collection: UICollectionView
    private let delegate: CompetitionListCollectionViewAdapterDelegate
    private var viewModel: [CompetitionViewModel]?
    
    init(collection: UICollectionView,
         delegate: CompetitionListCollectionViewAdapterDelegate) {
        self.collection = collection
        self.delegate = delegate
        
        super.init()
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        
        self.collection.collectionViewLayout = flowLayout
        self.collection.delegate = self
        self.collection.dataSource = self
        self.collection.registerCell(CompetitionListCollectionViewCell.self)
    }
}

extension CompetitionListCollectionViewAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let unwrapped = self.viewModel else {
            return collectionView.dequeueReusableCell(for: indexPath)
        }
        
        let cell: CompetitionListCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.set(viewModel: unwrapped[indexPath.row])
        return cell
    }
}

extension CompetitionListCollectionViewAdapter: UICollectionViewDelegate {
    
}

extension CompetitionListCollectionViewAdapter: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = CGFloat(248)
        let cellSpacing = (collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 10
        let halfOfWidth = (collectionView.bounds.width - (cellSpacing * 2)) / 2
        let size = CGSize(width: halfOfWidth - (cellSpacing * 2), height: cellHeight)
        return size
    }
}

extension CompetitionListCollectionViewAdapter {
    func set(competitions: [CompetitionViewModel]) {
        self.viewModel = competitions
        self.collection.reloadData()
    }
}
