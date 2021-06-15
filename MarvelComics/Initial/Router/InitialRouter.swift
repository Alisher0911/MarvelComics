//
//  InitialInitialRouter.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class InitialRouter: InitialRouterInput {
    func openLoginPage(controller: UIViewController) {
        let newController = LoginModuleInitializer().viewController()
        controller.navigationController?.pushViewController(newController, animated: true)
    }
    
    func openRegisterPage(controller: UIViewController) {
        let newController = RegisterModuleInitializer().viewController()
        controller.navigationController?.pushViewController(newController, animated: true)
    }
}
