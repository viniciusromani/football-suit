import Foundation

struct MatchScoreEntity {
    let homeTeamGoals: Int
    let awayTeamGoals: Int
}

extension MatchScoreEntity: Codable {
    private enum OuterContainerCodingKeys: String, CodingKey {
        case fullTime
    }
    
    private enum CodingKeys: String, CodingKey {
        case homeTeamGoals = "homeTeam"
        case awayTeamGoals = "awayTeam"
    }
    
    init(from decoder: Decoder) throws {
        let outerContainer = try decoder.container(keyedBy: OuterContainerCodingKeys.self)
        let container = try outerContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .fullTime)
        self.homeTeamGoals = try container.decode(Int.self, forKey: .homeTeamGoals)
        self.awayTeamGoals = try container.decode(Int.self, forKey: .awayTeamGoals)
    }
    
    func encode(to encoder: Encoder) throws {
        var outerContainer = encoder.container(keyedBy: OuterContainerCodingKeys.self)
        var container = outerContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .fullTime)
        try container.encode(self.homeTeamGoals, forKey: .homeTeamGoals)
        try container.encode(self.awayTeamGoals, forKey: .awayTeamGoals)
    }
}
