//
//  RegisterDoctorViewController.swift
//  MobileProgrammingProject
//
//  Created by MobileProg on 6/17/19.
//  Copyright © 2019 MobileProg. All rights reserved.
//

import UIKit

class RegisterDoctorViewController: UIViewController {
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    var username: String = ""
    var password: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func finishButtonTapped(_ sender: Any) {
        if(fullNameTextField.text != ""){
            if(emailTextField.text != "" ){
                guard let email = emailTextField.text?.contains("@") else{  return}
                
                if(email){
                    if(locationTextField.text != ""){
                        
                      
//                        let doc = Doctor(userName: username, name: fullNameTextField.text!, email: emailTextField.text! , location: locationTextField.text!, available: true, availabilityStart: nil, availabilityEnd: nil)
//
                     
                        
                        
                        
                        
                        
                    }else{
                        // create the alert
                        let alert = UIAlertController(title: "Input error", message: "Location field is empty.", preferredStyle: UIAlertController.Style.alert)
                        
                        // add an action (button)
                        alert.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
                        
                        // show the alert
                        self.present(alert, animated: true, completion: nil)
                    }
                }else{
                    // create the alert
                    let alert = UIAlertController(title: "Input error", message: "Email not valid.", preferredStyle: UIAlertController.Style.alert)
                    
                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                }
               
                
                
            }else{
                // create the alert
                let alert = UIAlertController(title: "Input error", message: "email field is empty.", preferredStyle: UIAlertController.Style.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
            }
        
        
        }else{
            // create the alert
            let alert = UIAlertController(title: "Input error", message: "Name field is empty.", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
