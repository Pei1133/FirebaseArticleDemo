//
//  SignUpViewController.swift
//  FirebaseArticle
//
//  Created by 黃珮鈞 on 2017/11/26.
//  Copyright © 2017年 黃珮鈞. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //Sign Up Action for email
    @IBAction func createAccountAction(_ sender: AnyObject) {
    
        if emailTextField.text == "" || usernameTextField.text == "" || passwordTextField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your name,email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    
                    guard let uid = user?.uid else {
                        return
                    }
                    
                    //Successfully authenticated user: upload name, email, and password
                    let ref = Database.database().reference(fromURL: "https://fir-article.firebaseio.com/")
                    let userReference = ref.child("users").child(uid)
                    
                    guard let email = self.emailTextField.text, let password = self.passwordTextField.text, let name = self.usernameTextField.text else{
                        print("Form is not valid")
                        return
                    }
                    
                    let values = ["name": name, "email": email, "password": password]
                    userReference.updateChildValues(values, withCompletionBlock: { (updateError, ref) in
                        if let updateError = updateError {
                            print(updateError)
                            return
                        }
                        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                        self.present(loginViewController!, animated: true, completion: nil)
                    })
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}
