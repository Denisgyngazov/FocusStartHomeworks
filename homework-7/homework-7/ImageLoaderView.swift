//
//  ImageLoaderView.swift
//  homework-7
//
//  Created by Денис Гынгазов on 02.12.2020.
//

import UIKit

final class ImageLoaderView: UIView {
	// MARK: - View

	private let searchBar = UISearchBar()
	private let tableView = UITableView()
	private let searchButton = UIButton()

	private var tableViewDataSource: TableViewDataSource?
	private var tableViewDelegate: TableViewDelegate?


	private var image = [URL]()


	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .systemBackground
		tableView.register(ImageLoaderCell.self, forCellReuseIdentifier: ImageLoaderCell.identifaer)
		
		setupViewAppearance()
		setupViewLayout()

		searchButton.addTarget(self, action: #selector(press), for: .touchUpInside)

		self.tableViewDelegate = TableViewDelegate()
		self.tableViewDataSource = TableViewDataSource(withData: image)

		self.tableView.delegate = self.tableViewDelegate
		self.tableView.dataSource = self.tableViewDataSource
		tableView.reloadData()

	}

	@objc func press() {
		if let searchBarText = searchBar.text {
			if let urlImage = URL(string: searchBarText) {
				image.append(urlImage)
				tableView.reloadData()
			}
			else {
			   print("Пусто")
		   }
		}
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Appearance

private extension ImageLoaderView {
	func setupViewAppearance() {
		setupSearchBarAppearance()
		setupTableViewAppearance()
		setupSearchButtonApperance()
	}

	func setupSearchBarAppearance() {
		searchBar.placeholder = "Введите URL"
	}

	func setupTableViewAppearance() {
		tableView.tableFooterView = UIView()
	}

	func setupSearchButtonApperance() {
		searchButton.setTitle("load", for: .normal)
		searchButton.setTitleColor(.blue, for: .normal)
	}
}

// MARK: - Layouts

private extension ImageLoaderView {
	func setupViewLayout() {
		setupSearchBarLayout()
		setupTableViewLayout()
		setupSearchButtonLayout()
	}

	func setupSearchBarLayout() {
		self.addSubview(searchBar)
		searchBar.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			searchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			searchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -50),
		])
	}

	func setupTableViewLayout() {
		self.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
			tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
			tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
		])
	}

	func setupSearchButtonLayout() {
		self.addSubview(searchButton)
		searchButton.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			searchButton.widthAnchor.constraint(equalToConstant: 50),
			searchButton.heightAnchor.constraint(equalToConstant: 50),
			searchButton.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
			searchButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10)

		])

	}
}
