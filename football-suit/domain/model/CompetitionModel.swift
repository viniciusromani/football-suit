import Foundation

struct CompetitionModel {
    let id: String
    let name: String
    let crest: String?
    let country: CountryModel
    let currentSeason: SeasonModel
}

extension CompetitionModel {
    init(mapping entity: CompetitionEntity) {
        self.id = String(entity.id)
        self.name = entity.name
        self.crest = entity.crest
        self.country = CountryModel(mapping: entity.country)
        self.currentSeason = SeasonModel(mapping: entity.currentSeason)
    }
    
    static func asArray(mapping entities: [CompetitionEntity]) -> [CompetitionModel] {
        return entities.compactMap { CompetitionModel(mapping: $0) }
    }
}
