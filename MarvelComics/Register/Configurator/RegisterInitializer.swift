//
//  RegisterRegisterInitializer.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class RegisterModuleInitializer: NSObject {

    func viewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Register", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(identifier: "RegisterViewController") as! RegisterViewController
        let configurator = RegisterModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: vc)
        
        return vc
    }
}
