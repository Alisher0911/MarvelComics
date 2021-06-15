//
//  ComicsComicsInteractor.swift
//  MarvelComics
//
//  Created by Alisher0911 on 13/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import Foundation

class ComicsInteractor {

    weak var output: ComicsInteractorOutput!

}

extension ComicsInteractor: ComicsInteractorInput {
    func getComics(_ offset: Int) {
        var urlComponents = URLComponents(string: "http://gateway.marvel.com/v1/public/comics")
        urlComponents?.queryItems = [
            URLQueryItem(name: "apikey", value: "a304d3449009233b490d51ded6df022f"),
            URLQueryItem(name: "ts", value: "value"),
            URLQueryItem(name: "hash", value: "87eb66f938446b3f239502993ba2ec4b"),
            URLQueryItem(name: "offset", value: "\(offset)")
        ]
        
        if let url = urlComponents?.url?.absoluteURL {
            URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                if error == nil {
                    DispatchQueue.global().async {
                        do {
                            if let data = data {
                                let comics = try JSONDecoder().decode(ComicsEntity.self, from: data)
                                DispatchQueue.main.async {
                                    self?.output.setComics(comics.data.results)
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
