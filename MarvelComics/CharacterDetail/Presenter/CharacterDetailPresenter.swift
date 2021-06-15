//
//  CharacterDetailCharacterDetailPresenter.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

class CharacterDetailPresenter: CharacterDetailModuleInput {

    weak var view: CharacterDetailViewInput!
    var interactor: CharacterDetailInteractorInput!
    var router: CharacterDetailRouterInput!

    private var characterId: Int
    
    init(characterId: Int) {
        self.characterId = characterId
    }
    
    
}


extension CharacterDetailPresenter: CharacterDetailViewOutput {
    func viewIsReady() {
        interactor?.fetchCharacterDetails(characterId)
    }
}

extension CharacterDetailPresenter: CharacterDetailInteractorOutput {
    func setCharacterDetail(_ character: CharacterDetailEntity.CharacterData.Character) {
        view?.setCharacterDetail(character)
    }
}
