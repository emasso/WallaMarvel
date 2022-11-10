//
//  HeroDetailTableViewCell.swift
//  WallaMarvel
//
//  Created by Elisabet Massó on 6/11/22.
//

import Foundation
import UIKit
import Kingfisher

final class HeroDetailTableViewCell: UITableViewCell {
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let heroName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubviews()
        addContraints()
    }
    
    private func addSubviews() {
        addSubview(heroImageView)
        addSubview(heroName)
    }
    
    private func addContraints() {
        heroImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2.5).isActive = true
        heroImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        heroImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        heroImageView.bottomAnchor.constraint(equalTo: heroName.topAnchor, constant: -5).isActive = true
        
        heroName.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        heroName.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        heroName.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func configure(model: CharacterDetailDataModel) {
        heroImageView.kf.setImage(with: URL(string: model.thumbnail.path + "/standard_large." + model.thumbnail.extension))
        heroName.text = model.name        
    }
}

