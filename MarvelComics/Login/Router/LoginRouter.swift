//
//  LoginLoginRouter.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class LoginRouter: LoginRouterInput {
    func openHomePage(controller: UIViewController) {
        let newController = HomeModuleInitializer().viewController()
        controller.navigationController?.pushViewController(newController, animated: true)
    }
}
