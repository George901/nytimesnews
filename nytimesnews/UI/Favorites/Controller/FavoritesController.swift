//
//  FavoritesController.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 25.09.2020.
//

import UIKit

class FavoritesController: NewsListController {
    
    @IBOutlet private weak var noDataLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        noDataLabel.isHidden = !presenter.news.isEmpty
        tableView.isHidden = presenter.news.isEmpty
    }
    
}

extension FavoritesController {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter.removeFromFavorites(news: presenter.news[indexPath.item])
        }
    }
    
}
