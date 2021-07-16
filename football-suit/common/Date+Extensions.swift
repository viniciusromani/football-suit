import Foundation

extension Date {
    func isSameYear(to toDate: Date) -> Bool {
        let selfComponents = Calendar.current.dateComponents([.year], from: self)
        let toComponents = Calendar.current.dateComponents([.year], from: toDate)
        
        return selfComponents.year == toComponents.year
    }
    
    var year: Int? {
        let components = Calendar.current.dateComponents([.year], from: self)
        return components.year
    }
}
