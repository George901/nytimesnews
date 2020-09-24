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
        
    }

}
