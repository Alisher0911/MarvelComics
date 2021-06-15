//
//  HomeHomeRouterInput.swift
//  MarvelComics
//
//  Created by Alisher0911 on 14/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

protocol HomeRouterInput {
    func openComicsDetails(with id: Int, controller: UIViewController)
    func openCharacterDetails(with id: Int, controller: UIViewController)
    func openAllComics(controller: UIViewController)
    func openAllCharacters(controller: UIViewController)
    func goToProfile(controller: UIViewController)
}
