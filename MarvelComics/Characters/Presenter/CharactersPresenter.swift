//
//  CharactersCharactersPresenter.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

class CharactersPresenter: CharactersModuleInput {

    weak var view: CharactersViewInput!
    var interactor: CharactersInteractorInput!
    var router: CharactersRouterInput!

}

extension CharactersPresenter: CharactersViewOutput {
    func viewIsReady() {}
    
    func getCharacters(_ offset: Int) {
        interactor?.getCharacters(offset)
    }
    
    func openCharacterDetails(with id: Int) {
        router.openCharacterDetails(with: id, controller: view.getController())
    }
}


extension CharactersPresenter: CharactersInteractorOutput {
    func setCharacters(_ characters: [CharacterEntity.CharacterData.Character]) {
        view?.setCharacters(characters)
    }
}
