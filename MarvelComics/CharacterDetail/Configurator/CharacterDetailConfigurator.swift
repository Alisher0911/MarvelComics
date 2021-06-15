//
//  CharacterDetailCharacterDetailConfigurator.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class CharacterDetailModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, characterId: Int) {

        if let viewController = viewInput as? CharacterDetailViewController {
            configure(viewController: viewController, characterId: characterId)
        }
    }

    private func configure(viewController: CharacterDetailViewController, characterId: Int) {

        let router = CharacterDetailRouter()

        let presenter = CharacterDetailPresenter(characterId: characterId)
        presenter.view = viewController
        presenter.router = router

        let interactor = CharacterDetailInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
