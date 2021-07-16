import Foundation

protocol LocalDataSource {
    func retrieveCrest(for championship: String) -> String
}
