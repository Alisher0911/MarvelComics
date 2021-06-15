//
//  ComicsDetailComicsDetailRouter.swift
//  MarvelComics
//
//  Created by Alisher0911 on 14/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class ComicsDetailRouter: ComicsDetailRouterInput {
    func openCharacterDetails(with id: Int, controller: UIViewController) {
        let newController = CharacterDetailModuleInitializer().viewController(characterId: id)
        controller.navigationController?.pushViewController(newController, animated: true)
    }
}
