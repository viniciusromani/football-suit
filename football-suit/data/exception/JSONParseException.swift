import Foundation

class JSONParseException: NSError {
    init() {
        super.init(domain: "parse",
                   code: 0,
                   userInfo: [NSLocalizedDescriptionKey: "unexpected json format"])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
