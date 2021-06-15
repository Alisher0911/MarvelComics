//
//  InitialInitialViewController.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    var output: InitialViewOutput!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        
        //CoreDataManager.shared.deleteAll("FavComicsEntity")
        
        loginButton.layer.cornerRadius = 10
        loginButton.layer.masksToBounds = true
        registerButton.layer.cornerRadius = 10
        registerButton.layer.masksToBounds = true
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        output.openLoginPage()
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        output.openRegisterPage()
    }
}


// MARK: InitialViewInput
extension InitialViewController: InitialViewInput {
    func getController() -> UIViewController {
        return self
    }
    
    func setupInitialState() {}
}
