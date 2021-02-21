import Foundation

struct SeekerAppointment: Codable {
    var name: String
    var location: String
    var dateOfSeekerAppointment: Date
    
    
    
    //save it to the File in the FileManager under "CallRecords"
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("SeekerAppointment").appendingPathExtension("plist")
    
    static func loadFromFile() -> [SeekerAppointment]?  {
        guard let codedSeekerAppointments = try? Data(contentsOf: ArchiveURL) else {return nil}
        let decoder = PropertyListDecoder()
        return try? decoder.decode(Array<SeekerAppointment>.self, from: codedSeekerAppointments)
    }
    
    static func saveToFile(requests: [SeekerAppointment]) {
        let encoder = PropertyListEncoder()
        let codedSeekerAppointments = try? encoder.encode(requests)
        ((try? codedSeekerAppointments?.write(to: ArchiveURL, options: .noFileProtection)) as ()??)
    }
    
    static func loadSampleCallRecords() -> [SeekerAppointment]? {
        
        
        
        if let seekers = Seeker.loadFromFile() {
            let dateString1 = "06-10-2019 23:42"
            let dateString4 = "06-10-2019 23:42"
            
            let dateFormatter = DateFormatter()
            
            dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
            
            let dateFromString1 = dateFormatter.date(from: dateString1)
            let dateFromString4 = dateFormatter.date(from: dateString4)
            
            return [SeekerAppointment (name: "Ahmady", location: "Building 36", dateOfSeekerAppointment: dateFromString1!),
                    SeekerAppointment (name: "Ahmady", location: "Building 36", dateOfSeekerAppointment: dateFromString1!),
                SeekerAppointment (name: "Ahmady", location: "Building 36", dateOfSeekerAppointment: dateFromString1!)
            ]
        }
        
        return nil
    }
    
}
