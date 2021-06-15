//
//  ComicsDetailComicsDetailInteractorOutput.swift
//  MarvelComics
//
//  Created by Alisher0911 on 14/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import Foundation

protocol ComicsDetailInteractorOutput: class {
    func setComicsDetail(_ comics: ComicsDetailEntity.ComicsData.Comics)
    func setDetailCharacters(_ characters: [CharacterEntity.CharacterData.Character])
}
