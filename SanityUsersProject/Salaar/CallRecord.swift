import Foundation

struct CallRecord: Codable {
    var seeker: Seeker
    var volunteer: Volunteer
    var callRecordDate: Date
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
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("callRecords").appendingPathExtension("plist")
    
    static func loadFromFile() -> [CallRecord]?  {
        guard let codedCallRecords = try? Data(contentsOf: ArchiveURL) else {return nil}
        let decoder = PropertyListDecoder()
        return try? decoder.decode(Array<CallRecord>.self, from: codedCallRecords)
    }
    
    static func loadSampleCallRecords() -> [CallRecord]? {
        print("starting to load sample records")
        if let seekers = Seeker.loadFromFile(),
            let volunteers = Volunteer.loadFromFile() {
            print("loading of seekers and volunteers success")
            
            let dateString1 = "06-10-2019 23:42"
            let dateString4 = "06-10-2019 23:42"
            
            let dateFormatter = DateFormatter()
            
            dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
            
            let dateFromString1 = dateFormatter.date(from: dateString1)
            let dateFromString4 = dateFormatter.date(from: dateString4)
            let tempArray = [CallRecord(seeker: (seekers[0]), volunteer: (volunteers[0]), callRecordDate: dateFromString1!, status: Status.up, topic: "Anxiety and Depression"),
                             
                             CallRecord(seeker: (seekers[1]), volunteer: (volunteers[1]), callRecordDate: dateFromString4!, status: Status.up, topic: "Depression"),
                             
                             CallRecord(seeker: (seekers[2]), volunteer: (volunteers[1]), callRecordDate: dateFromString1!, status: Status.down, topic: "Overthinking and Anxiety"),
                             
                             CallRecord(seeker: (seekers[0]), volunteer: (volunteers[3]), callRecordDate: dateFromString1!, status: Status.down, topic: "Stress issues")
            ]
            saveToFile(callRecords: tempArray)
            return tempArray
        }
        return nil
    }
    
    static func saveToFile(callRecords: [CallRecord]) {
        let encoder = PropertyListEncoder()
        if let codedCallRecords = try? encoder.encode(callRecords) {
            print("saved plist successfully")
            ((try? codedCallRecords.write(to: ArchiveURL, options: .noFileProtection)) as ()??)
        } else {
            print("saving plist failed")
        }
        
    }
}

