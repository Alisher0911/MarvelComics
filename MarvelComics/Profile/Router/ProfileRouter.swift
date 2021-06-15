//
//  ProfileProfileRouter.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class ProfileRouter: ProfileRouterInput {
    func goToFavouriteComics(controller: UIViewController) {
        let newController = FavoriteComicsModuleInitializer().viewController()
        controller.navigationController?.pushViewController(newController, animated: true)
    }
    
    func goToRoot(controller: UIViewController) {
        controller.navigationController?.popToRootViewController(animated: true)
    }
}
