//
//  NewsApi.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//

import Foundation

protocol NewsApi: NSObjectProtocol {
    var path: String { get set }
    func loadNews(onSuccess: SuccessBlock<[News]>?, onError: ErrorBlock?)
}

extension NewsApi {
    func loadNews(onSuccess: SuccessBlock<[News]>?, onError: ErrorBlock?) {
        APIClient.shared
            .request(path,
                     method: .get,
                     parameters: ["api-key" : ApiParams.apiKey],
                     headers: nil,
                     onSuccess: { (json) in
                        if let data = json {
                            JsonParser(json: data["results"]).parseArray(mappable: NYTNews.self,
                                                              onSuccess: onSuccess,
                                                              onError: onError)
                        } else {
                            onSuccess?([])
                        }
                     },
                     onError: onError)
    }
}
