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
    // MARK: - Properties
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 20, height: 30))
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.enablesReturnKeyAutomatically = true
        searchBar.delegate = self
        searchBar.backgroundColor = .gray
        searchBar.searchBarStyle = .prominent
        return searchBar
    }()
    private lazy var displayLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width - 20, height: 30))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkText
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Search Movies"

        view.addSubview(searchBar)
        view.addSubview(displayLabel)

        setUpConstraints()
    }

    // MARK: - View Setup
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            searchBar.rightAnchor.constraint(equalTo: view.rightAnchor),
            displayLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16),
            displayLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            displayLabel.rightAnchor.constraint(equalTo: view.rightAnchor)
            ])
    }
}

// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let presenter = MainPresenter(view: self, uiContext: UI())
        presenter.search(queryString: searchBar.text ?? "")
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            displayLabel.text = ""
        }
    }
}

// MARK: - MainView
extension SearchViewController: MainView {
    func showError(error: KotlinThrowable) {
        print("error: \(error.message ?? "")")
    }

    func showMovie(displayText: String) {
        displayLabel.text = displayText
    }
}
