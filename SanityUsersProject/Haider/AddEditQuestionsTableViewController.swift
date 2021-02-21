//
//  AddEditQuestionTableViewController.swift
//  Sanity
//
//  Created by Ahmad T on 6/10/19.
//  Copyright © 2019 Ahmad. All rights reserved.
//

import UIKit

class AddEditQuestionTableViewController: UITableViewController {
    

    
    @IBOutlet weak var multiChoiceButton: UISwitch!
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answer1TextField: UITextField!
    @IBOutlet weak var answer2TextField: UITextField!
    @IBOutlet weak var answer3TextField: UITextField!
    @IBOutlet weak var answer4TextField: UITextField!
    
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    var question: Question?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let question = question {
            print("question detected")
            if question.questionType.description() == "Open-Ended Question" {
                print("open ended question is being checked")
                // if the question type is open ended, then set the switch to the on
                // state, showing that it is an open ended question
                multiChoiceButton.isOn = false
                // (only the first text field will be activated)
            } else {
                print("multi choice question is being checked")
                // if it is a multi choice qustion, then set the other answer text
                // fields to be visible and fill them with the answers
                multiChoiceButton.isOn = true
                let count = question.answer!.count
                
                if count == 4 {
                    answer2TextField.text = question.answer?[1] ?? nil
                    answer3TextField.text = question.answer?[2] ?? nil
                    answer4TextField.text = question.answer?[3] ?? nil
                } else if count == 3 {
                    answer2TextField.text = question.answer?[1] ?? nil
                    answer3TextField.text = question.answer?[2] ?? nil
                } else if count == 2 {
                    answer2TextField.text = question.answer?[1] ?? nil
                }
                
            }
            questionTextField.text = question.question
            answer1TextField.text = question.answer?[0] ?? nil
            changeFieldsState()
            
        } else {
            //for debuggin purposes
            print("questions details not found")
        }
        
        updateSaveButtonState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else { return }
        
        let questionText = questionTextField.text ?? ""
//        let answer = answerTextField.text ?? ""
        var questionType: Question.QuestionTypes
        var answer: [String]?
        if multiChoiceButton.isOn {
            print("saving a multi choice question")
            questionType = Question.QuestionTypes.multiChoice
            answer = [answer1TextField.text, answer2TextField.text, answer3TextField.text, answer4TextField.text] as? [String]
        }
        else {
            print("saving a open ended question")
            questionType = Question.QuestionTypes.openEnded
            answer = [answer1TextField.text] as? [String]
        }
        
        

        
        question = Question(question: questionText, answer: answer, questionType: questionType)
    }
    
    // this function is a reference from stack overflow for email validation
    /* website: https://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift */
    func validateEmail(enteredEmail:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
        
    }
    // for checking the email
    var correctEmail = false
    func updateSaveButtonState() {
        let questionText = questionTextField.text ?? ""
        let answerText = answer1TextField.text ?? ""
        
        
        // if fields are not empty and email is correct then make the save button true
        saveButton.isEnabled = !questionText.isEmpty && !answerText.isEmpty
        
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    func changeFieldsState() {
        if multiChoiceButton.isOn {
            answer2TextField.isHidden = false
            answer3TextField.isHidden = false
            answer4TextField.isHidden = false
        }
        else {
            // if the button multichoice is on
            answer2TextField.isHidden = true
            answer3TextField.isHidden = true
            answer4TextField.isHidden = true
        }
    }
    @IBAction func typeButtonChanged(_ sender: UISwitch) {
        changeFieldsState()
    }
    
    
}
