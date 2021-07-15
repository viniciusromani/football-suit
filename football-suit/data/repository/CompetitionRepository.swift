import Foundation
import RxSwift

struct CompetitionRepository {
    private let competitionDataSource: CompetitionDataSource
    
    init(competitionDataSource: CompetitionDataSource) {
        self.competitionDataSource = competitionDataSource
    }
    
    func retrieveCompetitions(params: RetrieveCompetitionsUseCase.Params) -> Single<[CompetitionEntity]> {
        let tier = CompetitionTierEntity(mapping: params.tier)
        return self.competitionDataSource.retrieveCompetitions(tier: tier.apiValue)
    }
}
