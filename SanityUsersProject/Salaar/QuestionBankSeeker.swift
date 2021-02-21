//
//  QuestionBankSeeker.swift
//  MobileProgrammingProject
//
//  Created by MobileProg on 6/19/19.
//  Copyright © 2019 MobileProg. All rights reserved.
//

import Foundation
class QuestionBankSeeker {
    var list = [QuestionSeeker]()
    
    init() {
        list.append(QuestionSeeker.init(questionText: "choose a color", choiceA: "red", choiceB: "blue", choiceC: "orange", choiceD: "white", answer: 1))
        
        list.append(QuestionSeeker.init(questionText: "who are you most close to in your family ?", choiceA: "Mother", choiceB: "Father", choiceC: "Siblings", choiceD: "none", answer: 4))
        
        list.append(QuestionSeeker.init(questionText: "do you have a purpose?", choiceA: "yes", choiceB: "no", choiceC: "sometimes", choiceD: "I do what I must", answer: 4))
        
        list.append(QuestionSeeker.init(questionText: "when do you feel most happy?", choiceA: "I dont", choiceB: "always", choiceC: "At home", choiceD: "when I'm alone", answer: 4))
        
        list.append(QuestionSeeker.init(questionText: "are you ready to change?", choiceA: "yes", choiceB: "no", choiceC: "maybe", choiceD: "i'll try", answer: 4))
        
        list.append(QuestionSeeker.init(questionText: "Do you drink or use drugs ?", choiceA: "Drink", choiceB: "Drugs", choiceC: "Both", choiceD: "None", answer: 4))
        
        list.append(QuestionSeeker.init(questionText: "test", choiceA: "tes", choiceB: "test", choiceC: "test", choiceD: "test", answer: 4))
        
        //list.append(Question.init(questionText: "What time of the day is most diffcult ?", choiceA: "Morning", choiceB: "Afternoon", choiceC: "Evening", choiceD: "Night :)", answer: 4))
    }
    
}
