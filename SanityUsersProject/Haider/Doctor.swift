//
//  Doctor.swift
//  Sanity
//
//  Created by Ahmad T on 6/8/19.
//  Copyright © 2019 Ahmad. All rights reserved.
//

import Foundation

struct Doctor: Codable {
    var userName: String
    var name: String
    var email: String
    var location: String
    var available: Bool
    var availabilityStart: Date?
    var availabilityEnd: Date?
    
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("doctors").appendingPathExtension("plist")
    
    static func loadFromFile() -> [Doctor]?  {
        guard let codedDoctors = try? Data(contentsOf: ArchiveURL) else {return nil}
        let decoder = PropertyListDecoder()
        
        return try? decoder.decode(Array<Doctor>.self, from: codedDoctors)
    }
    
    static func loadSampleDoctors() -> [Doctor] {
        
        let dateString1 = "12:45"
        let dateString4 = "3:45"
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "H:mm"
        
        let dateFromString1 = dateFormatter.date(from: dateString1)
        let dateFromString4 = dateFormatter.date(from: dateString4)
        
        return [Doctor(userName: "Dr.Ahmady", name: "Ahmad Tariq", email: "ATc@yahoo.com", location: "123.A", available: true, availabilityStart: dateFromString1, availabilityEnd: dateFromString4),
                Doctor(userName: "Alooy", name: "Ali Mohammed", email: "Alooy@gmail.com", location: "221.C", available: false, availabilityStart: nil, availabilityEnd: nil),
                Doctor(userName: "Sam", name: "Samuel Tarley", email: "sammy@gmail.com", location: "2229.3A", available: false, availabilityStart: nil, availabilityEnd: nil),
                Doctor(userName: "Robb", name: "Robbert Baratheon", email: "robbob@gmail.com", location: "2255.2A", available: true, availabilityStart: dateFromString1, availabilityEnd: dateFromString4)]
    }
    
    static func saveToFile(doctors: [Doctor]) {
        let encoder = PropertyListEncoder()
        let codedDoctors = try? encoder.encode(doctors)
        ((try? codedDoctors?.write(to: ArchiveURL, options: .noFileProtection)) as ()??)
    }
}

