import UIKit

protocol CompetitionsListViewProtocol: AnyObject {
    func competitionsFetched(with viewModels: [CompetitionViewModel])
    func errorRetrievingCompetitions()
}

class CompetitionsListViewController: UIViewController {
    private var competitionsView: CompetitionsListView!
    private let presenter: CompetitionsListPresenter
    private lazy var adapater = CompetitionListTableViewAdapter(tableView: self.competitionsView.tableView,
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
        self.adapater.set(competitions: viewModels)
    }
    
    func errorRetrievingCompetitions() {
        
    }
}

extension CompetitionsListViewController: CompetitionListTableViewAdapterDelegate {
    
}
