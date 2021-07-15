import Foundation

struct CountryModel {
    let id: String
    let name: String
}

extension CountryModel {
    init(mapping entity: CountryEntity) {
        self.id = String(entity.id)
        self.name = entity.name
    }
}
