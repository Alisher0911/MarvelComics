//
//  CharacterDetailCharacterDetailViewController.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    var output: CharacterDetailViewOutput!
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    private var details: CharacterDetailEntity.CharacterData.Character?
    

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        
        navigationItem.title = "Details"
        
        thumbnailImageView.layer.cornerRadius = 120
        thumbnailImageView.layer.masksToBounds = true
        descriptionTextView.textContainerInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    private func updateUI() {
        if let character = details {
            let thumbnailURL = URL(string: (character.thumbnail?.path ?? "") + ".jpg")
            thumbnailImageView.kf.setImage(with: thumbnailURL)
            nameLabel.text = character.name
            descriptionTextView.text = character.description
        }
    }
}


// MARK: CharacterDetailViewInput
extension CharacterDetailViewController: CharacterDetailViewInput {
    func setCharacterDetail(_ character: CharacterDetailEntity.CharacterData.Character) {
        self.details = character
        self.updateUI()
    }
    
    func setupInitialState() {}
}
