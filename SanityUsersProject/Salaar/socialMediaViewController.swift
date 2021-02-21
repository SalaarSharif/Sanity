//
//  socialMediaViewController.swift
//  helpseekerquizv2
//
//  Created by MobileProg on 6/12/19.
//  Copyright © 2019 MobileProg. All rights reserved.
//

import UIKit
import Social

class socialMediaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func signOut(_ sender: Any) {
        
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "Start") as! UIViewController
            self.present(newViewController, animated: true, completion: nil)
    }
    
    @IBAction func sharebtn(_ sender: UIButton) {
    
        //alert
        let alert = UIAlertController(title: "Share", message: "Sanity App", preferredStyle: .actionSheet)
        //action one(Facebook)
        let actionOne = UIAlertAction(title: "Share on Facebook", style: .default){(ACTION) in
            //if service is available
           if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook)
           {
            let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
            post.setInitialText("Sanity app")
            post.add(UIImage(named: "images.png"))
           self.present(post, animated: true, completion: nil)
            
           } else {
            self.showAlert(service: "Facebook")
            
            }
            
            
        }
        //twitter
        let actiontwo = UIAlertAction(title: "Share on Twitter", style: .default){(ACTION) in
            //if service is available
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter)
            {
                let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
                post.setInitialText("Sanity app")
                post.add(UIImage(named: "images.png"))
                self.present(post, animated: true, completion: nil)
                
            } else {
                self.showAlert(service: "Twitter")
                
            }
            
            
        }
        
        
            alert.addAction(actionOne)
        alert.addAction(actiontwo)
        self.present(alert, animated: true, completion: nil)
        }
    func showAlert(service: String)
    {
        let alert = UIAlertController(title: "error", message: "you are not connected to \(service)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true,completion: nil)
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



