//
//  TabBarFlowFactory.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 27.09.2020.
//

import UIKit

protocol TabBarFlowProtocol: NSObjectProtocol {
    func createMostEmailedFlow(parentCoordinator: Coordinator) -> UINavigationController
    func createMostViewedFlow(parentCoordinator: Coordinator) -> UINavigationController
    func createMostSharedFlow(parentCoordinator: Coordinator) -> UINavigationController
    func createFavoritesFlow(parentCoordinator: Coordinator) -> UINavigationController
}

class TabBarFlowFactory: NSObject, TabBarFlowProtocol {
    
    func createMostEmailedFlow(parentCoordinator: Coordinator) -> UINavigationController {
        return createNewsListFlow(api: MostEmailedClient(), parentCoordinator: parentCoordinator)
    }
    
    func createMostViewedFlow(parentCoordinator: Coordinator) -> UINavigationController {
        return createNewsListFlow(api: MostViewedClient(), parentCoordinator: parentCoordinator)
    }
    
    func createMostSharedFlow(parentCoordinator: Coordinator) -> UINavigationController {
        return createNewsListFlow(api: MostSharedClient(), parentCoordinator: parentCoordinator)
    }
    
    func createFavoritesFlow(parentCoordinator: Coordinator) -> UINavigationController {
        return createFavoritesListFlow(parent: parentCoordinator)
    }
    
    private func listCoordinator(parent: Coordinator, navigationController: UINavigationController) -> NewsListCoordinator {
        let coordinator: NewsListCoordinator = NewsListCoordinator(navigationController: navigationController)
        coordinator.parentCoordinator = parent
        parent.childCoordinators.append(coordinator)
        return coordinator
    }

    private func createNewsListFlow(api: NewsApi, parentCoordinator: Coordinator) -> UINavigationController {
        let presenter: NewsListPresenter = NewsListPresenter(api: api, database: DatabaseClient.shared)
        let navigationVC: UINavigationController = UINavigationController(rootViewController: newsListController(presenter: presenter))
        let coordinator: NewsListCoordinator = listCoordinator(parent: parentCoordinator, navigationController: navigationVC)
        presenter.coordinator = coordinator
        return navigationVC
    }
    
    private func newsListController(presenter: NewsListPresenter) -> NewsListController {
        let controller = NewsListController.instantiateFromStoryboard(named: "NewsList", storyboardIdentifier: "NewsListController")
        presenter.view = controller
        controller.presenter = presenter
        return controller
    }
    
    private func createFavoritesListFlow(parent: Coordinator) -> UINavigationController {
        let presenter: FavoritesPresenter = FavoritesPresenter(database: DatabaseClient.shared)
        let navigationVC: UINavigationController = UINavigationController(rootViewController: favoritesController(presenter: presenter))
        let coordinator: NewsListCoordinator = listCoordinator(parent: parent, navigationController: navigationVC)
        presenter.coordinator = coordinator
        return navigationVC
    }
    
    private func favoritesController(presenter: FavoritesPresenter) -> FavoritesController {
        let controller = FavoritesController.instantiateFromStoryboard(named: "Favorites", storyboardIdentifier: "FavoritesController")
        presenter.view = controller
        controller.presenter = presenter
        return controller
    }

}
