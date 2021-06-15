//
//  InitialInitialConfigurator.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class InitialModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? InitialViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: InitialViewController) {

        let router = InitialRouter()

        let presenter = InitialPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = InitialInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
