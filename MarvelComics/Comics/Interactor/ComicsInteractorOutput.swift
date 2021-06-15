//
//  ComicsComicsInteractorOutput.swift
//  MarvelComics
//
//  Created by Alisher0911 on 13/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import Foundation

protocol ComicsInteractorOutput: class {
    func setComics(_ comics: [ComicsEntity.ComicsData.Comics])
}
