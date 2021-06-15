//
//  ProfileProfileViewController.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    var output: ProfileViewOutput!

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var goToFavoriteButton: UIButton!
    @IBOutlet weak var signOutButton: UIButton!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        
        navigationItem.title = "Profile"
        
        guard let email = Auth.auth().currentUser?.email else { return }
        emailLabel.text = email
        
        goToFavoriteButton.layer.cornerRadius = 12
        goToFavoriteButton.layer.masksToBounds = true
        
        signOutButton.layer.cornerRadius = 12
        signOutButton.layer.masksToBounds = true
    }
    
    
    @IBAction func goToFavoriteButtonPressed(_ sender: Any) {
        output?.goToFavouriteComics()
    }
    
    @IBAction func signOutButtonPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            output?.goToRoot()
        } catch let error {
            print(error)
        }
    }
}


// MARK: ProfileViewInput
extension ProfileViewController: ProfileViewInput {
    func getController() -> UIViewController {
        return self
    }
    
    func setupInitialState() {}
}
