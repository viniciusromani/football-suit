import UIKit
import Moya

protocol CompetitionsListViewProtocol: AnyObject {
    func competitionsFetched(with viewModels: [CompetitionViewModel])
    func errorRetrievingCompetitions()
}

class CompetitionsListViewController: UIViewController {
    private var competitionsView: CompetitionsListView!
    private let presenter: CompetitionsListPresenter
    private lazy var adapter = CompetitionListCollectionViewAdapter(collection: self.competitionsView.collectionView,
                                                                    delegate: self)
    
    init(presenter: CompetitionsListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.competitionsView = CompetitionsListView()
        self.view = self.competitionsView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "Competições"
        self.competitionsView.displayLoading()
        self.presenter.retrieveCompetitions()
    }
}

extension CompetitionsListViewController: CompetitionsListViewProtocol {
    func competitionsFetched(with viewModels: [CompetitionViewModel]) {
        self.competitionsView.removeLoading()
        self.adapter.set(competitions: viewModels)
    }
    
    func errorRetrievingCompetitions() {
        
    }
}

extension CompetitionsListViewController: CompetitionListCollectionViewAdapterDelegate {
    func didSelect(competition: CompetitionViewModel) {
        let provider = MoyaProvider<Endpoint>(plugins: [NetworkLoggerPlugin()])
        let dataSource = ApiMatchDataSource(provider: provider)
        let repository = MatchRepository.init(matchDataSource: dataSource)
        let useCase = RetrieveMatchesUseCase.init(repository: repository)
        let presenter = CompetitionMatchesPresenter(selectedCompetition: competition,
                                                    retrieveMatchesUseCase: useCase)
        let viewController = CompetitionMatchesViewController(presenter: presenter)
        presenter.view = viewController
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
