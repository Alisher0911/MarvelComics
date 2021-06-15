//
//  CharactersCharactersViewController.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class CharactersViewController: UIViewController {

    var output: CharactersViewOutput!
    
    @IBOutlet weak var tableView: UITableView!
    
    private var offset: Int = 0
    private var isLoading: Bool = false
    
    private var characters: [CharacterEntity.CharacterData.Character] = [] {
        didSet {
            isLoading = false
            tableView.reloadData()
        }
    }
    

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Characters"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UINib(nibName: CharacterCell.identifier, bundle: Bundle(for: CharacterCell.self)), forCellReuseIdentifier: CharacterCell.identifier)
        
        output?.getCharacters(offset)
    }


}


// MARK: CharactersViewInput
extension CharactersViewController: CharactersViewInput {
    func setCharacters(_ characters: [CharacterEntity.CharacterData.Character]) {
        self.characters += characters
    }
    
    func getController() -> UIViewController {
        return self
    }
    
    func setupInitialState() {}
}


extension CharactersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let characterId = characters[indexPath.row].id
        output.openCharacterDetails(with: characterId)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        let deltaOffset = maximumOffset - currentOffset
        
        if deltaOffset <= 10 && currentOffset > 200 && !isLoading {
            isLoading = true
            offset += 20
            output?.getCharacters(offset)
        }
    }
}


extension CharactersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCell.identifier, for: indexPath) as! CharacterCell
        cell.character = characters[indexPath.row]
        return cell
    }
    
    
}
