import Foundation

struct MatchModel {
    let id: String
    let date: Date?
    let status: MatchStatusModel
    let homeTeam: TeamModel
    let awayTeam: TeamModel
    let score: MatchScoreModel?
}

extension MatchModel {
    init(mapping entity: MatchEntity) {
        self.id = String(entity.id)
        self.date = CachedDateFormatter.shared.englishDateFormat().date(from: entity.date)
        self.status = MatchStatusModel(mapping: entity.status)
        self.homeTeam = TeamModel(mapping: entity.homeTeam)
        self.awayTeam = TeamModel(mapping: entity.awayTeam)
        self.score = MatchScoreModel(mapping: entity.score)
    }
    
    static func asArray(mapping entities: [MatchEntity]) -> [MatchModel] {
        return entities.compactMap { MatchModel(mapping: $0) }
    }
}
