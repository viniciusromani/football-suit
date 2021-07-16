import Foundation

class ImplLocalDataSource: LocalDataSource {
    init() {
        
    }
    
    func retrieveFlag(for country: String) -> String {
        switch country {
        case "Brazil": return "flagBrazil"
        case "England": return "flagEngland"
        case "Europe": return "flagEurope"
        case "France": return "flagFrance"
        case "Germany": return "flagGermany"
        case "Italy": return "flagItaly"
        case "Netherlands": return "flagNetherlands"
        case "Portugal": return "flagPortugal"
        case "South America": return "flagSouthAmerica"
        case "Spain": return "flagSpain"
        case "World": return "flagWorld"
        default: return "flagPlaceholder"
        }
    }
}
