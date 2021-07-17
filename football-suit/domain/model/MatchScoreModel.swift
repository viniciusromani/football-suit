import Foundation

struct MatchScoreModel {
    let homeTeamGoals: Int
    let awayTeamGoals: Int
}

extension MatchScoreModel {
    init?(mapping entity: MatchScoreEntity?) {
        guard let unwrapped = entity else {
            return nil
        }
        
        self.homeTeamGoals = unwrapped.homeTeamGoals
        self.awayTeamGoals = unwrapped.awayTeamGoals
    }
}
