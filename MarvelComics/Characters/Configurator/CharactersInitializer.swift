//
//  CharactersCharactersInitializer.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class CharactersModuleInitializer: NSObject {

    func viewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Characters", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(identifier: "CharactersViewController") as! CharactersViewController
        let configurator = CharactersModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: vc)
        
        return vc
    }
}
