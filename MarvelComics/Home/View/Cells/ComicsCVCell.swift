//
//  ComicsCVCell.swift
//  MarvelComics
//
//  Created by Alisher on 6/14/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import UIKit

class ComicsCVCell: UICollectionViewCell {

    public static let identifier: String = "ComicsCVCell"
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var formatLabel: UILabel!
    
    public var comics: ComicsEntity.ComicsData.Comics? {
        didSet {
            if let comics = comics {
                let thumbnailURL = URL(string: (comics.thumbnail.path ?? "") + ".jpg")
                thumbnailImageView.kf.setImage(with: thumbnailURL)
                titleLabel.text = comics.title
                formatLabel.text = comics.format
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailImageView.layer.cornerRadius = 10
        thumbnailImageView.layer.masksToBounds = true
    }

}
