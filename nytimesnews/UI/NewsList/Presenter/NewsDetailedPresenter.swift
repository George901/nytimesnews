//
//  NewsDetailedPresenter.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 25.09.2020.
//

import UIKit

protocol NewsDetailPresenter {
    var detailedNews: News { get set }
    func addToFavorites()
    func removeFromFavorites()
    func isFavorite() -> Bool
}

class NewsDetailedPresenter: NSObject, NewsDetailPresenter {
    
    var detailedNews: News
    private let database: Database
    
    init(database: Database, news: News) {
        self.database = database
        self.detailedNews = news
        super.init()
    }
    
    func addToFavorites() {
        database.addNewsToFavorite(news: detailedNews)
    }
    
    func removeFromFavorites() {
        database.removeFromFavorite(news: detailedNews)
    }
    
    func isFavorite() -> Bool {
        return database.isFavorite(news: detailedNews)
    }
    


}
