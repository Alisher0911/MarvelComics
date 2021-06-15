//
//  ComicsDetailComicsDetailViewInput.swift
//  MarvelComics
//
//  Created by Alisher0911 on 14/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

protocol ComicsDetailViewInput: class {

    /**
        @author Alisher0911
        Setup initial state of the view
    */

    func setupInitialState()
    
    func setComicsDetail(_ comics: ComicsDetailEntity.ComicsData.Comics)
    func setDetailCharacters(_ characters: [CharacterEntity.CharacterData.Character])
    
    func getController() -> UIViewController
}
