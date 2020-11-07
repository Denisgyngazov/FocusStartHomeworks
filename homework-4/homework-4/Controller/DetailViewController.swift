//
//  ViewController.swift
//  homework-4
//
//  Created by Денис Гынгазов on 06.11.2020.
//

import UIKit

class DetailViewController: UIViewController {
	var descriptionLabel = UILabel()

	private enum Fonts {
		static let descriptionFont = UIFont.italicSystemFont(ofSize: 15)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationController?.navigationBar.prefersLargeTitles = true

		setupViewsApperance()
		setupViewLayout()
	}

	func configure(text: String) {
		descriptionLabel.text = text
	}
}

// MARK: - Apperance

private extension DetailViewController {
	func setupViewsApperance() {
		view.backgroundColor = .white
		setupDescriptionLabel()
	}

	func setupDescriptionLabel() {
		descriptionLabel.font = Fonts.descriptionFont
		descriptionLabel.numberOfLines = 0
	}
	

}
 // MARK: - Layout
private extension DetailViewController {
	func setupViewLayout() {
		setupDescriptionLabel()
	}

	func setupDescriptionLabelLayout() {
		view.addSubview(descriptionLabel)
		descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
			//descriptionLabel.widthAnchor.constraint(equalToConstant: 15),
			descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
			descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 10)
		])
	}
}




