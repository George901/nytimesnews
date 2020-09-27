//
//  NewsListPresenter.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//

import UIKit

protocol NewsPresenter: NSObjectProtocol {
    var news: [News] { get set }
    func getNews()
    func addToFavorites(news: News)
    func removeFromFavorites(news: News)
    func isFavorite(news: News) -> Bool
    func showDetailed(news: News)
}

class NewsListPresenter: NSObject, NewsPresenter {
    
    var news: [News] = []
    var coordinator: NewsListCoordinator!
    weak var view: NewsListView!
    
    private let api: NewsApi
    private let database: Database
    
    init(api: NewsApi, database: Database) {
        self.api = api
        self.database = database
        super.init()
    }
    
    func getNews() {
        view.showActivity()
        api.loadNews { [weak self] (news) in
            self?.view.hideActivity()
            self?.handleLoaded(news: news)
        } onError: { [weak self] (error) in
            self?.view.hideActivity()
            self?.handle(error: error)
        }

    }
    
    func addToFavorites(news: News) {
        database.addNewsToFavorite(news: news)
    }
    
    func removeFromFavorites(news: News) {
        database.removeFromFavorite(news: news)
    }
    
    func isFavorite(news: News) -> Bool {
        return database.isFavorite(news: news)
    }
    
    func showDetailed(news: News) {
        coordinator.showDetailed(news: news)
    }
    
    private func handleLoaded(news: [News]?) {
        if let news = news {
            self.news = news
        }
        view.update()
    }
    
    private func handle(error: Error?) {
        if let err = error {
            view.show(error: err)
        }
    }
    
}
