//
//  InitialInitialPresenter.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

class InitialPresenter: InitialModuleInput {

    weak var view: InitialViewInput!
    var interactor: InitialInteractorInput!
    var router: InitialRouterInput!

    
}


extension InitialPresenter: InitialViewOutput {
    func openLoginPage() {
        router.openLoginPage(controller: view.getController())
    }
    
    func openRegisterPage() {
        router.openRegisterPage(controller: view.getController())
    }
    
    func viewIsReady() {}
}

extension InitialPresenter: InitialInteractorOutput {
    
}
