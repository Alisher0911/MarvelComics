//
//  ComicsDetailEntity.swift
//  MarvelComics
//
//  Created by Alisher on 6/14/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import Foundation

struct ComicsDetailEntity: Decodable {
    let data: ComicsData
    
    struct ComicsData: Decodable {
        let results: [Comics]
        
        struct Comics: Decodable {
            let id: Int
            let title: String?
            let format: String?
            let description: String?
            let thumbnail: Thumbnail?
            
            struct Thumbnail: Decodable {
                let path: String?
            }
        }
    }
}
