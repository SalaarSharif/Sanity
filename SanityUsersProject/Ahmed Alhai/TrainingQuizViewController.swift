//
//  TrainingQuizViewController.swift
//  MobileProgrammingProject
//
//  Created by MobileProg on 6/12/19.
//  Copyright © 2019 MobileProg. All rights reserved.
//

import UIKit

class TrainingQuizViewController: UIViewController {
    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionTip: UILabel!
    @IBOutlet weak var questionText: UILabel!
    
    
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionAText: UITextView!
    @IBOutlet weak var optionBText: UITextView!
    @IBOutlet weak var optionCText: UITextView!
    
    
    let allQuestions = QuestionBankVolunteer()
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateVolunteerTrainingQuestion()
        updateUI()
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == selectedAnswer {
            print("correct")
            score += 1
        } else {
            print("Incorrect")
        }
        
        questionNumber += 1
        updateUI()
        updateVolunteerTrainingQuestion()
    }
    
    func updateVolunteerTrainingQuestion(){
        if questionNumber <= allQuestions.Vlist.count - 1{
            
            questionTitle.text = allQuestions.Vlist[questionNumber].questionTitle
            questionTip.text = allQuestions.Vlist[questionNumber].questionTip
            questionText.text = allQuestions.Vlist[questionNumber].questionText
            self.optionAText.text = allQuestions.Vlist[questionNumber].optionAText
            self.optionBText.text = allQuestions.Vlist[questionNumber].optionBText
            self.optionCText.text = allQuestions.Vlist[questionNumber].optionCText
            selectedAnswer = allQuestions.Vlist[questionNumber].correctAnswer
            
        } else {
            let alert = UIAlertController(title: "Good!", message: "End of Training. You got \(questionNumber)/\(allQuestions.Vlist.count) correct! Do you want to try again?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {action in self.restartQuiz()})
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    func updateUI(){
        self.scoreLabel.text = "Score: \(score)"
        self.questionCounter.text = "\(questionNumber + 1)/\(allQuestions.Vlist.count)"
    }
    
    func restartQuiz() {
        score = 0
        questionNumber = 0
        updateVolunteerTrainingQuestion()
        updateUI()
    }
    
}
