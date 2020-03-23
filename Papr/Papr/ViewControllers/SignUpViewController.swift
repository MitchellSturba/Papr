//
//  SignUpViewController.swift
//  Papr
//
//  Created by Mitchell Sturba on 2020-03-22.
//  Copyright © 2020 Mitchell Sturba. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorTextField: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //validate if everything correct
    func validateFields() -> String{
        
        //check all fields filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all fields"
        }
        let cleanPass = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utitilies.isPassValid(password: cleanPass) == false {
            return "Make sure pass is 8 chars, contains a special char, and a number"
        }
        
        return "Error"
    }
    

    @IBAction func signUpTapped(_ sender: Any) {
        
        //validate fields
        let error = validateFields()
        
        //create user
        
        
        
        //push to home
    }
    

}
