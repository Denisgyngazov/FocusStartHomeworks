//
//  FirstView.swift
//  homework-3
//
//  Created by Денис Гынгазов on 14.11.2020.
//

import UIKit

final class FirstView: UIView {

// MARK: - View

	private lazy var firstLabel = UILabel()
	private lazy var secondLabel = UILabel()
	private lazy var thirdLabel = UILabel()
	private lazy var firstButton = UIButton()
	private lazy var secondButton = UIButton()
	private lazy var imageView = UIImageView()
	private lazy var activityIndicator = UIActivityIndicatorView()

// MARK: - Constants
	
	private enum Constants {
		static let secondLabelFont = UIFont.boldSystemFont(ofSize: 20)
		static let thirdLabelFont = UIFont.italicSystemFont(ofSize: 23)

		static let firsButtonCornerRadius: CGFloat = 25
		static let secondButtonCornerRadius: CGFloat = 8
		static let numberOfLines: Int = 2
		static let labelTopBottomAnchor: CGFloat = 8
		static let topAnchor: CGFloat = 60
		static let firstButtonWidthAnchor: CGFloat = 50
		static let buttonHeightAnchor: CGFloat = 50
		static let secondButtonWidthAnchor: CGFloat = 200
	}
	
// MARK: - Life Cycle

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViewApperance()
		setupViewLayout()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Apperance

private extension FirstView {

	func setupViewApperance() {
		setupFirstLabelApperance()
		setupSecondLabelApperance()
		setupThirdLabelApperance()
		setupFirstButtonApperance()
		setupSecondButtonApperance()
		setupImmageViewApperance()
		setupActivityIndicatorApperance()
	}

	func setupFirstLabelApperance() {
		firstLabel.text = Labels.firstLabel.rawValue
		firstLabel.textColor = .white
		self.addSubview(firstLabel)
	}

	func setupSecondLabelApperance() {
		secondLabel.text = Labels.secondLabel.rawValue
		secondLabel.font = Constants.secondLabelFont
		secondLabel.sizeToFit()
		secondLabel.textColor = .white
	}

	func setupThirdLabelApperance() {
		thirdLabel.text = Labels.thirdLabel.rawValue
		thirdLabel.font = Constants.thirdLabelFont
		thirdLabel.numberOfLines = Constants.numberOfLines
		thirdLabel.textColor = .white
	}

	func setupFirstButtonApperance() {
		firstButton = UIButton(type: .roundedRect)
		firstButton.setTitle(Buttons.press.rawValue, for: .normal)
		firstButton.layer.cornerRadius = Constants.firsButtonCornerRadius
		firstButton.clipsToBounds = true
		firstButton.backgroundColor = .darkGray
	}

	func setupSecondButtonApperance() {
		secondButton = UIButton(type: .roundedRect)
		secondButton.setTitle(Buttons.press.rawValue, for: .normal)
		secondButton.layer.cornerRadius = Constants.secondButtonCornerRadius
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

private extension FirstView {

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
		self.addSubview(firstLabel)
		firstLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			firstLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
											constant: Constants.labelTopBottomAnchor),
			firstLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
		])
	}

	func setupSecondLabelLayout() {
		self.addSubview(secondLabel)
		secondLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			secondLabel.topAnchor.constraint(equalTo: firstLabel.topAnchor,
											 constant: Constants.topAnchor),
			secondLabel.centerXAnchor.constraint(equalTo: firstLabel.centerXAnchor)
		])
	}

	func setupThirdLabelLayout() {
		self.addSubview(thirdLabel)
		thirdLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			thirdLabel.topAnchor.constraint(equalTo: secondLabel.topAnchor,
											constant: Constants.topAnchor),
			thirdLabel.centerXAnchor.constraint(equalTo: secondLabel.centerXAnchor),
			thirdLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2)
		])
	}

	func setupFirstButtonLayout() {
		self.addSubview(firstButton)
		firstButton.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			firstButton.topAnchor.constraint(equalTo: thirdLabel.topAnchor,
											 constant: Constants.topAnchor),
			firstButton.centerXAnchor.constraint(equalTo: thirdLabel.centerXAnchor),
			firstButton.widthAnchor.constraint(equalToConstant: Constants.firstButtonWidthAnchor),
			firstButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeightAnchor)
		])
	}

	func setupSecondButtonLayout() {
		self.addSubview(secondButton)
		secondButton.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			secondButton.topAnchor.constraint(equalTo: firstButton.topAnchor,
											  constant: Constants.topAnchor),
			secondButton.centerXAnchor.constraint(equalTo: firstButton.centerXAnchor),
			secondButton.widthAnchor.constraint(equalToConstant: Constants.secondButtonWidthAnchor),
			secondButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeightAnchor)
		])
	}

	func setupFirstImageLayout() {
		self.addSubview(imageView)
		imageView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			imageView.topAnchor.constraint(equalTo: secondButton.topAnchor,
										   constant: Constants.topAnchor),
			imageView.centerXAnchor.constraint(equalTo: secondButton.centerXAnchor),
			imageView.widthAnchor.constraint(equalTo: secondButton.widthAnchor),
			imageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
											  constant: -Constants.labelTopBottomAnchor)
		])
	}

	func setupActivityIndicatorLayout() {
		self.addSubview(activityIndicator)
		activityIndicator.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			activityIndicator.topAnchor.constraint(equalTo: imageView.topAnchor),
			activityIndicator.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
			activityIndicator.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
		])
	}
}

