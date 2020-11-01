//
//  ViewController.swift
//  homework-3
//
//  Created by Денис Гынгазов on 30.10.2020.
//

import UIKit

class ViewController: UIViewController {

// MARK: - Property
	
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
		self.navigationItem.title = "Первый экран"
		tabBarItem = UITabBarItem(title: "Первый экран", image: .checkmark, tag: 0)
		self.tabBarItem = tabBarItem
	}

	func setupFirstLabelApperance() {
		firstLabel.text = "FirstLabel"
		firstLabel.textColor = .white
		view.addSubview(firstLabel)
	}

	func setupSecondLabelApperance() {
		secondLabel.text = "SecondLabel"
		secondLabel.font = UIFont.boldSystemFont(ofSize: 20)
		secondLabel.textColor = .white
		view.addSubview(secondLabel)
	}

	func setupThirdLabelApperance() {
		thirdLabel.text = "ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel,ThirdLabel"
		thirdLabel.font = UIFont.italicSystemFont(ofSize: 23)
		thirdLabel.numberOfLines = 2
		thirdLabel.textColor = .white
		view.addSubview(thirdLabel)
	}

	func setupFirstButtonApperance() {
		firstButton = UIButton(type: .roundedRect)
		firstButton.setTitle("Press", for: .normal)
		firstButton.layer.cornerRadius = 25
		firstButton.clipsToBounds = true
		firstButton.backgroundColor = .darkGray
		view.addSubview(firstButton)
	}

	func setupSecondButtonApperance() {
		secondButton = UIButton(type: .roundedRect)
		secondButton.setTitle("Press", for: .normal)
		secondButton.layer.cornerRadius = 8
		secondButton.clipsToBounds = true
		secondButton.backgroundColor = .darkGray
		view.addSubview(secondButton)
	}

	func setupImmageViewApperance() {
		imageView.image = UIImage(named: "Безмятежность")
		view.addSubview(imageView)
	}

	func setupActivityIndicatorApperance() {
		activityIndicator.startAnimating()
		activityIndicator.color = .black
		activityIndicator.style = .large
		view.addSubview(activityIndicator)
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
		setupConstr()
	}

	func setupFirstLabelLayout() {
		firstLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			firstLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
			firstLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
		])
	}

	func setupSecondLabelLayout() {
		secondLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			secondLabel.topAnchor.constraint(equalTo: firstLabel.topAnchor, constant: 50),
			secondLabel.centerXAnchor.constraint(equalTo: firstLabel.centerXAnchor)
		])
	}

	func setupThirdLabelLayout() {
		thirdLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			thirdLabel.topAnchor.constraint(equalTo: secondLabel.topAnchor, constant: 50),
			thirdLabel.centerXAnchor.constraint(equalTo: secondLabel.centerXAnchor),
			thirdLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2)
		])
	}

	func setupFirstButtonLayout() {
		firstButton.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			firstButton.topAnchor.constraint(equalTo: thirdLabel.topAnchor, constant: 80),
			firstButton.centerXAnchor.constraint(equalTo: thirdLabel.centerXAnchor),
			firstButton.widthAnchor.constraint(equalToConstant: 50),
			firstButton.heightAnchor.constraint(equalToConstant: 50)
		])
	}

	func setupSecondButtonLayout() {
		secondButton.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			secondButton.topAnchor.constraint(equalTo: firstButton.topAnchor, constant: 80),
			secondButton.centerXAnchor.constraint(equalTo: firstButton.centerXAnchor),
			secondButton.widthAnchor.constraint(equalToConstant: 200),
			secondButton.heightAnchor.constraint(equalToConstant: 50)
		])
	}

	func setupFirstImageLayout() {
		imageView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: secondButton.topAnchor,constant: 80),
			imageView.centerXAnchor.constraint(equalTo: secondButton.centerXAnchor),
			imageView.widthAnchor.constraint(equalTo: secondButton.widthAnchor),
			imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
		])
	}

	func setupConstr() {
		activityIndicator.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			activityIndicator.topAnchor.constraint(equalTo: imageView.topAnchor),
			activityIndicator.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
			activityIndicator.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
		])
	}
}


















