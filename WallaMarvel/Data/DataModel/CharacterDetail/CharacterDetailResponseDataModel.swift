//
//  CharacterDetailResponseDataModel.swift
//  WallaMarvel
//
//  Created by Elisabet Massó on 5/11/22.
//

import Foundation

struct CharacterDetailDataContainer: Decodable {
    
    let character: CharacterDetailDataModel
    
    enum CodingKeys: String, CodingKey {
        case data
        case characters = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let data = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        self.character = try data.decode([CharacterDetailDataModel].self, forKey: .characters)[0]
    }
    
}
