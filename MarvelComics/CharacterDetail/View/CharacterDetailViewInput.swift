//
//  CharacterDetailCharacterDetailViewInput.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

protocol CharacterDetailViewInput: class {

    /**
        @author Alisher0911
        Setup initial state of the view
    */

    func setupInitialState()
    
    func setCharacterDetail(_ character: CharacterDetailEntity.CharacterData.Character)
}
