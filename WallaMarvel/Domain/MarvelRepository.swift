import Foundation

protocol MarvelRepositoryProtocol {
    func getHeroes(offset: String?, completionBlock: @escaping (CharacterDataContainer) -> Void)
    func getHeroDetail(characterId: Int, completionBlock: @escaping (CharacterDetailDataContainer) -> Void)
}

final class MarvelRepository: MarvelRepositoryProtocol {
    private let dataSource: MarvelDataSourceProtocol
    
    init(dataSource: MarvelDataSourceProtocol = MarvelDataSource()) {
        self.dataSource = dataSource
    }
    
    func getHeroes(offset: String?, completionBlock: @escaping (CharacterDataContainer) -> Void) {
        dataSource.getHeroes(offset: offset, completionBlock: completionBlock)
    }
    
    func getHeroDetail(characterId: Int, completionBlock: @escaping (CharacterDetailDataContainer) -> Void) {
        dataSource.getHeroDetail(characterId: characterId, completionBlock: completionBlock)
    }
}
