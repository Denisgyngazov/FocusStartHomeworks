//
//  SecondView.swift
//  homework-3
//
//  Created by Денис Гынгазов on 14.11.2020.
//

import UIKit

final class SecondView: UIView {

// MARK: - Properties

	private var sharedConstraints: [NSLayoutConstraint] = []
	private var compactConstraints: [NSLayoutConstraint] = []
	private var regularConstraints: [NSLayoutConstraint] = []

// MARK: - Constants

	private enum Constants {
		static let titleLabelFont = UIFont.italicSystemFont(ofSize: 23)
		static let numberOfLines: Int = 0

		static let topAnchor: CGFloat = 10
		static let bottomAnchor: CGFloat = 10
		static let sharedImageViewHeightAnchor: CGFloat = 300
		static let trailingAnchor: CGFloat = 15
		static let leadingAnchor: CGFloat = 10
		static let regularImageWidthAnchor: CGFloat = 200
		static let regularImageHeightAnchor: CGFloat = 200
	}
// MARK: - View

	private let scrollView = UIScrollView()
	private let imageView = UIImageView()
	private let textLabel = UILabel()
	private var titleLabel = UILabel()

// MARK: - Life Cycle

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViewApperance()
		setupViewLayout()
		changeviewsLayout(traitCollection: traitCollection)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

// MARK: - Changes Cycle
	
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)
		changeviewsLayout(traitCollection: traitCollection)
	}
}

// MARK: - Apperance

private extension SecondView {

	func setupViewApperance() {
		setupImageViewApperance()
		setupTitleLabelApperance()
		setupTextLabelApperance()
	}

	func setupImageViewApperance() {
		imageView.image = UIImage(named: Images.serenity.rawValue)
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
	}

	func setupTitleLabelApperance() {
		titleLabel.text = Labels.titleLabel.rawValue
		titleLabel.font = Constants.titleLabelFont
		titleLabel.textAlignment = .center
	}

	func setupTextLabelApperance() {
		textLabel.numberOfLines = Constants.numberOfLines
		textLabel.text = Labels.textLabel.rawValue
	}
}

// MARK: -  Shared Layout

private extension SecondView {
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
		self.addSubview(scrollView)
		scrollView.translatesAutoresizingMaskIntoConstraints = false

		sharedConstraints.append(contentsOf: [
			scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
			scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
			scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
			scrollView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor)
		])
	}

	func setupImageViewLayot() {
		scrollView.addSubview(imageView)
		imageView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			imageView.heightAnchor.constraint(equalToConstant: Constants.sharedImageViewHeightAnchor)
		])
	}

	func setupTextLabelLayout() {
		scrollView.addSubview(textLabel)
		textLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			textLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
			textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
										   constant: Constants.topAnchor)
		])
	}

	func setupTitleLabelLayout() {
		scrollView.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor,
											constant: Constants.topAnchor),
			titleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor)
		])
	}
}

// MARK: - Compact Layout

private extension SecondView {
	func setupCompactLayout() {
		setupImageViewCompactLayot()
		setupTextLabelCompactLayout()
	}

	func setupImageViewCompactLayot() {
		compactConstraints.append(contentsOf: [
			imageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			imageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
		])
	}

	func setupTextLabelCompactLayout() {
		compactConstraints.append(contentsOf: [
			textLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			textLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
												constant: Constants.trailingAnchor)
		])
	}
}

// MARK: - Regular Layout

private extension SecondView {
	func setupRegularLayout() {
		setupImageViewRegularLayot()
		setupTitleLabelRegularLayout()
		setupTextLabelRegularLayout()
	}

	func setupImageViewRegularLayot() {
		regularConstraints.append(contentsOf: [
			imageView.topAnchor.constraint(equalTo: scrollView.topAnchor,
										   constant: Constants.topAnchor),
			imageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
											   constant: Constants.leadingAnchor),
			imageView.bottomAnchor.constraint(equalTo: textLabel.topAnchor,
											  constant: -Constants.bottomAnchor),
			imageView.widthAnchor.constraint(equalToConstant: Constants.regularImageWidthAnchor),
			imageView.heightAnchor.constraint(equalToConstant: Constants.regularImageHeightAnchor)
		])
	}

	func setupTitleLabelRegularLayout() {
		regularConstraints.append(contentsOf: [
			titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor),
			titleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
			titleLabel.heightAnchor.constraint(equalTo: imageView.heightAnchor),
			titleLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
		])
	}

	func setupTextLabelRegularLayout() {
		regularConstraints.append(contentsOf: [
			textLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
			textLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
											   constant: Constants.leadingAnchor)
		])
	}
}

