//
//  ComicsDetailComicsDetailInteractor.swift
//  MarvelComics
//
//  Created by Alisher0911 on 14/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import Foundation

class ComicsDetailInteractor {

    weak var output: ComicsDetailInteractorOutput!

}


extension ComicsDetailInteractor: ComicsDetailInteractorInput {
    func fetchComicsDetails(_ id: Int) {
        var urlComponents = URLComponents(string: "http://gateway.marvel.com/v1/public/comics/\(id)")
        urlComponents?.queryItems = [
            URLQueryItem(name: "apikey", value: "a304d3449009233b490d51ded6df022f"),
            URLQueryItem(name: "ts", value: "value"),
            URLQueryItem(name: "hash", value: "87eb66f938446b3f239502993ba2ec4b"),
        ]
        
        if let url = urlComponents?.url?.absoluteURL {
            URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                if error == nil {
                    DispatchQueue.global().async {
                        do {
                            if let data = data {
                                let comics = try JSONDecoder().decode(ComicsDetailEntity.self, from: data)
                                DispatchQueue.main.async {
                                    self?.output.setComicsDetail(comics.data.results[0])
                                }
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }.resume()
        }
    }
    
    
    func getDetailCharacters(_ id: Int) {
        var urlComponents = URLComponents(string: "http://gateway.marvel.com/v1/public/comics/\(id)/characters")
        urlComponents?.queryItems = [
            URLQueryItem(name: "apikey", value: "a304d3449009233b490d51ded6df022f"),
            URLQueryItem(name: "ts", value: "value"),
            URLQueryItem(name: "hash", value: "87eb66f938446b3f239502993ba2ec4b"),
        ]
        
        if let url = urlComponents?.url?.absoluteURL {
            URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                if error == nil {
                    DispatchQueue.global().async {
                        do {
                            if let data = data {
                                let characters = try JSONDecoder().decode(CharacterEntity.self, from: data)
                                DispatchQueue.main.async {
                                    self?.output.setDetailCharacters(characters.data.results)
                                }
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }.resume()
        }
    }
}
