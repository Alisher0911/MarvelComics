//
//  ProfileProfilePresenter.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

class ProfilePresenter: ProfileModuleInput {

    weak var view: ProfileViewInput!
    var interactor: ProfileInteractorInput!
    var router: ProfileRouterInput!
    
}

extension ProfilePresenter: ProfileViewOutput {
    func goToFavouriteComics() {
        router.goToFavouriteComics(controller: view.getController())
    }
    
    func goToRoot() {
        router.goToRoot(controller: view.getController())
    }
    
    func viewIsReady() {}
}


extension ProfilePresenter: ProfileInteractorOutput {
    
}
