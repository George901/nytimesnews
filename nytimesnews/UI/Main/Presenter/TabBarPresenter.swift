//
//  TabBarPresenter.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//

import UIKit

protocol TabPresenter: NSObjectProtocol {
    func mostEmailedController() -> UIViewController
    func mostViewedController() -> UIViewController
    func mostSharedController() -> UIViewController
    func favoritesController() -> UIViewController
}

class TabBarPresenter: NSObject, TabPresenter {

    private var coordinator: MainCoordinator
    private weak var view: TabBarView?
    
    init(coordinator: MainCoordinator, view: TabBarView) {
        self.coordinator = coordinator
        self.view = view
        super.init()
    }
    
    func mostEmailedController() -> UIViewController {
        return coordinator.createMostEmailedFlow()
    }
    
    func mostViewedController() -> UIViewController {
        return coordinator.createMostViewedFlow()
    }
    
    func mostSharedController() -> UIViewController {
        return coordinator.createMostSharedFlow()
    }
    
    func favoritesController() -> UIViewController {
        return coordinator.createFavoritesFlow()
    }
    
}
