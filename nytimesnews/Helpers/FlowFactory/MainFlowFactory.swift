//
//  FlowFactory.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 27.09.2020.
//

import UIKit

protocol MainFlowProtocol: NSObjectProtocol {
    func createMainFlow(parentCoordinator: Coordinator) -> TabBarController
}

class MainFlowFactory: NSObject, MainFlowProtocol {
    
    func createMainFlow(parentCoordinator: Coordinator) -> TabBarController {
        let tabbarVC: TabBarController = TabBarController.instantiateFromStoryboard(named: "Tabbar", storyboardIdentifier: "TabBarController")
        let coordinator: MainCoordinator = createMainCoordinator(parent: parentCoordinator)
        let presenter = TabBarPresenter(coordinator: coordinator, view: tabbarVC)
        tabbarVC.presenter = presenter
        return tabbarVC
    }
    
    private func createMainCoordinator(parent: Coordinator) -> MainCoordinator {
        let coordinator = MainCoordinator(factory: TabBarFlowFactory())
        coordinator.parentCoordinator = parent
        parent.childCoordinators.append(coordinator)
        return coordinator
    }

}
