//
//  Appointment.swift
//  Sanity
//
//  Created by Ahmad T on 6/8/19.
//  Copyright © 2019 Ahmad. All rights reserved.
//

import Foundation

struct Appointment: Codable {
    var patient: Seeker
    var doctor: Doctor
    var appointmentDate: Date
    var status: Status
    var issue: String
    
    enum Status: String, Codable {
        case attended
        case notAttend
        case cancelled
        case unknown
        
        func description() -> String {
            switch self {
            case .attended:
                return "Attended"
            case .notAttend:
                return "Did not attend"
            case .cancelled:
                return "Cancelled"
            case .unknown:
                return "Unknown"
            }
        }
    }
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("appointments").appendingPathExtension("plist")
    
    static func loadFromFile() -> [Appointment]?  {
        guard let codedAppointments = try? Data(contentsOf: ArchiveURL) else {return nil}
        let decoder = PropertyListDecoder()
        return try? decoder.decode(Array<Appointment>.self, from: codedAppointments)
    }
    
    static func loadSampleAppointments() -> [Appointment]? {
        
        if let seekers = Seeker.loadFromFile(),
            let doctors = Doctor.loadFromFile() {
            
            
            let dateString1 = "06-10-2019 23:42"
            let dateString4 = "06-10-2019 23:42"
            
            let dateFormatter = DateFormatter()
            
            dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
            
            let dateFromString1 = dateFormatter.date(from: dateString1)
            let dateFromString4 = dateFormatter.date(from: dateString4)
            
            return [Appointment(patient: (seekers[0]), doctor: (doctors[0]), appointmentDate: dateFromString1!, status: Status.attended, issue: "Anxiety and Depression"),
                    
                    Appointment(patient: (seekers[1]), doctor: (doctors[0]), appointmentDate: dateFromString4!, status: Status.attended, issue: "Depression"),
                    
                    Appointment(patient: (seekers[2]), doctor: (doctors[0]), appointmentDate: dateFromString1!, status: Status.cancelled, issue: "Overthinking and Anxiety"),
                    
                    Appointment(patient: (seekers[0]), doctor: (doctors[0]), appointmentDate: dateFromString1!, status: Status.notAttend, issue: "Stress issues"),
                    
                    Appointment(patient: (seekers[3]), doctor: (doctors[0]), appointmentDate: dateFromString1!, status: Status.notAttend, issue: "Stress issues")
            ]
        }
        return nil
    }
    
    static func saveToFile(appointments: [Appointment]) {
        let encoder = PropertyListEncoder()
        let codedAppointments = try? encoder.encode(appointments)
        ((try? codedAppointments?.write(to: ArchiveURL, options: .noFileProtection)) as ()??)
    }
}

