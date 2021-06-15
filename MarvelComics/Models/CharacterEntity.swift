//
//  CharacterEntity.swift
//  MarvelComics
//
//  Created by Alisher on 6/14/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import Foundation

struct CharacterEntity: Decodable {
    let data: CharacterData
    
    struct CharacterData: Decodable {
        let results: [Character]
        
        struct Character: Decodable {
            let id: Int
            let name: String?
            let thumbnail: Thumbnail?
            
            struct Thumbnail: Decodable {
                let path: String?
            }
        }
    }
}
