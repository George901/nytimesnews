//
//  MostEmailedClient.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//

import UIKit

class MostEmailedClient: NSObject, NewsApi {
    var path: String = "https://api.nytimes.com/svc/mostpopular/v2/emailed/\(ApiParams.period).json"
}
