//
//  SecondViewController.swift
//  homework-3
//
//  Created by Денис Гынгазов on 30.10.2020.
//

import UIKit

class SecondViewController: UIViewController {

// MARK: - Properties
	
	private var sharedConstraints: [NSLayoutConstraint] = []
	private var compactConstraints: [NSLayoutConstraint] = []
	private var regularConstraints: [NSLayoutConstraint] = []

// MARK: - View

	private let scrollView = UIScrollView()
	private let imageView = UIImageView()
	private let textLabel = UILabel()
	private var titleLabel = UILabel()

// MARK: - Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()

		setupViewApperance()
		setupViewLayout()
		changeviewsLayout(traitCollection: traitCollection)
	}
// MARK: - Changes Cycle

	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)
		changeviewsLayout(traitCollection: traitCollection)
	}
}

// MARK: - Apperance

private extension SecondViewController {

	func setupViewApperance() {
		setupTabBarItemApperance()
		setupImageViewApperance()
		setupTitleLabelApperance()
		setupTextLabelApperance()
	}

	func setupTabBarItemApperance() {
		var tabBarItem = UITabBarItem()
		view.backgroundColor = .systemBlue
		self.navigationItem.title = NavigationItems.secondScreen.rawValue
		tabBarItem = UITabBarItem(title: TabBarItems.secondScreen.rawValue, image: .checkmark, tag: 1)
		self.tabBarItem = tabBarItem
	}

	func setupImageViewApperance() {
		imageView.image = UIImage(named: Images.serenity.rawValue)
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
	}

	func setupTitleLabelApperance() {
		titleLabel.text = Labels.titleLabel.rawValue
		titleLabel.font = UIFont.italicSystemFont(ofSize: 23)
		titleLabel.textAlignment = .center
	}

	func setupTextLabelApperance() {
		textLabel.numberOfLines = 0
		textLabel.text = Labels.textLabel.rawValue
	}
}

// MARK: -  Shared Layout

private extension SecondViewController {
	func changeviewsLayout(traitCollection: UITraitCollection) {
		switch(traitCollection.horizontalSizeClass, traitCollection.verticalSizeClass) {
		case (.compact, .regular) :
			NSLayoutConstraint.deactivate(regularConstraints)
			NSLayoutConstraint.activate(compactConstraints)
		default:
			NSLayoutConstraint.deactivate(compactConstraints)
			NSLayoutConstraint.activate(regularConstraints)
		}
	}

	func setupViewLayout() {
		setupSharedLayout()
		setupCompactLayout()
		setupRegularLayout()
	}

	func setupSharedLayout() {
		setupScrollViewLayout()
		setupImageViewLayot()
		setupTitleLabelLayout()
		setupTextLabelLayout()

		NSLayoutConstraint.activate(sharedConstraints)
	}

	func setupScrollViewLayout() {
		view.addSubview(scrollView)
		scrollView.translatesAutoresizingMaskIntoConstraints = false

		sharedConstraints.append(contentsOf: [
			scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
		])
	}

	func setupImageViewLayot() {
		scrollView.addSubview(imageView)
		imageView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			imageView.heightAnchor.constraint(equalToConstant: 300)
		])
	}

	func setupTextLabelLayout() {
		scrollView.addSubview(textLabel)
		textLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			textLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
			textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10)
		])
	}

	func setupTitleLabelLayout() {
		scrollView.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
			titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
		])
	}
}

// MARK: - Compact Layout

private extension SecondViewController {
	func setupCompactLayout() {
		setupImageViewCompactLayot()
		setupTextLabelCompactLayout()
	}

	func setupImageViewCompactLayot() {
		compactConstraints.append(contentsOf: [
			imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
		])
	}

	func setupTextLabelCompactLayout() {
		compactConstraints.append(contentsOf: [
			textLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			textLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 15),
		])
	}
}

// MARK: - Regular Layout

private extension SecondViewController {
	func setupRegularLayout() {
		setupImageViewRegularLayot()
		setupTitleLabelRegularLayout()
		setupTextLabelRegularLayout()
	}

	func setupImageViewRegularLayot() {
		regularConstraints.append(contentsOf: [
			imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
			imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
			imageView.bottomAnchor.constraint(equalTo: textLabel.topAnchor, constant: -10),
			imageView.widthAnchor.constraint(equalToConstant: 200),
			imageView.heightAnchor.constraint(equalToConstant: 200)
		])
	}

	func setupTitleLabelRegularLayout() {
		regularConstraints.append(contentsOf: [
			titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor),
			titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			titleLabel.heightAnchor.constraint(equalTo: imageView.heightAnchor),
			titleLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
		])
	}

	func setupTextLabelRegularLayout() {
		regularConstraints.append(contentsOf: [
			textLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			textLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10)
		])
	}
}
