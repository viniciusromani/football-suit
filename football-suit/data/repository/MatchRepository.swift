import Foundation
import RxSwift

struct MatchRepository {
    private let matchDataSource: MatchDataSource
    
    init(matchDataSource: MatchDataSource) {
        self.matchDataSource = matchDataSource
    }
    
    func retrieveMatches(params: RetrieveMatchesUseCase.Params) -> Single<[MatchEntity]> {
        return self.matchDataSource.retrieveMatches(forCompetition: params.competitionId)
    }
}
