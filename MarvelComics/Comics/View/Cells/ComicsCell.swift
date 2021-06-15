//
//  ComicsCell.swift
//  MarvelComics
//
//  Created by Alisher on 6/14/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import UIKit
import Kingfisher

class ComicsCell: UITableViewCell {

    public static let identifier: String = "ComicsCell"
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var formatLabel: UILabel!
    
    public var comics: ComicsEntity.ComicsData.Comics? {
        didSet {
            if let comics = comics {
                let posterURL = URL(string: (comics.thumbnail.path ?? "") + ".jpg")
                thumbnailImageView.kf.setImage(with: posterURL)
                titleLabel.text = comics.title
                formatLabel.text = comics.format
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        thumbnailImageView.layer.cornerRadius = 12
        thumbnailImageView.layer.masksToBounds = true
        thumbnailImageView.backgroundColor = .systemTeal
    }
}
