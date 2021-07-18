import Foundation

struct SeasonModel {
    let id: String
    let startDate: Date?
    let endDate: Date?
    let currentRound: Int?
}

extension SeasonModel {
    init(mapping entity: SeasonEntity) {
        self.id = String(entity.id)
        self.startDate = CachedDateFormatter.shared.englishDateFormat().date(from: entity.startDate)
        self.endDate = CachedDateFormatter.shared.englishDateFormat().date(from: entity.endDate)
        self.currentRound = entity.currentRound
    }
}
