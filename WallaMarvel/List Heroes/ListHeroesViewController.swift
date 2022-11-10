import UIKit

final class ListHeroesViewController: UIViewController {
    var mainView: ListHeroesView { return view as! ListHeroesView  }
    
    var presenter: ListHeroesPresenterProtocol?
    var listHeroesProvider: ListHeroesAdapter?
    
    enum RequestPosition {
        case top, bottom
    }
    var requestPosition: RequestPosition = .bottom
    var shouldLoadData = false
    
    override func loadView() {
        view = ListHeroesView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        listHeroesProvider = ListHeroesAdapter(tableView: mainView.heroesTableView)
        presenter?.getHeroes()
        presenter?.ui = self
        
        title = presenter?.screenTitle()
        
        mainView.heroesTableView.delegate = self
    }
}

extension ListHeroesViewController: ListHeroesUI {
    func update(heroes: [CharacterDataModel]) {
        listHeroesProvider?.heroes = heroes
    }
}

extension ListHeroesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let hero = listHeroesProvider?.heroes[indexPath.row] else { return }
                
        let presenter = DetailHeroPresenter(hero: hero)
        let heroDetailViewController = HeroDetailViewController()
        heroDetailViewController.presenter = presenter
        
        navigationController?.pushViewController(heroDetailViewController, animated: true)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if scrollView == mainView.heroesTableView {
            print("scrollViewWillBeginDragging")
            shouldLoadData = false
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == mainView.heroesTableView {
            print("scrollViewDidEndDecelerating")
            if shouldLoadData {
                guard var offset = listHeroesProvider?.heroes.count else { return }
                if requestPosition  == .top {
                    offset *= -1
                }
                print("scrollViewRequest -> offset \(offset)")
                presenter?.getOtherHeroes(offset: offset)
            }
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView == mainView.heroesTableView {
            print("scrollViewDidEndDragging")
            
            if (scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height {
                if !shouldLoadData {
                    shouldLoadData = true
                    requestPosition = .bottom
                    print("scrollViewDidReachedEnd")
                }
            } else if scrollView.contentOffset.y <= 0 {
                if !shouldLoadData {
                    shouldLoadData = true
                    requestPosition = .top
                    print("scrollViewDidReachedTop")
                }
            }
            
        }
    }
    
}

