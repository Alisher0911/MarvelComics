//
//  ComicsDetailComicsDetailViewOutput.swift
//  MarvelComics
//
//  Created by Alisher0911 on 14/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

protocol ComicsDetailViewOutput {

    /**
        @author Alisher0911
        Notify presenter that view is ready
    */

    func viewIsReady()
    
    func getDetailCharacters(_ id: Int)
    
    func openCharacterDetails(with id: Int)
}
