//
//  FavoriteComicsFavoriteComicsRouter.swift
//  MarvelComics
//
//  Created by Alisher0911 on 15/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

class FavoriteComicsRouter: FavoriteComicsRouterInput {
    func openComicsDetails(with id: Int, controller: UIViewController) {
        let newController = ComicsDetailModuleInitializer().viewController(comicsId: id)
        controller.navigationController?.pushViewController(newController, animated: true)
    }
}
