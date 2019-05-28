//
//  ViewController.swift
//  MyPillsIOS
//
//  Created by User on 27/05/2019.
//  Copyright © 2019 ipvc. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    
    @IBOutlet weak var signInSelector: UISegmentedControl!
    
    @IBOutlet weak var signInLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    var isSignIn:Bool = true
    
    @IBOutlet weak var signInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInSelectorChanged(_ sender: UISegmentedControl) {
        // Flip the Boolean
        isSignIn = !isSignIn
        
        // check the bool and set the button and labels
        if isSignIn {
            signInLabel.text = "Sign In"
            signInButton.setTitle("Sign In", for: .normal)
        } else  {
        signInLabel.text = "Register"
            signInButton.setTitle("Register", for : .normal)
        }
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        // Todo : do some form validation on the email and password
        if let email = emailTextField.text, let pass = passwordTextField.text {
            // Check if it's sign in or register
            if isSignIn  {
            // Sign in the user with Firebase
                Auth.auth().signIn(withEmail: email, password: pass, completion:   { (user, error) in
                    
                    // Check that user isn't nil
                    if let u = user {
                        // user is found go to home screen
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                    }
                    else  {
                        // Error:check error and show message
                        print("Parece que nao ha net")
                        }
                    })
                
            } else  {
            // Register the user on Firebase
                Auth.auth().createUser(withEmail: email, password: pass, completion:{ (user, error) in
                    
                    // Check that user isn't nil
                    if let u = user {
                        // user is found go to home screen
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                    }
                    else {
                        // Error: check error and show message
                    }
            })
            }}}
            
    
    
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            emailTextField.resignFirstResponder()
            passwordTextField.resignFirstResponder()
        }
}

