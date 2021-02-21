//
//  ProfilePageViewController.swift
//  MobileProgrammingProject
//
//  Created by MobileProg on 6/12/19.
//  Copyright © 2019 MobileProg. All rights reserved.
//

import UIKit

class ProfilePageViewController: UIViewController {
    @IBOutlet weak var aboutMeLabel: UITextView!
    @IBOutlet weak var myLocationLabel: UITextView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var myProfilePicture: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func signOut(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "Start") as! UIViewController
        self.present(newViewController, animated: true, completion: nil)
    }
}
