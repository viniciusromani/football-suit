import Foundation
import RxSwift

class CompetitionMatchesPresenter {
    weak var view: CompetitionMatchesViewProtocol?
    private let selectedCompetition: CompetitionViewModel
    
    private let retrieveMatchesUseCase: RetrieveMatchesUseCase
    
    private let disposeBag = DisposeBag()
    
    init(selectedCompetition: CompetitionViewModel,
         retrieveMatchesUseCase: RetrieveMatchesUseCase) {
        self.selectedCompetition = selectedCompetition
        self.retrieveMatchesUseCase = retrieveMatchesUseCase
    }
    
    func retrieveMatches() {
        let params = RetrieveMatchesUseCase.Params(competitionId: self.selectedCompetition.id)
        self.retrieveMatchesUseCase.execute(with: params).subscribe(onSuccess: { [weak self] matches in
            print(matches)
        }, onError: { [weak self] exception in
            print(exception)
        }).disposed(by: self.disposeBag)
    }
}
