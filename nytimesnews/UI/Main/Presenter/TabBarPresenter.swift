//
//  TabBarPresenter.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//

import Foundation

protocol TabPresenter: NSObjectProtocol {
    
}

class TabBarPresenter: NSObject, TabPresenter {

    private var coordinator: MainCoordinator
    private weak var view: TabBarView?
    
    init(coordinator: MainCoordinator, view: TabBarView) {
        self.coordinator = coordinator
        self.view = view
        super.init()
    }
    
}
