//
//  CallRequestViewController.swift
//  helpseekerquizv2
//
//  Created by MobileProg on 6/17/19.
//  Copyright © 2019 MobileProg. All rights reserved.
//

import UIKit

class CallRequestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func depressionBtn(_ sender: Any) {
        
        let callRequest = CallRequest(userName: "Ahmady", topic: "Depression", dateOfCallRequest: Date())
        if var requests = CallRequest.loadFromFile() {
            requests.append(callRequest)
            CallRequest.saveToFile(requests: requests)
        }
    }
    
    @IBAction func anxietyBtn(_ sender: Any) {
        let callRequest = CallRequest(userName: "Ahmady", topic: "Anxiety", dateOfCallRequest: Date())
        if var requests = CallRequest.loadFromFile() {
            requests.append(callRequest)
            CallRequest.saveToFile(requests: requests)
        }
    }
    
    @IBAction func stressBtn(_ sender: Any) {
        let callRequest = CallRequest(userName: "Ahmady", topic: "Stress", dateOfCallRequest: Date())
        if var requests = CallRequest.loadFromFile() {
            requests.append(callRequest)
            CallRequest.saveToFile(requests: requests)
        }
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
    

