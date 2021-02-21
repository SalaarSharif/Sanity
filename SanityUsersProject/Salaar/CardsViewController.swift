//
//  CardsViewController.swift
//  helpseekerquizv2
//
//  Created by MobileProg on 6/12/19.
//  Copyright © 2019 MobileProg. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    //home image outlet
    @IBOutlet weak var imgImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgImage.isUserInteractionEnabled = true
        //identifying each gesture to their direction
        
        let swiftRight = UISwipeGestureRecognizer (target: self, action: #selector(self.swipeGesture))
        swiftRight.direction = UISwipeGestureRecognizer.Direction.right
        imgImage.addGestureRecognizer(swiftRight)
        
        let swiftLeft = UISwipeGestureRecognizer (target: self, action: #selector(self.swipeGesture))
        swiftLeft.direction = UISwipeGestureRecognizer.Direction.left
        imgImage.addGestureRecognizer(swiftLeft)
        
        let swiftup = UISwipeGestureRecognizer (target: self, action: #selector(self.swipeGesture))
        swiftup.direction = UISwipeGestureRecognizer.Direction.up
        imgImage.addGestureRecognizer(swiftup)
        
        let swiftdown = UISwipeGestureRecognizer (target: self, action: #selector(self.swipeGesture))
        swiftdown.direction = UISwipeGestureRecognizer.Direction.down
        imgImage.addGestureRecognizer(swiftdown)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //images changes with each swipe gesture direction
    @objc func swipeGesture(sendr: UISwipeGestureRecognizer)
    {
        if let swipeGesture = sendr as? UISwipeGestureRecognizer
        {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
            print("right")
            imgImage.image = UIImage(named:"1")
            case UISwipeGestureRecognizer.Direction.left:
                print("left")
                imgImage.image = UIImage(named:"2")
            case UISwipeGestureRecognizer.Direction.up:
                print("up")
                imgImage.image = UIImage(named:"3")
            case UISwipeGestureRecognizer.Direction.down:
                print("down")
                imgImage.image = UIImage(named:"4")
            default:
                break
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

}
