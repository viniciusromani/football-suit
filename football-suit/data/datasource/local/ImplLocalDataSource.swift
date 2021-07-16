import Foundation

class ImplLocalDataSource: LocalDataSource {
    init() {
        
    }
    
    func retrieveCrest(for championship: String) -> String {
        switch championship {
        case "Campeonato Brasileiro Série A": return "crestBrazilianChampionshipSeriesA"
        case "Championship": return "crestEnglandChampionship"
        case "Premier League": return "crestEnglandPremierLeague"
        case "UEFA Champions League": return "crestEuropeChampionsLeague"
        case "European Championship": return "crestEuropeEurocup"
        case "Ligue 1": return "crestFranceLigue1"
        case "Bundesliga": return "crestGermanyBundesliga"
        case "Serie A": return "crestItalySerieA"
        case "Eredivisie": return "crestNetherlandsEredivisie"
        case "Primeira Liga": return "crestPortugalPrimeiraLiga"
        case "Copa Libertadores": return "crestSouthAmericaLibertadores"
        case "Primera Division": return "crestSpainLaLiga"
        case "FIFA World Cup": return "crestWorldFifaWorldCup"
        default: return ""
        }
    }
}
