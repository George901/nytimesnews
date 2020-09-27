//
//  AppCoordinator.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//

import UIKit

class AppCoordinator: NSObject, Coordinator {
    
    var parentCoordinator: Coordinator? = nil
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    var window: UIWindow?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }
    
    func createMainFlow() {
        let tabbarVC: TabBarController = navigationController.viewControllers[0] as! TabBarController
        let coordinator: MainCoordinator = createMainCoordinator()
        let presenter = TabBarPresenter(coordinator: coordinator, view: tabbarVC)
        tabbarVC.presenter = presenter
        navigationController.isNavigationBarHidden = true
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    private func createMainCoordinator() -> MainCoordinator {
        let coordinator = MainCoordinator(navigationController: navigationController)
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        return coordinator
    }
    

}
