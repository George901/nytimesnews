//
//  FavoritesStorage.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//

import Foundation

protocol Storage: NSObjectProtocol {
    func configure()
    func createFavoriteFrom(story: Story)
    func getFavorites() -> [Favorite]
    func removeFromFavorites(story: Story)
    func clear()
}
