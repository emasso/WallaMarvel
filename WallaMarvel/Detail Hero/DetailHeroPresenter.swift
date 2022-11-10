//
//  DetailHeroPresenter.swift
//  WallaMarvel
//
//  Created by Elisabet Massó on 30/10/22.
//

import Foundation

protocol DetailHeroPresenterProtocol: AnyObject {
    var ui: DetailHeroUI? { get set }
    func screenTitle() -> String
    func getDetail()
}

protocol DetailHeroUI: AnyObject {
    func update(detail: CharacterDetailDataModel)
}

final class DetailHeroPresenter: DetailHeroPresenterProtocol {
    var ui: DetailHeroUI?
    private let getHeroDetailUseCase: GetHeroDetailUseCaseProtocol
    private var hero: CharacterDataModel
    
    init(getHeroDetailUseCase: GetHeroDetailUseCaseProtocol = GetHeroDetail(), hero: CharacterDataModel) {
        self.getHeroDetailUseCase = getHeroDetailUseCase
        self.hero = hero
    }
    
    func screenTitle() -> String {
        "\(hero.name) Detail"
    }
    
    func getDetail() {
        self.getHeroDetailUseCase.execute(characterId: hero.id) { detailDataContainer in
            print("Hero detail \(detailDataContainer.character)")
            self.ui?.update(detail: detailDataContainer.character)
        }
    }
    
    
}
