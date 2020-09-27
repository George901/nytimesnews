//
//  NewsDetailedController.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 25.09.2020.
//

import UIKit
import WebKit

class NewsDetailedController: BaseController {
    
    var presenter: NewsDetailPresenter!
    
    @IBOutlet private weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        webView.load(URLRequest(url: URL(string: presenter.detailedNews.url)!))
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: barButton())
    }
    
    private func barButton() -> UIButton {
        let button: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        button.setImage(UIImage(named: "star"), for: .normal)
        button.setImage(UIImage(named: "star.filled"), for: .selected)
        button.isSelected = presenter.isFavorite()
        button.addTarget(self, action: #selector(favoriteButtonPressed(_:)), for: .touchUpInside)
        return button
    }
    
    @objc private func favoriteButtonPressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.isSelected ? presenter.addToFavorites() : presenter.removeFromFavorites()
    }

}
