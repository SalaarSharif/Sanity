//
//  QuestionVolunteer.swift
//  MobileProgrammingProject
//
//  Created by MobileProg on 6/12/19.
//  Copyright © 2019 MobileProg. All rights reserved.
//

import Foundation

class QuestionVolunteer {
    let questionTitle: String
    let questionTip: String
    let questionText: String
    
    let optionAText: String
    let optionBText: String
    let optionCText: String
    let correctAnswer: Int
    
    init(quizTitleText: String, quizTipText: String, quizText: String, choiceA: String, choiceB: String, choiceC: String, answer:Int) {
        questionTitle = quizTitleText
        questionTip = quizTipText
        questionText = quizText
        optionAText = choiceA
        optionBText = choiceB
        optionCText = choiceC
        correctAnswer = answer
    }
}
