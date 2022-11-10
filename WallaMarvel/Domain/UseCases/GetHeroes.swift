import Foundation

protocol GetHeroesUseCaseProtocol {
    func execute(offset: String?, completionBlock: @escaping (CharacterDataContainer) -> Void)
}

struct GetHeroes: GetHeroesUseCaseProtocol {
    private let repository: MarvelRepositoryProtocol
    
    init(repository: MarvelRepositoryProtocol = MarvelRepository()) {
        self.repository = repository
    }
    
    func execute(offset: String?, completionBlock: @escaping (CharacterDataContainer) -> Void) {
        repository.getHeroes(offset: offset, completionBlock: completionBlock)
    }
}
