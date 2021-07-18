import Foundation
import Moya

enum Endpoint {
    case competitions(tier: String)
    case matches(competitionId: String, currentRound: Int?)
}

extension Endpoint: TargetType {
    var baseURL: URL {
        return URL(string: "http://api.football-data.org/v2")!
    }
    
    var path: String {
        switch self {
        case .competitions:
            return "/competitions"
        case .matches(let competitionId, _):
            return "/competitions/\(competitionId)/matches"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .competitions, .matches:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .competitions, .matches:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case let .competitions(tier):
            return .requestParameters(parameters: ["plan": tier], encoding: URLEncoding.queryString)
        case .matches(_, let currentRound):
            return currentRound != nil ?
                .requestParameters(parameters: ["matchday": currentRound!], encoding: URLEncoding.queryString):
                .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json",
                "X-Auth-Token": "aa272edbbe494d2a8a7ae36a262ab411"]
    }
}
