import Foundation
import UIKit

struct CompetitionViewModel {
    let id: String
    let name: String
    let crest: UIImage?
    let country: CountryViewModel
    let currentSeason: SeasonViewModel
}
extension CompetitionViewModel {
    init(mapping model: CompetitionModel) {
        self.id = model.id
        self.name = model.name
        self.crest = model.crest != nil ?
            UIImage(named: model.crest!):
            nil
        self.country = CountryViewModel(mapping: model.country)
        self.currentSeason = SeasonViewModel(mapping: model.currentSeason)
    }
    
    static func asArray(mapping models: [CompetitionModel]) -> [CompetitionViewModel] {
        return models.compactMap { CompetitionViewModel(mapping: $0) }
    }
}
