//
//  LoginViewController.swift
//  Papr
//
//  Created by Mitchell Sturba on 2020-03-22.
//  Copyright © 2020 Mitchell Sturba. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passTextField: UITextField!
    
    
    @IBOutlet weak var errorTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginButtonTapped(_ sender: Any) {
        
        let cleanEmail = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanpass = passTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: cleanEmail, password: cleanpass) { (result, err) in
            
            if err != nil {
                self.errorTextField.text = err!.localizedDescription
                self.errorTextField.alpha = 1
            }
            else {
                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.StoryBoard.homeViewController) as? HomeViewController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
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
