//
//  NewsListPresenter.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//

import UIKit

protocol StoriesPresenter: NSObjectProtocol {
    var stories: [Story] { get set }
    func getStories()
    func addToFavorites(story: Story)
    func removeFromFavorites(story: Story)
    func isFavorite(story: Story) -> Bool
    func showDetailed(story: Story)
}

class NewsListPresenter: NSObject, StoriesPresenter {
    
    var stories: [Story] = []
    var coordinator: NewsListCoordinator!
    weak var view: NewsListView!
    
    private let api: StoriesApi
    private let database: Database
    
    init(api: StoriesApi, database: Database) {
        self.api = api
        self.database = database
        super.init()
    }
    
    func getStories() {
        view.showActivity()
        api.loadNews { [weak self] (news) in
            self?.view.hideActivity()
            self?.handleLoaded(news: news)
        } onError: { [weak self] (error) in
            self?.view.hideActivity()
            self?.handle(error: error)
        }

    }
    
    func addToFavorites(story: Story) {
        database.addToFavorite(story: story)
    }
    
    func removeFromFavorites(story: Story) {
        database.removeFromFavorite(story: story)
    }
    
    func isFavorite(story: Story) -> Bool {
        return database.isFavorite(story: story)
    }
    
    func showDetailed(story: Story) {
        coordinator.showDetailed(news: story)
    }
    
    private func handleLoaded(news: [Story]?) {
        if let news = news {
            self.stories = news
        }
        view.update()
    }
    
    private func handle(error: Error?) {
        if let err = error {
            view.show(error: err)
        }
    }
    
}
