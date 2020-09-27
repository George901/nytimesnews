//
//  BaseController.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 27.09.2020.
//

import UIKit
import ProgressHUD

class BaseController: UIViewController, Storyboarded {

    deinit {
        print("--------- DEINIT \(self) ---------")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func showActivityIndicator() {
        ProgressHUD.show()
    }
    
    func hideActivityIndicator() {
        ProgressHUD.dismiss()
    }
    
    func showAlertWith(error: Error) {
        let alertVC: UIAlertController = UIAlertController(title: "Something went wrong", message: error.localizedDescription, preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default) { (_) in
            alertVC.dismiss(animated: true, completion: nil)
        }
//        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
    }
    
}
