import Foundation

enum MatchStatusEntity: String {
    case scheduled = "SCHEDULED"
    case live = "LIVE"
    case inPlay = "IN_PLAY"
    case paused = "PAUSED"
    case finished = "FINISHED"
    case postponed = "POSTPONED"
    case suspended = "SUSPENDED"
    case canceled = "CANCELED"
}

extension MatchStatusEntity: Codable { }
