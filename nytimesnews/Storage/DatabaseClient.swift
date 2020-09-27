//
//  DataBaseClient.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 25.09.2020.
//

import UIKit

class DatabaseClient: NSObject, Database {
    
    static let shared: DatabaseClient = DatabaseClient()
    
    private var storage: Storage!
    private var items: [Story] = []
    
    func initializeStorage(_ storage: Storage) {
        self.storage = storage
        self.storage.configure()
        loadData()
    }
    
    func loadData() {
        _ = fetchFavorites()
    }
    
    func fetchFavorites() -> [Story] {
        items = storage.getFavorites()
        return items
    }
    func addToFavorite(story: Story) {
        items.append(story)
        storage.createFavoriteFrom(story: story)
    }
    func removeFromFavorite(story: Story) {
        items.removeAll(where: {$0.id == story.id})
        storage.removeFromFavorites(story: story)
    }
    
    func clear() {
        storage.clear()
    }
    
    func isFavorite(story: Story) -> Bool {
        return items.contains(where: {$0.id == story.id})
    }

}
