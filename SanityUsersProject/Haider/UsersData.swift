//
//  UsersData.swift
//  MobileProgrammingProject
//
//  Created by MobileProg on 6/17/19.
//  Copyright © 2019 MobileProg. All rights reserved.
//

import UIKit
struct UsersData: Codable {
    var userName: String
    var email: String
    var password: String
    var userType: String

    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("usersdata").appendingPathExtension("plist")

    
    static func loadFromFile() -> [UsersData]?  {
        guard let codedUsers = try? Data(contentsOf: ArchiveURL) else {return nil}
        let decoder = PropertyListDecoder()
        
        return try? decoder.decode(Array<UsersData>.self, from: codedUsers)
    }
    
    static func saveToFile(Users: [UsersData]) {
        let encoder = PropertyListEncoder()
        let codedUsers = try? encoder.encode(Users)
        ((try? codedUsers?.write(to: ArchiveURL, options: .noFileProtection)) as ()??)
    }
  
}


