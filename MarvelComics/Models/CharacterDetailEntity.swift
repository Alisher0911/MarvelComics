//
//  CharacterDetailEntity.swift
//  MarvelComics
//
//  Created by Alisher on 6/15/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import Foundation

struct CharacterDetailEntity: Decodable {
    let data: CharacterData
    
    struct CharacterData: Decodable {
        let results: [Character]
        
        struct Character: Decodable {
            let id: Int
            let name: String?
            let description: String?
            let thumbnail: Thumbnail?
            
            struct Thumbnail: Decodable {
                let path: String?
            }
        }
    }
}
