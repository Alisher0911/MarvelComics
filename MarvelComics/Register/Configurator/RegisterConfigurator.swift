//
//  RegisterRegisterConfigurator.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class RegisterModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? RegisterViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: RegisterViewController) {

        let router = RegisterRouter()

        let presenter = RegisterPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = RegisterInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
