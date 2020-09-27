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
    
    private var window: UIWindow?
    private let factory: MainFlowProtocol
    
    init(window: UIWindow?,
         factory: MainFlowProtocol) {
        self.window = window
        self.factory = factory
        super.init()
    }
    
    func startFlow() {
        window?.rootViewController = factory.createMainFlow(parentCoordinator: self)
        window?.makeKeyAndVisible()
    }

}
