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

	private var tableViewDataSource: TableViewDataSource?
	private var tableViewDelegate: TableViewDelegate?

	private var image = [URL]()


	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .systemBackground
		tableView.register(ImageLoaderCell.self, forCellReuseIdentifier: ImageLoaderCell.identifaer)
		
		setupViewAppearance()
		setupViewLayout()



		self.tableViewDelegate = TableViewDelegate()
		self.tableViewDataSource = TableViewDataSource(withData: image)

		self.tableView.delegate = self.tableViewDelegate
		self.tableView.dataSource = self.tableViewDataSource

	}

//	@objc func press() {
//		if let searchBarText = searchBar.text {
//			if let urlImage = URL(string: searchBarText) {
//				image.append(urlImage)
//				tableView.reloadData()
//			}
//		}
//	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Appearance

private extension ImageLoaderView {
	func setupViewAppearance() {
		setupSearchBarAppearance()
		setupTableViewAppearance()
	}

	func setupSearchBarAppearance() {
		searchBar.placeholder = "Введите URL"
	}

	func setupTableViewAppearance() {
		tableView.tableFooterView = UIView()
	}
}

// MARK: - Layouts

private extension ImageLoaderView {
	func setupViewLayout() {
		setupSearchBarLayout()
		setupTableViewLayout()
	}

	func setupSearchBarLayout() {
		self.addSubview(searchBar)
		searchBar.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			searchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			searchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
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
}
