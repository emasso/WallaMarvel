//
//  HeroDetailView.swift
//  WallaMarvel
//
//  Created by Elisabet Massó on 6/11/22.
//

import Foundation
import UIKit
import Kingfisher

final class HeroDetailView: UIView {
        
    enum Constant {
        static let estimatedRowHeight: CGFloat = 120
    }
    
    let heroTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(HeroDetailTableViewCell.self, forCellReuseIdentifier: "HeroDetailTableViewCell")
        tableView.register(HeroDetailInfoTableViewCell.self, forCellReuseIdentifier: "HeroDetailInfoTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = Constant.estimatedRowHeight
        return tableView
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .white
        addSubviews()
        addContraints()
    }
    
    private func addSubviews() {
        addSubview(heroTableView)
    }
    
    private func addContraints() {
        heroTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        heroTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        heroTableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        heroTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
}
