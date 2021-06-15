//
//  ComicsDetailComicsDetailInteractorInput.swift
//  MarvelComics
//
//  Created by Alisher0911 on 14/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import Foundation

protocol ComicsDetailInteractorInput {
    func fetchComicsDetails(_ id: Int)
    func getDetailCharacters(_ id: Int)
}
