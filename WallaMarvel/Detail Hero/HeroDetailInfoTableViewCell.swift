//
//  HeroDetailInfoTableViewCell.swift
//  WallaMarvel
//
//  Created by Elisabet Massó on 8/11/22.
//

import Foundation
import UIKit

final class HeroDetailInfoTableViewCell: UITableViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
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
        addSubview(titleLabel)
        addSubview(infoLabel)
    }
    
    private func addContraints() {
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 12).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: infoLabel.topAnchor, constant: -12).isActive = true
        
        infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 12).isActive = true
        infoLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 12).isActive = true
    }
    
    func configure(model: [Comic]) {
        var info = ""
        for item in model {
            info += "\(item.name)\n"
        }
        infoLabel.text = info
        titleLabel.text = "COMICS"
    }
    
    func configure(model: [Serie]) {
        var info = ""
        for item in model {
            info += "\(item.name)\n"
        }
        infoLabel.text = info
        titleLabel.text = "SERIES"
    }
}

