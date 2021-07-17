import Foundation
import RxSwift

struct RetrieveMatchesUseCase: SingleUseCase {
    struct Params {
        let competitionId: String
    }
    typealias Model = [MatchModel]
    
    private let repository: MatchRepository
    
    init(repository: MatchRepository) {
        self.repository = repository
    }
    
    func execute(with params: RetrieveMatchesUseCase.Params?) -> Single<[MatchModel]> {
        let unwrapped = self.unwrappParams(params)
        return self.repository.retrieveMatches(params: unwrapped)
            .map { MatchModel.asArray(mapping: $0) }
    }
}
