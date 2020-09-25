//
//  NewsCell.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet private weak var newsTitleLabel: UILabel!
    @IBOutlet private weak var absctractLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var favoritesButton: UIButton!
    
    private var onFavoritePress: ((Bool)->())?

    func setupWith(news: News, isFavorite: Bool, onFavoritePress: ((Bool)->())?) {
        newsTitleLabel.text = news.title
        absctractLabel.text = news.abstract
        authorLabel.text = news.author
        dateLabel.text = news.publishedAt
        favoritesButton.isSelected = isFavorite
        self.onFavoritePress = onFavoritePress
    }
    
    @IBAction private func favoritesButtonPressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        onFavoritePress?(sender.isSelected)
    }
    
}
