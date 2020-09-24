//
//  Favorite+CoreDataProperties.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//
//

import Foundation
import CoreData


extension Favorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorite> {
        return NSFetchRequest<Favorite>(entityName: "Favorite")
    }

    @NSManaged public var newsID: Int64
    @NSManaged public var newsPublishedAt: Date
    @NSManaged public var newsTitle: String
    @NSManaged public var newsAbstract: String
    @NSManaged public var newsAuthor: String
    @NSManaged public var newsUrl: String

}

extension Favorite: News {

    var id: Int {
        return Int(newsID)
    }
    
    var title: String {
        return newsTitle
    }
    
    var abstract: String {
        return newsAbstract
    }
    
    var publishedAt: String {
        return ""
    }
    
    var author: String {
        return newsAuthor
    }
    
}

