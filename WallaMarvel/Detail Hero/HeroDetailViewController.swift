//
//  HeroDetailViewController.swift
//  WallaMarvel
//
//  Created by Elisabet Massó on 6/11/22.
//

import UIKit

final class HeroDetailViewController: UIViewController {
    var mainView: HeroDetailView { return view as! HeroDetailView  }
    
    var presenter: DetailHeroPresenterProtocol?
    var heroDetailProvider: HeroDetailAdapter?
    
    override func loadView() {
        view = HeroDetailView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        heroDetailProvider = HeroDetailAdapter(tableView: mainView.heroTableView)
        presenter?.getDetail()
        presenter?.ui = self
        
        title = presenter?.screenTitle()
    }
}

extension HeroDetailViewController: DetailHeroUI {
    func update(detail: CharacterDetailDataModel) {
        heroDetailProvider?.detail = detail
        
    }
}
