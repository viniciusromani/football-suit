import Foundation
import RxSwift

protocol MatchDataSource {
    func retrieveMatches(forCompetition competitionId: String) -> Single<[MatchEntity]>
}
