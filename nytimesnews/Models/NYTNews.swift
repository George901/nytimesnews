//
//  NYTNews.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//

import UIKit
import ObjectMapper

class NYTNews: NSObject, Mappable {
    
    var newsID: Int = 0
    var newsPublishedAt: Date = Date()
    var newsTitle: String = ""
    var newsAbstract: String = ""
    var newsAuthor: String = ""
    var newsUrl: String = ""
    
    private let transform = TransformOf<Date, String>(fromJSON: {(str) -> Date? in
        if let string = str {
            return DateHelper.shared.dateFormatterDay.date(from: string)
        } else {
            return Date()
        }
    }, toJSON: {(date) -> String? in
        if let date = date {
            return DateHelper.shared.dateFormatterDay.string(from: date)
        } else {
            return ""
        }
    })
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        newsID          <- map["id"]
        newsPublishedAt <- (map["published_date"], transform)
        newsAuthor      <- map["byline"]
        newsTitle       <- map["title"]
        newsAbstract    <- map["abstract"]
        newsUrl         <- map["url"]
        
    }
    
}

extension NYTNews: News {
    
    var id: Int {
        return newsID
    }
    
    var title: String {
        return newsTitle
    }
    
    var abstract: String {
        return newsAbstract
    }
    
    var publishedAt: String {
        return DateHelper.shared.dateFormatterDay.string(from: newsPublishedAt)
    }
    
    var author: String {
        return newsAuthor
    }
    
}
