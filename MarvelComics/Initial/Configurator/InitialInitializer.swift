//
//  InitialInitialInitializer.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class InitialModuleInitializer: NSObject {

    func viewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Initial", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(identifier: "InitialViewController") as! InitialViewController
        let configurator = InitialModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: vc)
        
        return vc
    }
}
