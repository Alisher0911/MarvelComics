//
//  FavoriteComicsFavoriteComicsViewOutput.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

protocol FavoriteComicsViewOutput {

    /**
        @author Alisher0911
        Notify presenter that view is ready
    */

    func viewIsReady()
    
    func openComicsDetails(with id: Int)
}
