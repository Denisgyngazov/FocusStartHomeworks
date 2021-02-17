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

	// MARK: - Property
	
	 private var images = [UIImage]()

	

	// MARK: - Constants

	private enum Constants {
		static let heightCell: CGFloat = 150
		static let searchBarTrailingAnchor : CGFloat = 50
		static let searchButtonWidth: CGFloat = 50
		static let searchButtonHeight: CGFloat = 50
		static let searchButtonTrailingAnchor: CGFloat = 5

		static let placeholderSearchBar: String = "Enter URL"
		static let searchButtonTitle: String = "Load"
	}

	// MARK: - Init

	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .systemBackground
		tableView.register(ImageLoaderCell.self, forCellReuseIdentifier: ImageLoaderCell.identifaer)

		self.searchButton.addTarget(self, action: #selector(loadImage), for: .touchUpInside)

		setupViewAppearance()
		setupViewLayout()

		tableView.dataSource = self
		tableView.delegate = self
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

	// MARK: - DataSource

extension ImageLoaderView: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return self.images.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageLoaderCell.identifaer, for: indexPath) as? ImageLoaderCell
		else { return UITableViewCell() }
		
		cell.configure(image: images[indexPath.row])

		return cell
	}
}

// MARK: - Delegete

extension ImageLoaderView: UITableViewDelegate {

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return Constants.heightCell
	}
}

// MARK: - Network

private extension ImageLoaderView {
	@objc func loadImage() {
		let imageUrl = searchBar.searchTextField.text ?? ""

		guard let url = URL(string: imageUrl) else {
			self.showErrorLoadImage(title: "Ошибка", body: "Неокректный URL")
			return
		}

		let session = URLSession.shared

		session.dataTask(with: url) { (data, responce, error) in
			if error != nil {
				self.showErrorLoadImage(title: "Ошибка", body: "Несмогли загрузить")

			}

			if let data = data, let image = UIImage(data: data) {
					self.images.append(image)
					self.tableView.reloadData()
			}
		}.resume()
	}
}


private extension ImageLoaderView {
	func showErrorLoadImage(title: String, body: String) {
		let alertController = UIAlertController(title: title, message: body, preferredStyle: .alert)
		let action = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
		}

		alertController.addAction(action)
		findViewController()?.present(alertController, animated: true)
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
		searchBar.placeholder = Constants.placeholderSearchBar
	}

	func setupTableViewAppearance() {
		tableView.tableFooterView = UIView()
	}

	func setupSearchButtonApperance() {
		searchButton.setTitle(Constants.searchButtonTitle, for: .normal)
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
			searchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
												constant: -Constants.searchBarTrailingAnchor),
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
			searchButton.widthAnchor.constraint(equalToConstant: Constants.searchButtonHeight),
			searchButton.heightAnchor.constraint(equalToConstant: Constants.searchButtonWidth),
			searchButton.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
			searchButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
												   constant: -Constants.searchButtonTrailingAnchor)
		])
	}
}

