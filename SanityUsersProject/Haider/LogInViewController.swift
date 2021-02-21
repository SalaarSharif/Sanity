//
//  LogInViewController.swift
//  MobileProgrammingProject
//
//  Created by MobileProg on 6/16/19.
//  Copyright © 2019 MobileProg. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginBtn(_ sender: UIButton) {
        if(usernameTextField.text == "Doctor" && passwordTextField.text == "123") {
            
            performSegue(withIdentifier: "DoctorView", sender: self)
            
        } else if (usernameTextField.text == "Volunteer" && passwordTextField.text == "123") {
            
            performSegue(withIdentifier: "VolunteerView", sender: self)
            
        } else if (usernameTextField.text == "HelpSeeker" && passwordTextField.text == "123") {
            
            performSegue(withIdentifier: "HelpSeekerView", sender: self)
            
        } else {
            // create the alert
            let alert = UIAlertController(title: "Input error", message: "Username or password is incorrect", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    

}
