import Foundation

struct CompetitionEntity {
    let id: Int
    let name: String
    let country: CountryEntity
    let currentSeason: SeasonEntity
}

extension CompetitionEntity: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case country = "area"
        case currentSeason
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.country = try container.decode(CountryEntity.self, forKey: .country)
        self.currentSeason = try container.decode(SeasonEntity.self, forKey: .currentSeason)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.country, forKey: .country)
        try container.encode(self.currentSeason, forKey: .currentSeason)
    }
}


struct CompetitionsResponse {
    let competitions: [CompetitionEntity]
}

extension CompetitionsResponse: Codable {
    private enum CodingKeys: String, CodingKey {
        case competitions
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.competitions = try container.decode([CompetitionEntity].self, forKey: .competitions)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.competitions, forKey: .competitions)
    }
}
