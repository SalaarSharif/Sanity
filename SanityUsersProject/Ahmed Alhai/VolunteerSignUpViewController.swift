import UIKit

class VolunteerSignUpViewController: UIViewController {

    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    let progress = Progress(totalUnitCount: 11)
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBAction func triggerBar(_ sender: Any) {
        
    }
    @IBAction func trigg(_ sender: Any) {
        self.progress.completedUnitCount += 2
        self.progressView.setProgress(Float(self.progress.fractionCompleted), animated: true)
        
        //self.progressLabel.text = "\(Int(self.progress.fractionCompleted * 100)) %"
    }
    ///////////////////////
    
    
    
    
    @IBAction func sharebtn(_ sender: UIButton) {
        let sharebtn = UIAlertController(title: "Share", message: "please select service", preferredStyle: .alert)
        let fb = UIAlertAction(title: "Facebook", style: .default) { (ACTION) in print ("Success")
            
        }
        sharebtn.addAction(fb)
        present(sharebtn, animated: true, completion: nil)
    }
    
    
    
    
    ///////////////////////
    
    
    //buttons
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
    @IBAction func choiceMade(_ sender: Any) {
        updateUI()
    }
    let allQuestions = QuestionBankSeeker()
    var questionNumber :Int = 0
    var selectedAnswer : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
        //        updateUI()
        
        progressView.progress = 0.0
        progress.completedUnitCount = 0
        
        
        
    }
    
    
    @IBAction func answerPressed(_ sender: UIButton) {
        //        if sender.tag == selectedAnswer {
        //            print("correct")
        //        } else {
        //            print("wrong")
        //        }
        
        
        
        questionNumber += 1
        updateQuestion()
        
        
    }
    
    func updateQuestion()  {
        
        //updates questions on screen
        if questionNumber < allQuestions.list.count-1 {
            questionLabel.text = allQuestions.list[questionNumber].question
            optionA.setTitle(allQuestions.list[questionNumber].optionA, for: UIControl.State.normal)
            optionB.setTitle(allQuestions.list[questionNumber].optionB, for: UIControl.State.normal)
            optionC.setTitle(allQuestions.list[questionNumber].optionC, for: UIControl.State.normal)
            optionD.setTitle(allQuestions.list[questionNumber].optionD, for: UIControl.State.normal)
            selectedAnswer = allQuestions.list[questionNumber].correctAnswer
        } else {
            // if the questions are done
            let alert = UIAlertController(title: "Great Job", message: "", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "please click end quiz button", style: .default, handler: {action in self.TakeToMainmenu()})
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            //            updateUI()
        }
        
        
        
        
        
        
    }
    
    func updateUI (){
        //        progressBar.frame.size.width = (view.frame.width / CGFloat(allQuestions.list.count))
        //            * CGFloat(questionNumber + 1)
        //        progressBar.frame.size.width *= 2
    }
    
    func TakeToMainmenu() {
        // questionNumber = 0
        //updateQuestion()
        
        
    }

}
