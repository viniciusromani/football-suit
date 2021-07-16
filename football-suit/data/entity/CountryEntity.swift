import Foundation

struct CountryEntity {
    let id: Int
    let name: String
    let flag: String?
}

extension CountryEntity: Codable {
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case flag
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.flag = try container.decodeIfPresent(String.self, forKey: .flag)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.flag, forKey: .flag)
    }
}
