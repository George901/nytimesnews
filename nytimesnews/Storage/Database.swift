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
    func fetchFavorites() -> [Story]
    func addToFavorite(story: Story)
    func removeFromFavorite(story: Story)
    func clear()
    func isFavorite(story: Story) -> Bool
}
