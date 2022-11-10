//
//  CharacterDetailDataModel.swift
//  WallaMarvel
//
//  Created by Elisabet Massó on 5/11/22.
//

import Foundation

struct CharacterDetailDataModel: Decodable {
    
    let id: Int
    let name: String
    let thumbnail: Thumbnail
    let comics: [Comic]
    let series: [Serie]
    
    enum CodingKeys: String, CodingKey {
        case id, name, thumbnail
        case comicsData = "comics"
        case seriesData = "series"
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.thumbnail = try container.decode(Thumbnail.self, forKey: .thumbnail)
        let comicsData = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .comicsData)
        let seriesData = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .seriesData)
        self.comics = try comicsData.decode([Comic].self, forKey: .items)
        self.series = try seriesData.decode([Serie].self, forKey: .items)
    }
    
}

struct Comic: Decodable {
    let name: String
}


struct Serie: Decodable {
    let name: String
}
