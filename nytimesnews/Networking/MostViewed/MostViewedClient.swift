//
//  MostViewedClient.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//

import UIKit

class MostViewedClient: NSObject, NewsApi {
    
    var path = "https://api.nytimes.com/svc/mostpopular/v2/viewed/\(ApiParams.period).json"
    
//    func loadNews(onSuccess: SuccessBlock<[News]>?, onError: ErrorBlock?) {
//        APIClient.shared
//            .request(path,
//                     method: .get,
//                     parameters: ["key" : ApiParams.apiKey],
//                     headers: nil,
//                     onSuccess: { (json) in
//                        if let data = json {
//                            JsonParser(json: data).parseArray(mappable: NYTNews.self,
//                                                              onSuccess: onSuccess,
//                                                              onError: onError)
//                        } else {
//                            onSuccess?([])
//                        }
//                     },
//                     onError: onError)
//    }
    
}
