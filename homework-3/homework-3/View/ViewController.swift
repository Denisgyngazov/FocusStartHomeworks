//
//  ViewController.swift
//  homework-3
//
//  Created by Денис Гынгазов on 30.10.2020.
//

import UIKit

class ViewController: UIViewController {

	// MARK: - View
	
	private let firstLabel = UILabel()
	private let secondLabel = UILabel()
	private let thirdLabel = UILabel()
	private var firstButton = UIButton()
	private var secondButton = UIButton()
	private let imageView = UIImageView()
	private let activityIndicator = UIActivityIndicatorView()
	
	// MARK: - Life Сycle

	override func viewDidLoad() {
		super.viewDidLoad()

		setupViewApperance()
		setupViewLayout()
	}
}

// MARK: - Apperance

private extension ViewController {

	func setupViewApperance() {
		setupTabBarItemApperance()
		setupFirstLabelApperance()
		setupSecondLabelApperance()
		setupThirdLabelApperance()
		setupFirstButtonApperance()
		setupSecondButtonApperance()
		setupImmageViewApperance()
		setupActivityIndicatorApperance()
	}

	func setupTabBarItemApperance() {
		var tabBarItem = UITabBarItem()
		view.backgroundColor = .systemBlue
		self.navigationItem.title = NavigationItems.firstScreen.rawValue
		tabBarItem = UITabBarItem(title: TabBarItems.firstScreen.rawValue, image: .checkmark, tag: 0)
		self.tabBarItem = tabBarItem
	}

	func setupFirstLabelApperance() {
		firstLabel.text = Labels.firstLabel.rawValue
		firstLabel.textColor = .white
		view.addSubview(firstLabel)
	}

	func setupSecondLabelApperance() {
		secondLabel.text = Labels.secondLabel.rawValue
		secondLabel.font = UIFont.boldSystemFont(ofSize: 20)
		secondLabel.sizeToFit()
		secondLabel.textColor = .white
	}

	func setupThirdLabelApperance() {
		thirdLabel.text = Labels.thirdLabel.rawValue
		thirdLabel.font = UIFont.italicSystemFont(ofSize: 23)
		thirdLabel.numberOfLines = 2
		thirdLabel.textColor = .white
	}

	func setupFirstButtonApperance() {
		firstButton = UIButton(type: .roundedRect)
		firstButton.setTitle(Buttons.press.rawValue, for: .normal)
		firstButton.layer.cornerRadius = 25
		firstButton.clipsToBounds = true
		firstButton.backgroundColor = .darkGray
	}

	func setupSecondButtonApperance() {
		secondButton = UIButton(type: .roundedRect)
		secondButton.setTitle(Buttons.press.rawValue, for: .normal)
		secondButton.layer.cornerRadius = 8
		secondButton.clipsToBounds = true
		secondButton.backgroundColor = .darkGray
	}

	func setupImmageViewApperance() {
		imageView.image = UIImage(named: Images.serenity.rawValue)
		imageView.contentMode = .scaleAspectFill

	}

	func setupActivityIndicatorApperance() {
		activityIndicator.startAnimating()
		activityIndicator.color = .black
		activityIndicator.style = .large
	}
}

// MARK: - Layout

private extension ViewController {
	
	func setupViewLayout() {
		setupFirstLabelLayout()
		setupSecondLabelLayout()
		setupThirdLabelLayout()
		setupFirstButtonLayout()
		setupSecondButtonLayout()
		setupFirstImageLayout()
		setupActivityIndicatorLayout()
	}

	func setupFirstLabelLayout() {
		view.addSubview(firstLabel)
		firstLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			firstLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
			firstLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
		])
	}

	func setupSecondLabelLayout() {
		view.addSubview(secondLabel)
		secondLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			secondLabel.topAnchor.constraint(equalTo: firstLabel.topAnchor, constant: 50),
			secondLabel.centerXAnchor.constraint(equalTo: firstLabel.centerXAnchor)
		])
	}

	func setupThirdLabelLayout() {
		view.addSubview(thirdLabel)
		thirdLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			thirdLabel.topAnchor.constraint(equalTo: secondLabel.topAnchor, constant: 50),
			thirdLabel.centerXAnchor.constraint(equalTo: secondLabel.centerXAnchor),
			thirdLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2)
		])
	}

	func setupFirstButtonLayout() {
		view.addSubview(firstButton)
		firstButton.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			firstButton.topAnchor.constraint(equalTo: thirdLabel.topAnchor, constant: 80),
			firstButton.centerXAnchor.constraint(equalTo: thirdLabel.centerXAnchor),
			firstButton.widthAnchor.constraint(equalToConstant: 50),
			firstButton.heightAnchor.constraint(equalToConstant: 50)
		])
	}

	func setupSecondButtonLayout() {
		view.addSubview(secondButton)
		secondButton.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			secondButton.topAnchor.constraint(equalTo: firstButton.topAnchor, constant: 80),
			secondButton.centerXAnchor.constraint(equalTo: firstButton.centerXAnchor),
			secondButton.widthAnchor.constraint(equalToConstant: 200),
			secondButton.heightAnchor.constraint(equalToConstant: 50)
		])
	}

	func setupFirstImageLayout() {
		view.addSubview(imageView)
		imageView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: secondButton.topAnchor,constant: 80),
			imageView.centerXAnchor.constraint(equalTo: secondButton.centerXAnchor),
			imageView.widthAnchor.constraint(equalTo: secondButton.widthAnchor),
			imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
		])
	}

	func setupActivityIndicatorLayout() {
		view.addSubview(activityIndicator)
		activityIndicator.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			activityIndicator.topAnchor.constraint(equalTo: imageView.topAnchor),
			activityIndicator.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
			activityIndicator.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
		])
	}
}


















