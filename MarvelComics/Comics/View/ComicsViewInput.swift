//
//  ComicsComicsViewInput.swift
//  MarvelComics
//
//  Created by Alisher0911 on 13/06/2021.
//  Copyright © 2021 iOS Developer. All rights reserved.
//

import UIKit

protocol ComicsViewInput: class {

    /**
        @author Alisher0911
        Setup initial state of the view
    */

    func setupInitialState()
    
    func setComics(_ comics: [ComicsEntity.ComicsData.Comics])
    
    func getController() -> UIViewController
}
