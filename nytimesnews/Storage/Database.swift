//
//  Database.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 25.09.2020.
//

import Foundation

protocol Database: NSObjectProtocol {
    func initializeStorage(_ storage: Storage)
    func loadData()
    func fetchFavorites() -> [News]
    func addNewsToFavorite(news: News)
    func removeFromFavorite(news: News)
    func clear()
    func isFavorite(news: News) -> Bool
}
