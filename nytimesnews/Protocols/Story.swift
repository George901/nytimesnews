//
//  File.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//

import Foundation

protocol Story: NSObjectProtocol {
    var id: Int { get }
    var title: String { get }
    var abstract: String { get }
    var publishedAt: String { get }
    var author: String { get }
    var url: String { get }
}
