//
//  HomeHomeRouter.swift
//  MarvelComics
//
//  Created by Alisher0911 on 14/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class HomeRouter: HomeRouterInput {
    func openComicsDetails(with id: Int, controller: UIViewController) {
        let newController = ComicsDetailModuleInitializer().viewController(comicsId: id)
        controller.navigationController?.pushViewController(newController, animated: true)
    }
    
    func openCharacterDetails(with id: Int, controller: UIViewController) {
        let newController = CharacterDetailModuleInitializer().viewController(characterId: id)
        controller.navigationController?.pushViewController(newController, animated: true)
    }
    
    func openAllComics(controller: UIViewController) {
        let newController = ComicsModuleInitializer().viewController()
        controller.navigationController?.pushViewController(newController, animated: true)
    }
    
    func openAllCharacters(controller: UIViewController) {
        let newController = CharactersModuleInitializer().viewController()
        controller.navigationController?.pushViewController(newController, animated: true)
    }
    
    func goToProfile(controller: UIViewController) {
        let newController = ProfileModuleInitializer().viewController()
        controller.navigationController?.pushViewController(newController, animated: true)
    }
}
