//
//  ComicsComicsInitializer.swift
//  MarvelComics
//
//  Created by Alisher0911 on 13/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class ComicsModuleInitializer: NSObject {

    func viewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Comics", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(identifier: "ComicsViewController") as! ComicsViewController
        let configurator = ComicsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: vc)
        
        return vc
    }
}
