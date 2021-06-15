//
//  FavoriteComicsFavoriteComicsPresenter.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

class FavoriteComicsPresenter: FavoriteComicsModuleInput {

    weak var view: FavoriteComicsViewInput!
    var interactor: FavoriteComicsInteractorInput!
    var router: FavoriteComicsRouterInput!

}


extension FavoriteComicsPresenter: FavoriteComicsViewOutput {
    func openComicsDetails(with id: Int) {
        router.openComicsDetails(with: id, controller: view.getController())
    }
    
    func viewIsReady() {}
}


extension FavoriteComicsPresenter: FavoriteComicsInteractorOutput {
    
}
