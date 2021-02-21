import Foundation

struct Volunteer: Codable {
    //var image: URL
    var userName: String
    var name: String
    var email: String
    var usersHelped: Int {
        
        var helped: Int = 0
        if let callsRecord = CallRecord.loadFromFile() {
            print("call record loaded")
            for rec in callsRecord {
                print("scanning...")
                if rec.volunteer.userName == self.userName {
                    print("volunteer with the same name is found")
                    if rec.status == .up || rec.status == .down {
                        print("thumbs up is added")
                        helped += 1
                    }
                }
            }
        }
        return helped
        
    }
    var thumbsUps: Int {
        print("call record loaded")
        var ups: Int = 0
        if let callsRecord = CallRecord.loadFromFile() {
            print("scanning...")
            for rec in callsRecord {
                
                if rec.volunteer.userName == self.userName {
                    print("volunteer with the same name is found")
                    if rec.status == .up {
                        print("thumbs up is added")
                        ups += 1
                    }
                }
            }
        } else {
            print("record not found")
        }
        return ups
        
    }
    var thumbsDowns: Int {
        
        var downs: Int = 0
        if let callsRecord = CallRecord.loadFromFile() {
            
            for rec in callsRecord {
                if rec.volunteer.userName == self.userName {
                    if rec.status == .down {
                        downs += 1
                    }
                }
            }
        }
        return downs
        
    }
    //var usage: String
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("volunteers").appendingPathExtension("plist")
    
    static func loadFromFile() -> [Volunteer]?  {
        guard let codedVolunteers = try? Data(contentsOf: ArchiveURL) else {return nil}
        let decoder = PropertyListDecoder()
        return try? decoder.decode(Array<Volunteer>.self, from: codedVolunteers)
    }
    
    private func checkVotes() -> (Int, Int) {
        var ups: Int = 0
        var downs: Int = 0
        if let callsRecord = CallRecord.loadFromFile() {
            
            for rec in callsRecord {
                if rec.volunteer.userName == "louiS" {
                    if rec.status == .up {
                        ups += 1
                    } else if rec.status == .down {
                        downs += 1
                    }
                }
                
            }
        }
        return (ups, downs)
    }
    static func loadSampleVolunteers() -> [Volunteer] {
        
        
        return [Volunteer(userName: "Volunteer", name: "Amy", email: "Amy@gmail.com")]
    }
    
    static func saveToFile(volunteers: [Volunteer]) {
        let encoder = PropertyListEncoder()
        let codedVolunteers = try? encoder.encode(volunteers)
        ((try? codedVolunteers?.write(to: ArchiveURL, options: .noFileProtection)) as ()??)
    }
}

