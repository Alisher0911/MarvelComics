//
//  CharactersCharactersConfigurator.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class CharactersModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? CharactersViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: CharactersViewController) {

        let router = CharactersRouter()

        let presenter = CharactersPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = CharactersInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
