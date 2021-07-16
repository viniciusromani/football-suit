import UIKit

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
