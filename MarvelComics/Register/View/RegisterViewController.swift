//
//  RegisterRegisterViewController.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    var output: RegisterViewOutput!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        
        navigationItem.title = "Registration Page"
        registerButton.layer.cornerRadius = 4
        registerButton.layer.masksToBounds = true
    }
    
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
            if error != nil {
                print(error!)
            } else {
                self?.output.openHomePage()
            }
        }
    }
}


// MARK: RegisterViewInput
extension RegisterViewController: RegisterViewInput {
    func getController() -> UIViewController {
        return self
    }
    
    func setupInitialState() {}
}
