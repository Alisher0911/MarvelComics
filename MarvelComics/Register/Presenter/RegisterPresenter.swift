//
//  RegisterRegisterPresenter.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

class RegisterPresenter: RegisterModuleInput {

    weak var view: RegisterViewInput!
    var interactor: RegisterInteractorInput!
    var router: RegisterRouterInput!

}


extension RegisterPresenter: RegisterViewOutput {
    func openHomePage() {
        router.openHomePage(controller: view.getController())
    }
    
    func viewIsReady() {}
}


extension RegisterPresenter: RegisterInteractorOutput {
    
}
