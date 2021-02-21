import Foundation

struct CallRequest: Codable {
    var userName: String
    var topic: String
    var dateOfCallRequest: Date
    
    
    
    //save it to the File in the FileManager under "CallRecords"
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("requests").appendingPathExtension("plist")
    
    static func loadFromFile() -> [CallRequest]?  {
        guard let codedCallRequests = try? Data(contentsOf: ArchiveURL) else {return nil}
        let decoder = PropertyListDecoder()
        return try? decoder.decode(Array<CallRequest>.self, from: codedCallRequests)
    }
    
    static func saveToFile(requests: [CallRequest]) {
        let encoder = PropertyListEncoder()
        let codedCallRequests = try? encoder.encode(requests)
        ((try? codedCallRequests?.write(to: ArchiveURL, options: .noFileProtection)) as ()??)
    }
    
    static func loadSampleCallRecords() -> [CallRequest]? {
            let dateString1 = "06-10-2019 23:42"
            let dateString4 = "06-10-2019 23:42"
            
            let dateFormatter = DateFormatter()
            
            dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
            
            let dateFromString1 = dateFormatter.date(from: dateString1)
            let dateFromString4 = dateFormatter.date(from: dateString4)
            
            return [CallRequest(userName: "Ahmady", topic: "Depression", dateOfCallRequest: dateFromString1! ),
                    CallRequest(userName: "Ahmady", topic: "Anxeity", dateOfCallRequest: dateFromString1!),
                    CallRequest(userName: "Ahmady", topic: "Stress", dateOfCallRequest: dateFromString1!)]
        }
    
    

    }
