//
//  FavoriteComicsFavoriteComicsInitializer.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class FavoriteComicsModuleInitializer: NSObject {

    func viewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "FavoriteComics", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(identifier: "FavoriteComicsViewController") as! FavoriteComicsViewController
        let configurator = FavoriteComicsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: vc)
        
        return vc
    }
}
