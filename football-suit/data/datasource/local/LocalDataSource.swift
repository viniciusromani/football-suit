import Foundation

protocol LocalDataSource {
    func retrieveFlag(for country: String) -> String
}
