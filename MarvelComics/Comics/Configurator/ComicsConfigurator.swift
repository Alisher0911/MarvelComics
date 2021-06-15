//
//  ComicsComicsConfigurator.swift
//  MarvelComics
//
//  Created by Alisher0911 on 13/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class ComicsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ComicsViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ComicsViewController) {

        let router = ComicsRouter()

        let presenter = ComicsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ComicsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
