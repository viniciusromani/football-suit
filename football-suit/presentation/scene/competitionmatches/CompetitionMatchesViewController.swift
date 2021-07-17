import UIKit

protocol CompetitionMatchesViewProtocol: AnyObject {
    func matchesFetched(with viewModels: [CompetitionViewModel])
    func errorRetrievingMatches()
}

class CompetitionMatchesViewController: UIViewController {
    private var matchesView: CompetitionMatchesView!
    private let presenter: CompetitionMatchesPresenter
    
    init(presenter: CompetitionMatchesPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.matchesView = CompetitionMatchesView()
        self.view = self.matchesView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.presenter.retrieveMatches()
    }
}

extension CompetitionMatchesViewController: CompetitionMatchesViewProtocol {
    func matchesFetched(with viewModels: [CompetitionViewModel]) {
        
    }
    
    func errorRetrievingMatches() {
        
    }
}
