//
//  ComicsCharacterCVCell.swift
//  MarvelComics
//
//  Created by Alisher on 6/14/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import UIKit

class ComicsCharacterCVCell: UICollectionViewCell {

    public static let identifier: String = "ComicsCharacterCVCell"
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    public var character: CharacterEntity.CharacterData.Character? {
        didSet {
            if let character = character {
                let thumbnailURL = URL(string: (character.thumbnail?.path ?? "") + ".jpg")
                thumbnailImageView.kf.setImage(with: thumbnailURL)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImageView.layer.cornerRadius = 45
        thumbnailImageView.layer.masksToBounds = true
    }

}
