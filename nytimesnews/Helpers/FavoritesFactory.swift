//
//  FavoritesFactory.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//

import UIKit
import CoreData

class FavoritesFactory: NSObject {
    
    static func createFavoriteFrom(news: News, in context: NSManagedObjectContext) {
        let favorite: Favorite = Favorite(context: context)
        favorite.newsID = Int64(news.id)
        favorite.newsUrl = news.url
        favorite.newsAuthor = news.author
        favorite.newsAbstract = news.abstract
        favorite.newsTitle = news.title
        favorite.newsPublishedAt = DateHelper.shared.dateFormatterDay.date(from: news.publishedAt) ?? Date()
    }

}
