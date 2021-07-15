import Foundation
import RxSwift

protocol CompetitionDataSource {
    func retrieveCompetitions(tier: String) -> Single<[CompetitionEntity]>
}
