//
//  Database.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 25.09.2020.
//

import Foundation

protocol Database: NSObjectProtocol {
    func initializeStorage(_ storage: Storage)
    func fetchFavorites() -> [Favorite]
    func addNewsToFavorite(news: News)
    func remove(favorite: Favorite)
    func clear()
}
