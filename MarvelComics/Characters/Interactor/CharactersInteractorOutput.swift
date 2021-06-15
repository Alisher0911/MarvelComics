//
//  CharactersCharactersInteractorOutput.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import Foundation

protocol CharactersInteractorOutput: class {
    func setCharacters(_ characters: [CharacterEntity.CharacterData.Character])
}
