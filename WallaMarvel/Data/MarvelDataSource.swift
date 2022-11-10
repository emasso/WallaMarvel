import Foundation

protocol MarvelDataSourceProtocol {
    func getHeroes(offset: String?, completionBlock: @escaping (CharacterDataContainer) -> Void)
    func getHeroDetail(characterId: Int, completionBlock: @escaping (CharacterDetailDataContainer) -> Void)
}

final class MarvelDataSource: MarvelDataSourceProtocol {
    private let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }
    
    func getHeroes(offset: String?, completionBlock: @escaping (CharacterDataContainer) -> Void) {
        return apiClient.getHeroes(offset: offset, completionBlock: completionBlock)
    }
    
    func getHeroDetail(characterId: Int, completionBlock: @escaping (CharacterDetailDataContainer) -> Void) {
        return apiClient.getHeroDetail(characterId: characterId, completionBlock: completionBlock)
    }
}
