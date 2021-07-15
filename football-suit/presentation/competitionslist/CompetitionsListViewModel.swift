import Foundation

struct CompetitionViewModel {
    let id: String
    let name: String
    let country: CountryViewModel
}
extension CompetitionViewModel {
    init(mapping model: CompetitionModel) {
        self.id = model.id
        self.name = model.name
        self.country = CountryViewModel(mapping: model.country)
    }
    
    static func asArray(mapping models: [CompetitionModel]) -> [CompetitionViewModel] {
        return models.compactMap { CompetitionViewModel(mapping: $0) }
    }
}


struct CountryViewModel {
    let id: String
    let name: String
}
extension CountryViewModel {
    init(mapping model: CountryModel) {
        self.id = model.id
        self.name = model.name
    }
}
