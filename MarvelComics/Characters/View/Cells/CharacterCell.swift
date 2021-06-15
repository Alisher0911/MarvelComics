//
//  CharacterCell.swift
//  MarvelComics
//
//  Created by Alisher on 6/15/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    public static let identifier: String = "CharacterCell"

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    public var character: CharacterEntity.CharacterData.Character? {
           didSet {
               if let character = character {
                   let thumbnailURL = URL(string: (character.thumbnail?.path ?? "") + ".jpg")
                   thumbnailImageView.kf.setImage(with: thumbnailURL)
                   nameLabel.text = character.name
               }
           }
       }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        thumbnailImageView.layer.cornerRadius = 12
        thumbnailImageView.layer.masksToBounds = true
    }
    
}
