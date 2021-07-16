import Foundation
import Moya

enum Endpoint {
    case competitions(tier: String)
}

extension Endpoint: TargetType {
    var baseURL: URL {
        return URL(string: "http://api.football-data.org/v2")!
    }
    
    var path: String {
        switch self {
        case .competitions:
            return "/competitions"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .competitions:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .competitions:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case let .competitions(tier):
            return .requestParameters(parameters: ["plan": tier], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json",
                "X-Auth-Token": "aa272edbbe494d2a8a7ae36a262ab411"]
    }
}
