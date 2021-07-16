import Foundation

struct CountryModel {
    let id: String
    let name: String
    let flag: String?
}

extension CountryModel {
    init(mapping entity: CountryEntity) {
        self.id = String(entity.id)
        self.name = entity.name
        self.flag = entity.flag
    }
}
