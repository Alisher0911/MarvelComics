//
//  HomeHomeInitializer.swift
//  MarvelComics
//
//  Created by Alisher0911 on 14/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class HomeModuleInitializer: NSObject {

    func viewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        let configurator = HomeModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: vc)
        
        return vc
    }
}
