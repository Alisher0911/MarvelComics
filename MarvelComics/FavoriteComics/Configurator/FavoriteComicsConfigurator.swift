//
//  FavoriteComicsFavoriteComicsConfigurator.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class FavoriteComicsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? FavoriteComicsViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: FavoriteComicsViewController) {

        let router = FavoriteComicsRouter()

        let presenter = FavoriteComicsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = FavoriteComicsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
