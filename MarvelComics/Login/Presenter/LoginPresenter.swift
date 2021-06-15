//
//  LoginLoginPresenter.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

class LoginPresenter: LoginModuleInput {

    weak var view: LoginViewInput!
    var interactor: LoginInteractorInput!
    var router: LoginRouterInput!
    
}

extension LoginPresenter: LoginViewOutput {
    func openHomePage() {
        router.openHomePage(controller: view.getController())
    }
    
    func viewIsReady() {}
}


extension LoginPresenter: LoginInteractorOutput {
    
}
