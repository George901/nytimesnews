//
//  Storyboarded.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//

import UIKit

protocol Storyboarded: NSObjectProtocol {
    static func instantiateFromStoryboard(named sbName: String, storyboardIdentifier: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiateFromStoryboard(named sbName: String, storyboardIdentifier: String) -> Self {
        let storyboard = UIStoryboard(name: sbName, bundle: Bundle.main)
        return storyboard.instantiateViewController(identifier: storyboardIdentifier)
    }
    
}
