//
//  EditProfileViewController.swift
//  MobileProgrammingProject
//
//  Created by MobileProg on 5/30/19.
//  Copyright © 2019 MobileProg. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var aboutTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var changeProfileButton: UIButton!
    @IBOutlet weak var locationTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

  
    
    @IBAction func changeProfileButtonTapped(_ sender: Any) {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
      profilePictureImageView.image =  info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
   
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let profileVC = segue.destination as? ProfilePageViewController else { return  }
        if (fullNameTextField.text != "" ){
                    let fName = fullNameTextField.text!
            
                         profileVC.nameLabel.text = fName
                    }
        if (aboutTextField.text != "") {
            let about = aboutTextField.text!
            profileVC.aboutMeLabel.text = about
        }
        if (locationTextField.text != "" ){
            let location = locationTextField.text!
          
            profileVC.myLocationLabel.text = location
            
        }
        if(profilePictureImageView.image != nil ){
            profileVC.myProfilePicture.image = profilePictureImageView.image
        }
        
      
    }
}
