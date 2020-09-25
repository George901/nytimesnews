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
    
    func initializeStorage(_ storage: Storage) {
        self.storage = storage
        self.storage.configure()
    }
    
    func fetchFavorites() -> [Favorite] {
        return storage.getFavorites()
    }
    
    func addNewsToFavorite(news: News) {
        storage.createFavoriteFrom(news: news)
    }
    
    func remove(favorite: Favorite) {
        storage.delete(favorite: favorite)
    }
    
    func clear() {
        storage.clear()
    }

}
