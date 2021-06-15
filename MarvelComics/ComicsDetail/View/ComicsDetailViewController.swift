//
//  ComicsDetailComicsDetailViewController.swift
//  MarvelComics
//
//  Created by Alisher0911 on 14/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit
import Firebase

class ComicsDetailViewController: UIViewController {

    var output: ComicsDetailViewOutput!

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var formatLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var charactersCV: UICollectionView!
    //@IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    
    private var details: ComicsDetailEntity.ComicsData.Comics?
    
    private var detailCharacters: [CharacterEntity.CharacterData.Character] = [] {
        didSet {
            charactersCV.reloadData()
        }
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        navigationItem.title = "Details"
        configureViews()
    }
    
    private func updateUI() {
        if let comics = details {
            let thumbnailURL = URL(string: (comics.thumbnail?.path ?? "") + ".jpg")
            thumbnailImageView.kf.setImage(with: thumbnailURL)
            titleLabel.text = comics.title
            formatLabel.text = comics.format
            descriptionLabel.text = comics.description
            output.getDetailCharacters(comics.id)
            if let comicsId = details?.id, let email = Auth.auth().currentUser?.email {
                if let _ = CoreDataManager.shared.findComics(with: comicsId, email: email) {
                    favoriteButton.setImage(UIImage(named: "heartFilled"), for: .normal)
                } else {
                    favoriteButton.setImage(UIImage(named: "heart"), for: .normal)
                }
            }
        }
    }
    
    private func configureViews() {
        charactersCV.delegate = self
        charactersCV.dataSource = self
        charactersCV.register(UINib(nibName: ComicsCharacterCVCell.identifier, bundle: Bundle(for: ComicsCharacterCVCell.self)), forCellWithReuseIdentifier: ComicsCharacterCVCell.identifier)
        charactersCV.showsHorizontalScrollIndicator = false
    }
    
    
    @IBAction func favoriteButtonPressed(_ sender: UIButton) {
        if let comicsId = details?.id, let email = Auth.auth().currentUser?.email {
            
            if let _ = CoreDataManager.shared.findComics(with: comicsId, email: email) {
                CoreDataManager.shared.deleteComics(with: comicsId, email: email)
                favoriteButton.setImage(UIImage(named: "heart"), for: .normal)
            } else {
                if let details = details {
                    CoreDataManager.shared.addComics(details, email: email)
                    favoriteButton.setImage(UIImage(named: "heartFilled"), for: .normal)
                }
            }
        }
    }
}


// MARK: ComicsDetailViewInput
extension ComicsDetailViewController: ComicsDetailViewInput {
    func setComicsDetail(_ comics: ComicsDetailEntity.ComicsData.Comics) {
        self.details = comics
        self.updateUI()
    }
    
    func setDetailCharacters(_ characters: [CharacterEntity.CharacterData.Character]) {
        self.detailCharacters = characters
        if detailCharacters.isEmpty {
            textLabel.isHidden = true
            charactersCV.isHidden = true
        }
    }
    
    func getController() -> UIViewController {
        return self
    }
    
    func setupInitialState() {}
}


extension ComicsDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let characterId = detailCharacters[indexPath.row].id
        output.openCharacterDetails(with: characterId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailCharacters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ComicsCharacterCVCell.identifier, for: indexPath) as! ComicsCharacterCVCell
        cell.character = detailCharacters[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
