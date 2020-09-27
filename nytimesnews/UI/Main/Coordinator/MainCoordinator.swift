//
//  MainCoordinator.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//

import UIKit

class MainCoordinator: NSObject, Coordinator {
    
    unowned var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    private let factory: TabBarFlowProtocol
    
    init(factory: TabBarFlowProtocol) {
        self.factory = factory
        super.init()
    }
    
    func startFlow() {
        
    }
    
    func createMostEmailedFlow() -> UIViewController {
        let vc = factory.createMostEmailedFlow(parentCoordinator: self)
        vc.tabBarItem = UITabBarItem(title: "Most Emailed", image: UIImage(named: "most-emailed"), selectedImage: nil)
        return vc
    }
    
    func createMostSharedFlow() -> UIViewController {
        let vc = factory.createMostSharedFlow(parentCoordinator: self)
        vc.tabBarItem = UITabBarItem(title: "Most Shared", image: UIImage(named: "most-shared"), selectedImage: nil)
        return vc
    }
    
    func createMostViewedFlow() -> UIViewController {
        let vc = factory.createMostViewedFlow(parentCoordinator: self)
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 2)
        return vc
    }
    
    func createFavoritesFlow() -> UIViewController {
        let vc = factory.createFavoritesFlow(parentCoordinator: self)
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 2)
        return vc
    }
    
    
    
}
