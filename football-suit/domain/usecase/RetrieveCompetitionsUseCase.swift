import Foundation
import RxSwift

struct RetrieveCompetitionsUseCase: SingleUseCase {
    struct Params {
        let tier: CompetitionTierModel
    }
    typealias Model = [CompetitionModel]
    
    private let repository: CompetitionRepository
    
    init(repository: CompetitionRepository) {
        self.repository = repository
    }
    
    func execute(with params: RetrieveCompetitionsUseCase.Params? = nil) -> Single<[CompetitionModel]> {
        var incoming: RetrieveCompetitionsUseCase.Params
        if let unwrapped = params {
            incoming = unwrapped
        } else {
            incoming = RetrieveCompetitionsUseCase.Params(tier: .one)
        }
        
        return self.repository.retrieveCompetitions(params: incoming)
            .map { CompetitionModel.asArray(mapping: $0) }
    }
}
