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
                    let flag = self.localDataSource.retrieveFlag(for: entity.country.name)
                    let country = CountryEntity(id: entity.country.id,
                                                name: entity.country.name,
                                                flag: flag)
                    let currentSeason = SeasonEntity(id: entity.currentSeason.id,
                                                     startDate: entity.currentSeason.startDate,
                                                     endDate: entity.currentSeason.endDate)
                    return CompetitionEntity(id: entity.id,
                                             name: entity.name,
                                             country: country,
                                             currentSeason: currentSeason)
                }
            }
    }
}
