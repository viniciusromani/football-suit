import UIKit

struct CountryViewModel {
    let id: String
    let name: String
    let flag: UIImage?
}
extension CountryViewModel {
    init(mapping model: CountryModel) {
        self.id = model.id
        self.name = model.name
        if let flagAsset = model.flag {
            self.flag = UIImage(named: flagAsset)
        } else {
            self.flag = nil
        }
    }
}
