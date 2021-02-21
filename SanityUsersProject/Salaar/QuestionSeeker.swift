//
//  QuestionSeeker.swift
//  MobileProgrammingProject
//
//  Created by MobileProg on 6/19/19.
//  Copyright © 2019 MobileProg. All rights reserved.
//

import Foundation
class QuestionSeeker {
    let question : String
    let optionA : String
    let optionB : String
    let optionC : String
    let optionD : String
    let correctAnswer : Int
    init( questionText : String,
          choiceA : String,
          choiceB : String,
          choiceC : String,
          choiceD : String,
          answer : Int) {
        question = questionText
        optionA = choiceA
        optionB = choiceB
        optionC = choiceC
        optionD = choiceD
        correctAnswer = answer
    }
    
}
