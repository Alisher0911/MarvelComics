//
//  ComicsDetailComicsDetailInitializer.swift
//  MarvelComics
//
//  Created by Alisher0911 on 14/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class ComicsDetailModuleInitializer: NSObject {

    func viewController(comicsId: Int) -> UIViewController {
        let storyboard = UIStoryboard(name: "ComicsDetail", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(identifier: "ComicsDetailViewController") as! ComicsDetailViewController
        let configurator = ComicsDetailModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: vc, comicsId: comicsId)
        
        return vc
    }
}
