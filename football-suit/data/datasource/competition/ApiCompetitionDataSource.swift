import Foundation
import Moya
import RxSwift

class ApiCompetitionDataSource: CompetitionDataSource {
    private let provider: MoyaProvider<Endpoint>
    
    init(provider: MoyaProvider<Endpoint>) {
        self.provider = provider
    }
    
    func retrieveCompetitions(tier: String) -> Single<[CompetitionEntity]> {
        return self.provider.rx.request(.competitions(tier: tier))
            .debug()
            .filterSuccessfulStatusCodes()
            .map { response in
                guard let competitionsResponse = try? JSONDecoder().decode(CompetitionsResponse.self, from: response.data) else {
                    throw JSONParseException()
                }
                return competitionsResponse.competitions
            }
    }
}
