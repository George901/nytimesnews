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
    
    func startFlow(with initialController: UIViewController) {
        let controller = initialController as! TabBarController
        let presenter = TabBarPresenter(coordinator: createMainCoordinator(), view: controller)
        controller.presenter = presenter
        navigationController.pushViewController(controller, animated: false)
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
