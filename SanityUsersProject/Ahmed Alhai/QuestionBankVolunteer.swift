//
//  QuestionBankVolunteer.swift
//  MobileProgrammingProject
//
//  Created by MobileProg on 6/12/19.
//  Copyright © 2019 MobileProg. All rights reserved.
//

import Foundation

class QuestionBankVolunteer {
    var Vlist = [QuestionVolunteer]()
    
    init() {
        Vlist.append(QuestionVolunteer(quizTitleText: "Reflection", quizTipText: "Reflecting back what the speaker is saying shows that you are paying attention to what they say", quizText: "What is the goal of reflecting content?", choiceA: "Repeating exactly what the speaker is saying", choiceB: "Pointing out a mistake with what the speaker says", choiceC: "To show the speak that you are listening and make them draw out more of their story", answer: 3))
        
        Vlist.append(QuestionVolunteer(quizTitleText: "Labeling Emotions", quizTipText: "Identifying the emotion behind what the person is saying shows that you are intersted in how they are feeling. It also helps them to examine thier emotions more closely.", quizText: "Ali is listening to Mohammed, who is feeling discorouged becuase he has yet to find a job after months of searching. which of the folloing thoughts will help Ali experience empathy for Mohammed?", choiceA: "I'm sure he'll find something sometime soon", choiceB: "I would feel scared and frustrated if I had been looking for a job for a while and still hadn't found anything", choiceC: "I never was this upset when I didn't have a job", answer: 2))
        
        Vlist.append(QuestionVolunteer(quizTitleText: "Asking Questions", quizTipText: "Questions help you understand what is being said, show that you are interested in the person and keep the conversation moving forward.", quizText: "What should you do when somone is unclear or you don't understand what they are saying?", choiceA: "Ask a question to clarify", choiceB: "Tell them directly to speak more clearly", choiceC: "Continue with conversation hoping to understand it later", answer: 1))
    }
}
