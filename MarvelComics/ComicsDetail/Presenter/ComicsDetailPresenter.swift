//
//  ComicsDetailComicsDetailPresenter.swift
//  MarvelComics
//
//  Created by Alisher0911 on 14/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

class ComicsDetailPresenter: ComicsDetailModuleInput {

    weak var view: ComicsDetailViewInput!
    var interactor: ComicsDetailInteractorInput!
    var router: ComicsDetailRouterInput!

    private var comicsId: Int
    
    init(comicsId: Int) {
        self.comicsId = comicsId
    }
}

extension ComicsDetailPresenter: ComicsDetailViewOutput {
    func getDetailCharacters(_ id: Int) {
        interactor?.getDetailCharacters(id)
    }
    
    func viewIsReady() {
        interactor?.fetchComicsDetails(comicsId)
    }
    
    func openCharacterDetails(with id: Int) {
        router.openCharacterDetails(with: id, controller: view.getController())
    }
}


extension ComicsDetailPresenter: ComicsDetailInteractorOutput {
    func setDetailCharacters(_ characters: [CharacterEntity.CharacterData.Character]) {
        view?.setDetailCharacters(characters)
    }
    
    func setComicsDetail(_ comics: ComicsDetailEntity.ComicsData.Comics) {
        view?.setComicsDetail(comics)
    }
}
