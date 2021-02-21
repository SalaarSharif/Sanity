import Foundation

struct CallReview: Codable {
    var seeker: Seeker
    var status: Status
    var topic: String
    
    enum Status: String, Codable {
        case up
        case down
        
        func description() -> String {
            switch self {
            case .up:
                return "Thumb up"
            case .down:
                return "Thumbs down"
            }
        }
    }
    
    //save it to the File in the FileManager under "CallRecords"
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("callReview").appendingPathExtension("plist")
    
    static func loadFromFile() -> [CallReview]?  {
        guard let codedCallRecords = try? Data(contentsOf: ArchiveURL) else {return nil}
        let decoder = PropertyListDecoder()
        return try? decoder.decode(Array<CallReview>.self, from: codedCallRecords)
    }
    
    static func saveToFile(callRecords: [CallReview]) {
        let encoder = PropertyListEncoder()
        let codedCallRecords = try? encoder.encode(callRecords)
        ((try? codedCallRecords?.write(to: ArchiveURL, options: .noFileProtection)) as ()??)
    }
    
    static func loadSampleCallRecords() -> [CallReview]? {
        
        
        
        if let seekers = Seeker.loadFromFile() {
//        let dateString1 = "06-10-2019 23:42"
//        let dateString4 = "06-10-2019 23:42"
//
//        let dateFormatter = DateFormatter()
//
//        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
//
//        let dateFromString1 = dateFormatter.date(from: dateString1)
//        let dateFromString4 = dateFormatter.date(from: dateString4)
        
            return [CallReview(seeker: (seekers[0]), status: CallReview.Status.up, topic: "Depression"),
                CallReview(seeker: seekers[0], status: CallReview.Status.up, topic: "Depression"),
                CallReview(seeker: seekers[0], status: CallReview.Status.up, topic: "Depression"),
                CallReview(seeker: seekers[0], status: CallReview.Status.up, topic: "Depression")
        ]
        }
        
        return nil
    }
    
}
