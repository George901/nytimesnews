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
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }
    
    func startFlow(with initialController: UIViewController) {
        navigationController.pushViewController(initialController, animated: true)
    }
    
    func createMostEmailedFlow() -> UIViewController {
        let vc = createNewsListFlow(api: MostEmailedClient())
        vc.tabBarItem = UITabBarItem(title: "Most Emailed", image: UIImage(named: "most-emailed"), selectedImage: nil)
        return vc
    }
    
    func createMostSharedFlow() -> UIViewController {
        let vc = createNewsListFlow(api: MostSharedClient())
        vc.tabBarItem = UITabBarItem(title: "Most Shared", image: UIImage(named: "most-shared"), selectedImage: nil)
        return vc
    }
    
    func createMostViewedFlow() -> UIViewController {
        let vc = createNewsListFlow(api: MostViewedClient())
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 2)
        return vc
    }
    
    func createFavoritesFlow() -> UIViewController {
        let vc = createFavoritesListFlow()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 2)
        return vc
    }
    
    private func newsListController(presenter: NewsListPresenter) -> NewsListController {
        let controller = NewsListController.instantiateFromStoryboard(named: "NewsList", storyboardIdentifier: "NewsListController")
        presenter.view = controller
        controller.presenter = presenter
        return controller
    }
    
    private func favoritesController(presenter: FavoritesPresenter) -> FavoritesController {
        let controller = FavoritesController.instantiateFromStoryboard(named: "Favorites", storyboardIdentifier: "FavoritesController")
        presenter.view = controller
        controller.presenter = presenter
        return controller
    }
    
    private func listCoordinator() -> NewsListCoordinator {
        let coordinator: NewsListCoordinator = NewsListCoordinator(navigationController: navigationController)
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
        return coordinator
    }
    
    private func createNewsListFlow(api: NewsApi) -> UIViewController {
        let coordinator: NewsListCoordinator = listCoordinator()
        let presenter: NewsListPresenter = NewsListPresenter(api: api, database: DatabaseClient.shared)
        let navigationVC: UINavigationController = UINavigationController(rootViewController: newsListController(presenter: presenter))
        presenter.coordinator = coordinator
        coordinator.startFlow(with: UIViewController())
        return navigationVC
    }
    
    private func createFavoritesListFlow() -> UIViewController {
        let coordinator: NewsListCoordinator = listCoordinator()
        let presenter = FavoritesPresenter(database: DatabaseClient.shared)
        let navigationVC: UINavigationController = UINavigationController(rootViewController: favoritesController(presenter: presenter))
        presenter.coordinator = coordinator
        coordinator.startFlow(with: UIViewController())
        return navigationVC
    }

}
