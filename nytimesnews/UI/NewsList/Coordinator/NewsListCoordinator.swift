//
//  NewsListCoordinator.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//

import UIKit

class NewsListCoordinator: NSObject, Coordinator {
    
    unowned var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }
    
    func startFlow(with initialController: UIViewController) {
        
    }
    
}
