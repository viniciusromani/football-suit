import Foundation

enum MatchStatusModel {
    case scheduled
    case live
    case inPlay
    case paused
    case finished
    case postponed
    case suspended
    case canceled
    
    init(mapping entity: MatchStatusEntity) {
        switch entity {
        case .scheduled: self = .scheduled
        case .live: self = .live
        case .inPlay: self = .inPlay
        case .paused: self = .paused
        case .finished: self = .finished
        case .postponed: self = .postponed
        case .suspended: self = .suspended
        case .canceled: self = .canceled
        }
    }
}
