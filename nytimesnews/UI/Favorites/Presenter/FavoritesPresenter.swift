//
//  FavoritesPresenter.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 25.09.2020.
//

import UIKit

class FavoritesPresenter: NSObject, NewsPresenter {
  
    var news: [News] = []
    var coordinator: NewsListCoordinator!
    weak var view: NewsListView!
    
    private let database: Database
    
    init(database: Database) {
        self.database = database
        super.init()
    }
    
    func getNews() {
        news = database.fetchFavorites()
    }
    
    func addToFavorites(news: News) {
        return
    }
    
    func removeFromFavorites(news: News) {
        self.news.removeAll(where: {$0.id == news.id})
        database.removeFromFavorite(news: news)
    }
    
    func isFavorite(news: News) -> Bool {
        return true
    }
    
    func showDetailed(news: News) {
        coordinator.showDetailed(news: news)
    }
    
    

}
