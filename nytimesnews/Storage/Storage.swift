//
//  FavoritesStorage.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//

import Foundation

protocol Storage: NSObjectProtocol {
    func configure()
    func createFavoriteFrom(news: News)
    func getFavorites() -> [Favorite]
    func delete(favorite: Favorite)
    func clear()
}
