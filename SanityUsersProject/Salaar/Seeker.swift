import Foundation
struct Seeker: Codable {
    var userName: String
    var name: String
    var email: String
    //var usage: String
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("seekers").appendingPathExtension("plist")
    
    static func loadFromFile() -> [Seeker]?  {
        guard let codedSeekers = try? Data(contentsOf: ArchiveURL) else {return nil}
        let decoder = PropertyListDecoder()
        return try? decoder.decode(Array<Seeker>.self, from: codedSeekers)
    }
    
    static func loadSampleSeekers() -> [Seeker] {
        return [Seeker(userName: "Ahmady", name: "Ahmad Tariq", email: "ATc"),
                Seeker(userName: "Alooy", name: "Ali Mohammed", email: "Alooy@gmail.com"),
                Seeker(userName: "Sam", name: "Samuel Tarley", email: "sammy@gmail.com"),
                Seeker(userName: "Robb", name: "Robbert Baratheon", email: "robbob@gmail.com")]
    }
    
    static func saveToFile(seekers: [Seeker]) {
        let encoder = PropertyListEncoder()
        let codedSeekers = try? encoder.encode(seekers)
        ((try? codedSeekers?.write(to: ArchiveURL, options: .noFileProtection)) as ()??)
    }
}
