//
//  ViewController.swift
//  homework-4
//
//  Created by Денис Гынгазов on 06.11.2020.
//

import UIKit

class DetailViewController: UIViewController {

// MARK: - View

	private let scrollView = UIScrollView()
	private let descriptionLabel = UILabel()
	private let firstImage = RoundedShadowImageView()
	private let secondImage = RoundedShadowImageView()

// MARK: - Property

	private var desctiptionText: String
	private enum Fonts {
		static let descriptionFont = UIFont.italicSystemFont(ofSize: 15)
	}

// MARK: - Life Сycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationController?.navigationBar.prefersLargeTitles = true

		setupViewsApperance()
		setupViewLayout()
		descriptionLabel.text = desctiptionText
	}

	init(descriptionText: String = "") {
		self.desctiptionText = descriptionText
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}

// MARK: - Apperance

private extension DetailViewController {
	func setupViewsApperance() {
		view.backgroundColor = .white
		setupDescriptionLabelApperance()
		setupFirstImageApperance()
		setupSecondImageApperance()
	}

	func setupDescriptionLabelApperance() {
		descriptionLabel.font = Fonts.descriptionFont
		descriptionLabel.numberOfLines = 0
	}

	func setupFirstImageApperance() {
		firstImage.image = UIImage(named: Images.firsImage.rawValue)
		firstImage.cornerRadius = 10
	}

	func setupSecondImageApperance() {
		secondImage.image = UIImage(named: Images.secondImage.rawValue)
		firstImage.cornerRadius = 10
	}
}
 // MARK: - Layout

private extension DetailViewController {
	func setupViewLayout() {
		setupScrollViewLayout()
		setupDescriptionLabelLayout()
		setupFirstImageViewLayout()
		setupSecondImageViewLayout()
	}

	func setupScrollViewLayout() {
		view.addSubview(scrollView)
		scrollView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
		])
	}

	func setupDescriptionLabelLayout() {
		scrollView.addSubview(descriptionLabel)
		descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			descriptionLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
			descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
			descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
		])
	}

	func setupFirstImageViewLayout() {
		scrollView.addSubview(firstImage)
		firstImage.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			firstImage.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
			firstImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
			firstImage.widthAnchor.constraint(equalToConstant: 300),
			firstImage.heightAnchor.constraint(equalToConstant: 300),
		])
	}

	func setupSecondImageViewLayout() {
		scrollView.addSubview(secondImage)
		secondImage.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			secondImage.topAnchor.constraint(equalTo: firstImage.bottomAnchor, constant: 10),
			secondImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
			secondImage.widthAnchor.constraint(equalToConstant: 300),
			secondImage.heightAnchor.constraint(equalToConstant: 300),
			secondImage.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
		])
	}
}





