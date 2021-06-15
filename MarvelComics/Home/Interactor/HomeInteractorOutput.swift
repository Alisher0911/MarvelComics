//
//  HomeHomeInteractorOutput.swift
//  MarvelComics
//
//  Created by Alisher0911 on 14/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import Foundation

protocol HomeInteractorOutput: class {
    func setHomeComics(_ comics: [ComicsEntity.ComicsData.Comics])
    func setHomeCharacters(_ characters: [CharacterEntity.CharacterData.Character])
}
