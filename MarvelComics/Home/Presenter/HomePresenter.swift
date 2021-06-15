//
//  HomeHomePresenter.swift
//  MarvelComics
//
//  Created by Alisher0911 on 14/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

class HomePresenter: HomeModuleInput {

    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!

}

extension HomePresenter: HomeViewOutput {
    
    func getHomeComics() {
        interactor?.getHomeComics()
    }
    
    func getHomeCharacters() {
        interactor?.getHomeCharacters()
    }
    
    func openComicsDetails(with id: Int) {
        router.openComicsDetails(with: id, controller: view.getController())
    }
    
    func openCharacterDetails(with id: Int) {
        router.openCharacterDetails(with: id, controller: view.getController())
    }
    
    func openAllComics() {
        router.openAllComics(controller: view.getController())
    }
    
    func openAllCharacters() {
        router.openAllCharacters(controller: view.getController())
    }
    
    func goToProfile() {
        router.goToProfile(controller: view.getController())
    }
    
    func viewIsReady() {}
}


extension HomePresenter: HomeInteractorOutput {
    func setHomeComics(_ comics: [ComicsEntity.ComicsData.Comics]) {
        view?.setHomeComics(comics)
    }
    
    func setHomeCharacters(_ characters: [CharacterEntity.CharacterData.Character]) {
        view?.setHomeCharacters(characters)
    }
}
