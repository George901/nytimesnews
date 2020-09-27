//
//  TabBarController.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//

import UIKit

protocol TabBarView: NSObjectProtocol {
    
}

class TabBarController: UITabBarController, Storyboarded, TabBarView {

    var presenter: TabPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
//        selectedViewController = viewControllers?[0]
        selectedIndex = 0
    }
    
    private func setupControllers() {
        viewControllers = createControllers()
    }
    
    private func setupTabs() {
        
    }
    
    private func createTabs() {
        
    }
    
    private func createControllers() -> [UIViewController] {
        var controllers: [UIViewController] = [UIViewController]()
        controllers.append(presenter.mostEmailedController())
        controllers.append(presenter.mostSharedController())
        controllers.append(presenter.mostViewedController())
        controllers.append(presenter.favoritesController())
        return controllers
    }

}


