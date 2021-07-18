import Foundation
import Moya
import RxSwift

class ApiMatchDataSource: MatchDataSource {
    private let provider: MoyaProvider<Endpoint>
    
    init(provider: MoyaProvider<Endpoint>) {
        self.provider = provider
    }
    
    func retrieveMatches(forCompetition competitionId: String,
                         round: Int?) -> Single<[MatchEntity]> {
        return self.provider.rx.request(.matches(competitionId: competitionId, currentRound: round))
            .debug()
            .filterSuccessfulStatusCodes()
            .map { response in
                guard let matchesResponse = try? JSONDecoder().decode(MatchesResponse.self, from: response.data) else {
                    throw JSONParseException()
                }
                return matchesResponse.matches
            }
    }
}
