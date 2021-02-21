//
//  RegisterViewController.swift
//  MobileProgrammingProject
//
//  Created by MobileProg on 6/16/19.
//  Copyright © 2019 MobileProg. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
@IBAction func unwindToRegister (_ sender: UIStoryboardSegue){}
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextPage = segue.destination as? RegisterDoctorViewController else { return  }
        if(userNameTextField.text != ""){
            nextPage.username = userNameTextField.text!
            
        }else{
            // create the alert
            let alert = UIAlertController(title: "Input error", message: "User Name field is empty.", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        
        if (passwordTextField.text != "") {
            
            if (passwordTextField.text != confirmPasswordTextField.text){
                // create the alert
                let alert = UIAlertController(title: "Input error", message: "Password does not match.", preferredStyle: UIAlertController.Style.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }else{
             nextPage.password = passwordTextField.text!
            }
        }else{
             // create the alert
            let alert = UIAlertController(title: "Input error", message: "Password field is empty.", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
       
    }
}
