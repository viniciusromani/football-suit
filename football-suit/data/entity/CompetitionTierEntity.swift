import Foundation

enum CompetitionTierEntity {
    case one
    case two
    case three
    case four
    
    init(mapping model: CompetitionTierModel) {
        switch model {
        case .one: self = .one
        case .two: self = .two
        case .three: self = .three
        case .four: self = .four
        }
    }
    
    var apiValue: String {
        switch self {
        case .one: return "TIER_ONE"
        case .two: return "TIER_TWO"
        case .three: return "TIER_THREE"
        case .four: return "TIER_FOUR"
        }
    }
}
