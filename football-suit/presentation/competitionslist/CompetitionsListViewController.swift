import UIKit

protocol CompetitionsListViewProtocol: AnyObject {
    func competitionsFetched(with viewModels: [CompetitionViewModel])
    func errorRetrievingCompetitions()
}

class CompetitionsListViewController: UIViewController {
    private var competitionsView: CompetitionsListView!
    private let presenter: CompetitionsListPresenter
    
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
        
        self.presenter.retrieveCompetitions()
    }
}

extension CompetitionsListViewController: CompetitionsListViewProtocol {
    func competitionsFetched(with viewModels: [CompetitionViewModel]) {
        print(viewModels)
    }
    
    func errorRetrievingCompetitions() {
        
    }
}
