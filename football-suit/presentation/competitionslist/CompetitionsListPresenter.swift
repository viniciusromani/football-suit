import Foundation
import RxSwift

class CompetitionsListPresenter {
    weak var view: CompetitionsListViewProtocol?
    
    private let retrieveCompetitionsUseCase: RetrieveCompetitionsUseCase
    
    private let disposeBag = DisposeBag()
    
    init(retrieveCompetitionsUseCase: RetrieveCompetitionsUseCase) {
        self.retrieveCompetitionsUseCase = retrieveCompetitionsUseCase
    }
    
    func retrieveCompetitions() {
        self.retrieveCompetitionsUseCase.execute().subscribe(onSuccess: { [weak self] competitions in
            let viewModels = CompetitionViewModel.asArray(mapping: competitions)
            self?.view?.competitionsFetched(with: viewModels)
        }, onError: { [weak self] exception in
            self?.view?.errorRetrievingCompetitions()
        }).disposed(by: self.disposeBag)
    }
}
