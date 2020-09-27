//
//  MostViewedClient.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//

import UIKit

class MostViewedClient: NSObject, StoriesApi {
    
    var path = "https://api.nytimes.com/svc/mostpopular/v2/viewed/\(ApiParams.period).json"
    
}
