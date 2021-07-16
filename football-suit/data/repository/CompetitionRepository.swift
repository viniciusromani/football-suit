import Foundation
import RxSwift

struct CompetitionRepository {
    private let competitionDataSource: CompetitionDataSource
    private let localDataSource: LocalDataSource
    
    init(competitionDataSource: CompetitionDataSource,
         localDataSource: LocalDataSource) {
        self.competitionDataSource = competitionDataSource
        self.localDataSource = localDataSource
    }
    
    func retrieveCompetitions(params: RetrieveCompetitionsUseCase.Params) -> Single<[CompetitionEntity]> {
        let tier = CompetitionTierEntity(mapping: params.tier)
        return self.competitionDataSource.retrieveCompetitions(tier: tier.apiValue)
            .map { entities in
                return entities.map { entity in
                    let crest = self.localDataSource.retrieveCrest(for: entity.name)
                    return CompetitionEntity(id: entity.id,
                                             name: entity.name,
                                             crest: crest,
                                             country: entity.country,
                                             currentSeason: entity.currentSeason)
                }
            }
    }
}
