//
//  QuestionTableViewController.swift
//  Sanity
//
//  Created by Ahmad T on 6/8/19.
//  Copyright © 2019 Ahmad. All rights reserved.
//

import UIKit

class QuestionTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
      
        
        if let savedQuestions = Question.loadFromFile() {
            questions = savedQuestions
        } else {
            questions = Question.loadSampleQuestions()
        }
        
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(dismiss(fromGesture:)))
        tableView.addGestureRecognizer(gesture)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
    }
    
    @objc func dismiss(fromGesture gesture: UISwipeGestureRecognizer) {
        //Your dismiss code
        //Here you should implement your checks for the swipe gesture
        
    }
    
    
    var questions = [Question]()
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionTableViewCell
        
        let question = questions[indexPath.row]
        
        cell.update(with: question)
        cell.showsReorderControl = true
        
        return cell
    }
    
    //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionTableViewCell
    //
    //        let question = questions[indexPath.row]
    //
    //        cell.update(with: question)
    //        cell.showsReorderControl = true
    //
    //        return cell
    //    }
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        let tableViewEditingMode = tableView.isEditing
        
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            questions.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        Question.saveToFile(questions: questions)
    }
    
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedQuestion = questions.remove(at: fromIndexPath.row)
        questions.insert(movedQuestion, at: to.row)
        tableView.reloadData()
        Question.saveToFile(questions: questions)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "EditQuestion" {
            let indexPath = tableView.indexPathForSelectedRow!
            let question = questions[indexPath.row]
            let navController = segue.destination as! UINavigationController
            let addEditQuestionTableViewController = navController.topViewController as! AddEditQuestionTableViewController
            
            addEditQuestionTableViewController.question = question
        }
    }
    
    // MARK: - Navigation
    @IBAction func unwindToQuestionTableView(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as! AddEditQuestionTableViewController
        
        if let question = sourceViewController.question {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                questions[selectedIndexPath.row] = question
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
                print("1")
            } else {
                let newIndexPath = IndexPath(row: questions.count, section: 0)
                questions.append(question)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
                print("2")
            }
        } else {
            print("3")
        }
        
        Question.saveToFile(questions: questions)
    }
    
}

