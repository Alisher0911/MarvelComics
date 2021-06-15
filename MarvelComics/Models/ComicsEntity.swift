//
//  ComicsEntity.swift
//  MarvelComics
//
//  Created by Alisher on 6/13/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import Foundation

struct ComicsEntity: Decodable {
    let data: ComicsData
    
    struct ComicsData: Decodable {
        let results: [Comics]
        
        struct Comics: Decodable {
            let id: Int
            let title: String?
            let format: String?
            var thumbnail: Thumbnail = Thumbnail()
            
            init(comics: FavComicsEntity) {
                self.id = Int(comics.id)
                self.title = comics.name
                self.format = comics.format
                self.thumbnail.path = comics.thumbnail
            }
            
            struct Thumbnail: Decodable {
                var path: String?
                
                init() {
                    self.path = ""
                }
            }
        }
    }
}
