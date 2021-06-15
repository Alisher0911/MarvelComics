//
//  CharacterDetailCharacterDetailInitializer.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class CharacterDetailModuleInitializer: NSObject {

    func viewController(characterId: Int) -> UIViewController {
        let storyboard = UIStoryboard(name: "CharacterDetail", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(identifier: "CharacterDetailViewController") as! CharacterDetailViewController
        let configurator = CharacterDetailModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: vc, characterId: characterId)
        
        return vc
    }
}
