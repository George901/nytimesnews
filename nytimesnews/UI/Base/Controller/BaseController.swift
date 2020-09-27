//
//  BaseController.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 27.09.2020.
//

import UIKit

class BaseController: UIViewController, Storyboarded {

    deinit {
        print("--------- DEINIT \(self) ---------")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
