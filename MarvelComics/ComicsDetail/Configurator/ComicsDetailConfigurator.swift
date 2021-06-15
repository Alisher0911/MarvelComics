//
//  ComicsDetailComicsDetailConfigurator.swift
//  MarvelComics
//
//  Created by Alisher0911 on 14/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class ComicsDetailModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController, comicsId: Int) {

        if let viewController = viewInput as? ComicsDetailViewController {
            configure(viewController: viewController, comicsId: comicsId)
        }
    }

    private func configure(viewController: ComicsDetailViewController, comicsId: Int) {

        let router = ComicsDetailRouter()

        let presenter = ComicsDetailPresenter(comicsId: comicsId)
        presenter.view = viewController
        presenter.router = router

        let interactor = ComicsDetailInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
