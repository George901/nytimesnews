//
//  NewsListPresenter.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//

import UIKit

protocol NewsPresenter: NSObjectProtocol {
    
}

class NewsListPresenter: NSObject, NewsPresenter {
    
    weak var view: NewsListView!
    
}
