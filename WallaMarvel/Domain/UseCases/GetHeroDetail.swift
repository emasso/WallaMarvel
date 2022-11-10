//
//  GetHeroDetail.swift
//  WallaMarvel
//
//  Created by Elisabet Massó on 30/10/22.
//

import Foundation

protocol GetHeroDetailUseCaseProtocol {
    func execute(characterId: Int, completionBlock: @escaping (CharacterDetailDataContainer) -> Void)
}

struct GetHeroDetail: GetHeroDetailUseCaseProtocol {
    private let repository: MarvelRepositoryProtocol
    
    init(repository: MarvelRepositoryProtocol = MarvelRepository()) {
        self.repository = repository
    }
    
    func execute(characterId: Int, completionBlock: @escaping (CharacterDetailDataContainer) -> Void) {
        repository.getHeroDetail(characterId: characterId, completionBlock: completionBlock)
    }
}
