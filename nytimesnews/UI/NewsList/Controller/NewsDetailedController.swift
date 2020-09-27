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
        title = presenter.detailedNews.title
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let button = barButton()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    private func barButton() -> UIButton {
        let button: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.setImage(UIImage(systemName: "star.fill"), for: .selected)
        button.isSelected = presenter.isFavorite()
        button.addTarget(self, action: #selector(favoriteButtonPressed(_:)), for: .touchUpInside)
        return button
    }
    
    @objc private func favoriteButtonPressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.isSelected ? presenter.addToFavorites() : presenter.removeFromFavorites()
    }

}
