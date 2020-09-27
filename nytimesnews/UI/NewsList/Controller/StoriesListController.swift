//
//  NewsListController.swift
//  nytimesnews
//
//  Created by Georgiy Farafonov on 24.09.2020.
//

import UIKit

protocol NewsListView: NSObjectProtocol {
    func showActivity()
    func hideActivity()
    func show(error: Error)
    func update()
}

class StoriesListController: BaseController {
    
    var presenter: StoriesPresenter!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getStories()
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: "NewsCell", bundle: Bundle.main), forCellReuseIdentifier: "NewsCell")
    }
    
}

extension StoriesListController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.stories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let news = presenter.stories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        cell.setupWith(news: news, isFavorite: presenter.isFavorite(story: news)) { [weak self] (isAdded) in
            isAdded ? self?.presenter.addToFavorites(story: news) : self?.presenter.removeFromFavorites(story: news)
        }
        return cell
    }
    
}

extension StoriesListController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.showDetailed(story: presenter.stories[indexPath.row])
    }
    
}

extension StoriesListController: NewsListView {
    
    func showActivity() {
        showActivityIndicator()
    }
    
    func hideActivity() {
        hideActivityIndicator()
    }
    
    func show(error: Error) {
        showAlertWith(error: error)
    }
    
    func update() {
        tableView.reloadData()
    }
    
}
