//
//  HeroDetailAdapter.swift
//  WallaMarvel
//
//  Created by Elisabet Massó on 6/11/22.
//

import Foundation
import UIKit

final class HeroDetailAdapter: NSObject, UITableViewDataSource {
    var detail: CharacterDetailDataModel? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private let tableView: UITableView
    
    init(tableView: UITableView, detail: CharacterDetailDataModel? = nil) {
        self.tableView = tableView
        self.detail = detail
        super.init()
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let detail = detail else { return UITableViewCell() }
        var cell = UITableViewCell()
        
        if indexPath.row == 0 {
            let detailCell = tableView.dequeueReusableCell(withIdentifier: "HeroDetailTableViewCell", for: indexPath) as! HeroDetailTableViewCell
            detailCell.configure(model: detail)
            cell = detailCell
        } else if indexPath.row == 1 {
            let infoCell = tableView.dequeueReusableCell(withIdentifier: "HeroDetailInfoTableViewCell", for: indexPath) as! HeroDetailInfoTableViewCell
            infoCell.configure(model: detail.comics)
            cell = infoCell
        } else if indexPath.row == 2 {
            let infoCell = tableView.dequeueReusableCell(withIdentifier: "HeroDetailInfoTableViewCell", for: indexPath) as! HeroDetailInfoTableViewCell
            infoCell.configure(model: detail.series)
            cell = infoCell
        }
        
        cell.isUserInteractionEnabled = false
        
        return cell
    }
}
