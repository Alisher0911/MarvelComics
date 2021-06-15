//
//  ComicsComicsPresenter.swift
//  MarvelComics
//
//  Created by Alisher0911 on 13/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

class ComicsPresenter: ComicsModuleInput {

    weak var view: ComicsViewInput!
    var interactor: ComicsInteractorInput!
    var router: ComicsRouterInput!

}

extension ComicsPresenter: ComicsViewOutput {
    func viewIsReady() {}
    
    func getComics(_ offset: Int) {
        interactor?.getComics(offset)
    }
    
    func openComicsDetails(with id: Int) {
        router.openComicsDetails(with: id, controller: view.getController())
    }
}

extension ComicsPresenter: ComicsInteractorOutput {
    func setComics(_ comics: [ComicsEntity.ComicsData.Comics]) {
        view?.setComics(comics)
    }
}
