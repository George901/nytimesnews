//
//  NewsDetailedPresenter.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 25.09.2020.
//

import UIKit

protocol NewsDetailPresenter {
    var detailedNews: Story { get set }
    func addToFavorites()
    func removeFromFavorites()
    func isFavorite() -> Bool
}

class NewsDetailedPresenter: NSObject, NewsDetailPresenter {
    
    var detailedNews: Story
    private let database: Database
    
    init(database: Database, news: Story) {
        self.database = database
        self.detailedNews = news
        super.init()
    }
    
    func addToFavorites() {
        database.addToFavorite(story: detailedNews)
    }
    
    func removeFromFavorites() {
        database.removeFromFavorite(story: detailedNews)
    }
    
    func isFavorite() -> Bool {
        return database.isFavorite(story: detailedNews)
    }
    


}
