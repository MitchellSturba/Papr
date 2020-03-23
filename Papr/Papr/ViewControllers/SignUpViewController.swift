//
//  SignUpViewController.swift
//  Papr
//
//  Created by Mitchell Sturba on 2020-03-22.
//  Copyright © 2020 Mitchell Sturba. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        FirebaseApp.configure()
    }
    
    //validate if everything correct
    func validateFields() -> String? {
        
        //check all fields filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields"
        }
        let cleanPass = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utitilies.isPassValid(password: cleanPass) == false {
            return "Make sure pass is 8 chars, contains a special char, and a number"
        }
        
        return nil
    }
    

    @IBAction func signUpTapped(_ sender: Any) {
        
        //validate fields
        let error = validateFields()
        
        if error != nil {
            showError(msg: error!)
        }
        //create user
        let firstname = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let lastname = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let pass = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().createUser(withEmail: email, password: pass) { (authResult, err) in
          // ...
            if err != nil {
                self.showError(msg: "Error creating user")
            }else {
                
                let db = Firestore.firestore()
                
                db.collection("users").addDocument(data: ["firstName": firstname, "lastName": lastname, "uid": authResult!.user.uid  ]) { (errorz) in
                    
                    if errorz != nil {
                        self.showError(msg: "Something went wrong")
                    }
                }
                self.pushToHome()
                
            }
        }
        
        //push to home
    }
    
    func showError(msg: String) {
        errorLabel.text = msg
        errorLabel.alpha = 1
    }
    
    func pushToHome() {
        
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.StoryBoard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
    

}
