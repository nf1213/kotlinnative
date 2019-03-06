//
//  SearchViewController.swift
//  KotlinNativeiOS
//
//  Created by Rachel Schneebaum on 2/14/19.
//  Copyright © 2019 ovuline. All rights reserved.
//

import UIKit
import main

class SearchViewController: UIViewController {

    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 20, height: 30))
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.enablesReturnKeyAutomatically = true
        searchBar.delegate = self
        searchBar.backgroundColor = .gray
        searchBar.searchBarStyle = .prominent
        return searchBar
    }()
    lazy var displayLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 20, height: 30))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkText
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchBar)
        view.addSubview(displayLabel)

        navigationController?.navigationBar.backgroundColor = UIColor.lightText
        title = "Search Movies"

        setUpConstraints()
    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: searchBar, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: searchBar, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: displayLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: displayLabel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: searchBar, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: displayLabel, attribute: .top, relatedBy: .equal, toItem: searchBar, attribute: .bottom, multiplier: 1, constant: 16)
        ])
    }

}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let presenter = MainPresenter(view: self, uiContext: UI())
        presenter.search(queryString: searchBar.text ?? "")
    }
}

extension SearchViewController: MainView {
    func showError(error: KotlinThrowable) {
        print("error: \(error.message ?? "")")
    }

    func showMovie(displayText: String) {
        displayLabel.text = displayText
    }
}
