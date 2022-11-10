import Foundation

protocol ListHeroesPresenterProtocol: AnyObject {
    var ui: ListHeroesUI? { get set }
    func screenTitle() -> String
    func getHeroes()
    func getOtherHeroes(offset: Int)
}

protocol ListHeroesUI: AnyObject {
    func update(heroes: [CharacterDataModel])
}

final class ListHeroesPresenter: ListHeroesPresenterProtocol {
    var ui: ListHeroesUI?
    private let getHeroesUseCase: GetHeroesUseCaseProtocol
    private var offset: Int = 0
    
    init(getHeroesUseCase: GetHeroesUseCaseProtocol = GetHeroes()) {
        self.getHeroesUseCase = getHeroesUseCase
    }
    
    func screenTitle() -> String {
        "List of Heroes"
    }
    
    // MARK: UseCases
    
    func getHeroes() {
        doHeroesRequest()
    }
    
    func getOtherHeroes(offset: Int) {
        let newOffset = (self.offset + offset) < 0 ? 0 : (self.offset + offset)
        if newOffset == self.offset { return }
        doHeroesRequest(newOffset: "\(newOffset)")
    }
    
    private func doHeroesRequest(newOffset: String? = nil) {
        getHeroesUseCase.execute(offset: newOffset) { characterDataContainer in
            self.offset = characterDataContainer.offset
            print("Characters request done. Updating...")
            self.ui?.update(heroes: characterDataContainer.characters)
        }
    }
    
}

