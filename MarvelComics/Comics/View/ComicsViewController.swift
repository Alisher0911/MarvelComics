//
//  ComicsComicsViewController.swift
//  MarvelComics
//
//  Created by Alisher0911 on 13/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class ComicsViewController: UIViewController {

    var output: ComicsViewOutput!

    @IBOutlet weak var tableView: UITableView!
    
    private var offset: Int = 3
    private var isLoading: Bool = false
    
    private var comics: [ComicsEntity.ComicsData.Comics] = [ComicsEntity.ComicsData.Comics]() {
           didSet {
                isLoading = false
                tableView.reloadData()
           }
       }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Comics"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0)
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UINib(nibName: ComicsCell.identifier, bundle: Bundle(for: ComicsCell.self)), forCellReuseIdentifier: ComicsCell.identifier)
        
        output?.getComics(offset)
    }
}


// MARK: ComicsViewInput
extension ComicsViewController: ComicsViewInput {
    func setComics(_ comics: [ComicsEntity.ComicsData.Comics]) {
        self.comics += comics
    }
    
    func getController() -> UIViewController {
        return self
    }
    
    func setupInitialState() {}
}


extension ComicsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comicsId = comics[indexPath.row].id
        output.openComicsDetails(with: comicsId)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        let deltaOffset = maximumOffset - currentOffset
        
        if deltaOffset <= 10 && currentOffset > 200 && !isLoading {
            isLoading = true
            offset += 20
            output?.getComics(offset)
        }
    }
}


extension ComicsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ComicsCell.identifier, for: indexPath) as! ComicsCell
        cell.comics = comics[indexPath.row]
        return cell
    }
    
    
}
