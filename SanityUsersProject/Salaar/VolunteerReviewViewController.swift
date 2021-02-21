//
//  VolunteerReviewViewController.swift
//  helpseekerquizv2
//
//  Created by MobileProg on 6/13/19.
//  Copyright © 2019 MobileProg. All rights reserved.
//

import UIKit

class VolunteerReviewViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    //var status: CallReview.Status = nil
    
    @IBAction func thumbsUp(_ sender: Any) {
        print("feedback prssed as up")
        let status = CallReview.Status.up
        saveTheRecord(withStatus: status)
    }
    @IBAction func thumbsDown(_ sender: Any) {
        print("feedback prssed as down")
        let status = CallReview.Status.down
        saveTheRecord(withStatus: status)
    }
    
    func saveTheRecord(withStatus: CallReview.Status) {
        var reviews = CallReview.loadFromFile()
        if let seekers = Seeker.loadFromFile() {
            let review = CallReview(seeker: (seekers[0]), status: CallReview.Status.up, topic: "Depression")
            reviews?.append(review)
        }
        
    }
    
}




