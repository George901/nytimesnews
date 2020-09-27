//
//  MostSharedClient.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//

import UIKit

class MostSharedClient: NSObject, StoriesApi {
    
    var path: String = "https://api.nytimes.com/svc/mostpopular/v2/shared/\(ApiParams.period).json"
    
}
