//
//  HomeHomeViewController.swift
//  MarvelComics
//
//  Created by Alisher0911 on 14/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    var output: HomeViewOutput!

    @IBOutlet weak var comicsCV: UICollectionView!
    @IBOutlet weak var charactersCV: UICollectionView!
    
    private var homeComics: [ComicsEntity.ComicsData.Comics] = [] {
        didSet {
            comicsCV.reloadData()
        }
    }
    
    private var homeCharacters: [CharacterEntity.CharacterData.Character] = [] {
        didSet {
            charactersCV.reloadData()
        }
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        
        navigationItem.title = "Home Page"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(goToProfile))
        
        configureViews()
        
        output?.getHomeComics()
        output?.getHomeCharacters()
    }

    private func configureViews() {
        comicsCV.delegate = self
        comicsCV.dataSource = self
        comicsCV.register(UINib(nibName: ComicsCVCell.identifier, bundle: Bundle(for: ComicsCVCell.self)), forCellWithReuseIdentifier: ComicsCVCell.identifier)
        comicsCV.showsHorizontalScrollIndicator = false
        
        charactersCV.delegate = self
        charactersCV.dataSource = self
        charactersCV.register(UINib(nibName: CharacterCVCell.identifier, bundle: Bundle(for: CharacterCVCell.self)), forCellWithReuseIdentifier: CharacterCVCell.identifier)
        charactersCV.showsHorizontalScrollIndicator = false
    }
    
    
    @IBAction func allComicsButtonPressed(_ sender: UIButton) {
        output?.openAllComics()
    }
    
    
    @IBAction func allCharactersButtonPressed(_ sender: UIButton) {
        output?.openAllCharacters()
    }
    
    @objc private func goToProfile() {
        output?.goToProfile()
    }
}


// MARK: HomeViewInput
extension HomeViewController: HomeViewInput {
    func setHomeComics(_ comics: [ComicsEntity.ComicsData.Comics]) {
        self.homeComics = comics
    }
    
    func setHomeCharacters(_ characters: [CharacterEntity.CharacterData.Character]) {
        self.homeCharacters = characters
    }
    
    func getController() -> UIViewController {
        return self
    }
    
    func setupInitialState() {}
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == comicsCV {
            return homeComics.count
        } else {
            return homeCharacters.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == comicsCV {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ComicsCVCell.identifier, for: indexPath) as! ComicsCVCell
            cell.comics = homeComics[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCVCell.identifier, for: indexPath) as! CharacterCVCell
            cell.character = homeCharacters[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == comicsCV {
            let comicsId = homeComics[indexPath.row].id
            output.openComicsDetails(with: comicsId)
        } else {
            let characterId = homeCharacters[indexPath.row].id
            output.openCharacterDetails(with: characterId)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 300)
    }
}
