//
//  ProfileProfileInitializer.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class ProfileModuleInitializer: NSObject {

    func viewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Profile", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(identifier: "ProfileViewController") as! ProfileViewController
        let configurator = ProfileModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: vc)
        
        return vc
    }
}
