//
//  DetailView.swift
//  homework-4
//
//  Created by Денис Гынгазов on 15.11.2020.
//

import UIKit

final class DetailView: UIView {

// MARK: - View
	
	private let scrollView = UIScrollView()
	private let descriptionLabel = UILabel()
	private let firstImage = RoundedShadowImageView()
	private let secondImage = RoundedShadowImageView()

// MARK: - Property

	private enum Constants {
		static let topAnchor: CGFloat = 10
		static let leadingAnchor: CGFloat = 10
		static let trailingAnchor: CGFloat = 10
		static let imageWidthAnchor: CGFloat = 300
		static let imageHeightAnchor: CGFloat = 300
		static let numberOfLines: Int = 0
	}

	private enum Fonts {
		static let descriptionFont = UIFont.italicSystemFont(ofSize: 15)
	}

	init(descriptionText: String ,frame: CGRect) {
		super.init(frame: frame)
		descriptionLabel.text = descriptionText
		setupViewsApperance()
		setupViewLayout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Apperance

private extension DetailView {
	func setupViewsApperance() {
		self.backgroundColor = .white
		setupDescriptionLabelApperance()
		setupFirstImageApperance()
		setupSecondImageApperance()
	}

	func setupDescriptionLabelApperance() {
		descriptionLabel.font = Fonts.descriptionFont
		descriptionLabel.numberOfLines = Constants.numberOfLines
	}

	func setupFirstImageApperance() {
		firstImage.image = UIImage(named: Images.firsImage.rawValue)
	}

	func setupSecondImageApperance() {
		secondImage.image = UIImage(named: Images.secondImage.rawValue)

	}
}
 // MARK: - Layout

private extension DetailView {
	func setupViewLayout() {
		setupScrollViewLayout()
		setupDescriptionLabelLayout()
		setupFirstImageViewLayout()
		setupSecondImageViewLayout()
	}

	func setupScrollViewLayout() {
		self.addSubview(scrollView)
		scrollView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
			scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
			scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
		])
	}

	func setupDescriptionLabelLayout() {
		scrollView.addSubview(descriptionLabel)
		descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			descriptionLabel.topAnchor.constraint(equalTo: scrollView.topAnchor,
												  constant: Constants.topAnchor),
			descriptionLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
													  constant: Constants.leadingAnchor),
			descriptionLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
													   constant: -Constants.trailingAnchor)
		])
	}

	func setupFirstImageViewLayout() {
		scrollView.addSubview(firstImage)
		firstImage.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			firstImage.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,
											constant: Constants.topAnchor),
			firstImage.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
			firstImage.widthAnchor.constraint(equalToConstant: Constants.imageWidthAnchor),
			firstImage.heightAnchor.constraint(equalToConstant: Constants.imageHeightAnchor),
		])
	}

	func setupSecondImageViewLayout() {
		scrollView.addSubview(secondImage)
		secondImage.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			secondImage.topAnchor.constraint(equalTo: firstImage.bottomAnchor,
											 constant: Constants.topAnchor),
			secondImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
			secondImage.widthAnchor.constraint(equalToConstant: Constants.imageWidthAnchor),
			secondImage.heightAnchor.constraint(equalToConstant: Constants.imageHeightAnchor),
			secondImage.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
		])
	}
}

