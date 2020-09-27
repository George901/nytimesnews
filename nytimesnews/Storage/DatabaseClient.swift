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
    private var items: [News] = []
    
    func initializeStorage(_ storage: Storage) {
        self.storage = storage
        self.storage.configure()
        loadData()
    }
    
    func loadData() {
        _ = fetchFavorites()
    }
    
    func fetchFavorites() -> [News] {
        items = storage.getFavorites()
        return items
    }
    func addNewsToFavorite(news: News) {
        items.append(news)
        storage.createFavoriteFrom(news: news)
    }
    func removeFromFavorite(news: News) {
        items.removeAll(where: {$0.id == news.id})
        storage.removeFromFavorites(news: news)
    }
    
    func clear() {
        storage.clear()
    }
    
    func isFavorite(news: News) -> Bool {
        return items.contains(where: {$0.id == news.id})
    }

}
