import Foundation

struct CompetitionModel {
    let id: String
    let name: String
    let country: CountryModel
}

extension CompetitionModel {
    init(mapping entity: CompetitionEntity) {
        self.id = String(entity.id)
        self.name = entity.name
        self.country = CountryModel(mapping: entity.country)
    }
    
    static func asArray(mapping entities: [CompetitionEntity]) -> [CompetitionModel] {
        return entities.compactMap { CompetitionModel(mapping: $0) }
    }
}
