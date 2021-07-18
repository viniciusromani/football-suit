import Foundation

struct MatchEntity {
    let id: Int
    let date: String
    let status: MatchStatusEntity
    let homeTeam: TeamEntity
    let awayTeam: TeamEntity
    let score: MatchScoreEntity?
}

extension MatchEntity: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case date = "utcDate"
        case status
        case homeTeam
        case awayTeam
        case score
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.date = try container.decode(String.self, forKey: .date)
        self.status = try container.decode(MatchStatusEntity.self, forKey: .status)
        self.homeTeam = try container.decode(TeamEntity.self, forKey: .homeTeam)
        self.awayTeam = try container.decode(TeamEntity.self, forKey: .awayTeam)
        self.score = self.status == .finished ?
            try container.decodeIfPresent(MatchScoreEntity.self, forKey: .score):
            nil
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.date, forKey: .date)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.homeTeam, forKey: .homeTeam)
        try container.encode(self.awayTeam, forKey: .awayTeam)
        try container.encode(self.score, forKey: .score)
    }
}

struct MatchesResponse {
    let matches: [MatchEntity]
}

extension MatchesResponse: Codable {
    private enum CodingKeys: String, CodingKey {
        case matches
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.matches = try container.decode([MatchEntity].self, forKey: .matches)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.matches, forKey: .matches)
    }
}
