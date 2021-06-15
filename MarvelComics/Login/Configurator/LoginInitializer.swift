//
//  LoginLoginInitializer.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class LoginModuleInitializer: NSObject {

    func viewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Login", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        let configurator = LoginModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: vc)
        
        return vc
    }
}
