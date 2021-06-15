//
//  HomeHomeViewInput.swift
//  MarvelComics
//
//  Created by Alisher0911 on 14/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

protocol HomeViewInput: class {

    /**
        @author Alisher0911
        Setup initial state of the view
    */

    func setupInitialState()
    
    func setHomeComics(_ comics: [ComicsEntity.ComicsData.Comics])
    func setHomeCharacters(_ characters: [CharacterEntity.CharacterData.Character])
    
    func getController() -> UIViewController
}
