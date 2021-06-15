//
//  LoginLoginViewController.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    var output: LoginViewOutput!

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        
        navigationItem.title = "Login Page"
        loginButton.layer.cornerRadius = 4
        loginButton.layer.masksToBounds = true
    }

    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            if let error = error {
                print(error)
            } else {
                self?.output.openHomePage()
            }
        }
    }
}


// MARK: LoginViewInput
extension LoginViewController: LoginViewInput {
    func getController() -> UIViewController {
        return self
    }
    
    func setupInitialState() {}
}
