import Foundation

struct SeasonViewModel {
    let id: String
    let year: String?
}
extension SeasonViewModel {
    init(mapping model: SeasonModel) {
        self.id = model.id
        
        guard let startDate = model.startDate,
              let endDate = model.endDate else {
            self.year = nil
            return
        }
        
        let start = CachedDateFormatter.shared.shortYearFormat().string(from: startDate)
        self.year = startDate.isSameYear(to: endDate) ?
            "Season \(start)":
            "Season \(start)/\(CachedDateFormatter.shared.shortYearFormat().string(from: endDate))"
    }
}
