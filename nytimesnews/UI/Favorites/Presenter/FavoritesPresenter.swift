//
//  FavoritesPresenter.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 25.09.2020.
//

import UIKit

class FavoritesPresenter: NSObject, StoriesPresenter {
  
    var stories: [Story] = []
    var coordinator: NewsListCoordinator!
    weak var view: NewsListView!
    
    private let database: Database
    
    init(database: Database) {
        self.database = database
        super.init()
    }
    
    func getStories() {
        stories = database.fetchFavorites()
        view.update()
    }
    
    func addToFavorites(story: Story) {}
    
    func removeFromFavorites(story: Story) {
        self.stories.removeAll(where: {$0.id == story.id})
        database.removeFromFavorite(story: story)
    }
    
    func isFavorite(story: Story) -> Bool {
        return true
    }
    
    func showDetailed(story: Story) {
        coordinator.showDetailed(news: story)
    }
    
    

}
