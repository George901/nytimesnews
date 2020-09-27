//
//  FavoritesController.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 25.09.2020.
//

import UIKit

class FavoritesController: StoriesListController {
    
    @IBOutlet private weak var noDataLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    private func setupView() {
        noDataLabel.isHidden = !presenter.stories.isEmpty
        tableView.isHidden = presenter.stories.isEmpty
    }
    
    override func handleFavoriteSelection(for story: Story, isAdded: Bool) {
        presenter.removeFromFavorites(story: story)
        tableView.reloadData()
        setupView()
    }
    
}

extension FavoritesController {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter.removeFromFavorites(story: presenter.stories[indexPath.item])
            tableView.deleteRows(at: [indexPath], with: .automatic)
            setupView()
        }
    }
    
}
