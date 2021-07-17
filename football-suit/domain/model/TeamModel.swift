import Foundation

struct TeamModel {
    let id: String
    let name: String
}

extension TeamModel {
    init(mapping entity: TeamEntity) {
        self.id = String(entity.id)
        self.name = entity.name
    }
}
