//
//  AppDelegate.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    private var appCoordinator: AppCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        createCoordinator()
        initDataBase()
        return true
    }
    
    private func createCoordinator() {
        appCoordinator = AppCoordinator(navigationController:
                                            UINavigationController(rootViewController:
                                                                    TabBarController.instantiateFromStoryboard(named: "Tabbar", storyboardIdentifier: "TabBarController")))
        appCoordinator.window = window
        appCoordinator.createMainFlow()
    }
    
    private func initDataBase() {
        DatabaseClient.shared.initializeStorage(CoreDataStorage())
    }


}

