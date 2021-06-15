//
//  FavoriteComicsFavoriteComicsViewController.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit
import Firebase

class FavoriteComicsViewController: UIViewController {

    var output: FavoriteComicsViewOutput!

    @IBOutlet weak var tableView: UITableView!
    
    private var comics: [ComicsEntity.ComicsData.Comics] = [] {
        didSet(oldComics) {
            if comics.count != oldComics.count {
                tableView.reloadData()
            }
        }
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        
        navigationItem.title = "Favorite"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UINib(nibName: ComicsCell.identifier, bundle: Bundle(for: ComicsCell.self)), forCellReuseIdentifier: ComicsCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let email = Auth.auth().currentUser?.email else { return }
        comics = CoreDataManager.shared.allComics(email: email)
    }
}


// MARK: FavoriteComicsViewInput
extension FavoriteComicsViewController: FavoriteComicsViewInput {
    func getController() -> UIViewController {
        return self
    }
    
    func setupInitialState() {}
}


extension FavoriteComicsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comicsId = comics[indexPath.row].id
        output.openComicsDetails(with: comicsId)
    }
}

extension FavoriteComicsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ComicsCell.identifier, for: indexPath) as! ComicsCell
        cell.comics = comics[indexPath.row]
        return cell
    }
    
    
}
