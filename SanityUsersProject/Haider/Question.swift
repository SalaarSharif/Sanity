//
//  Question.swift
//  Sanity
//
//  Created by Ahmad T on 6/8/19.
//  Copyright © 2019 Ahmad. All rights reserved.
//

import Foundation

struct Question: Codable {
    var question: String
    var answer: [String]?
    var questionType: QuestionTypes
    
    enum QuestionTypes: String, Codable, CaseIterable {
        case multiChoice
        case openEnded
        
        func description() -> String {
            switch self {
            case .multiChoice:
                return "Multi-Choice Question"
            case .openEnded:
                return "Open-Ended Question"
            }
        }
        
        func getArrayOfEnums() -> [String] {
            return ["Multi-Choice Question","Open-Ended Question"]
        }
        
        
    }
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("NewVolunteerQuestions").appendingPathExtension("plist")
    
    static func loadFromFile() -> [Question]?  {
        guard let codedQuestions = try? Data(contentsOf: ArchiveURL) else {return nil}
        let decoder = PropertyListDecoder()
        return try? decoder.decode(Array<Question>.self, from: codedQuestions)
    }
    
    static func loadSampleQuestions() -> [Question] {
        return [Question(question: "Why do you want to be volunteer in this app?", answer: ["Because i love sanity"], questionType: QuestionTypes.openEnded),
                Question(question: "Have you had a mental issue before?", answer: ["Yes, I personally was facing a mental issue", "Yes, I know someone who was/is facing a mental issue", "Yes, I contribute in helping mental issues as a volunteer", "No"], questionType: QuestionTypes.multiChoice),
                Question(question: "Are you available to recieve calls most of the times?", answer: ["Yes", "No"], questionType: QuestionTypes.multiChoice),
                Question(question: "Do you consider mental illness a serious issue?", answer: ["Yes, Definitely!", "No, not so much"], questionType: QuestionTypes.multiChoice)]
    }
    
    static func saveToFile(questions: [Question]) {
        let encoder = PropertyListEncoder()
        let codedQuestions = try? encoder.encode(questions)
        ((try? codedQuestions?.write(to: ArchiveURL, options: .noFileProtection)) as ()??)
    }
}
