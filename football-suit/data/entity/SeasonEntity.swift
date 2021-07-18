import Foundation

struct SeasonEntity {
    let id: Int
    let startDate: String
    let endDate: String
    let currentRound: Int?
}

extension SeasonEntity: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case startDate
        case endDate
        case currentRound = "currentMatchday"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.startDate = try container.decode(String.self, forKey: .startDate)
        self.endDate = try container.decode(String.self, forKey: .endDate)
        self.currentRound = try  container.decodeIfPresent(Int.self, forKey: .currentRound)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.startDate, forKey: .startDate)
        try container.encode(self.endDate, forKey: .endDate)
        try container.encode(self.currentRound, forKey: .currentRound)
    }
}
