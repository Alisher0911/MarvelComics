//
//  CharactersCharactersViewOutput.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

protocol CharactersViewOutput {

    /**
        @author Alisher0911
        Notify presenter that view is ready
    */

    func viewIsReady()
    
    func getCharacters(_ offset: Int)
    
    func openCharacterDetails(with id: Int)
}
