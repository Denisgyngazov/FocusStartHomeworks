//
//  ImageLoaderCell.swift
//  homework-7
//
//  Created by Денис Гынгазов on 02.12.2020.
//

import UIKit

final class ImageLoaderCell: UITableViewCell {
	
	// MARK: - View

	private let mainImageView = UIImageView()

	// MARK: - Property

	static let identifaer = String(describing: ImageLoaderCell.self)

	// MARK: - Constants

	private enum Constants {
		static let verticalSpace: CGFloat = 10;
		static let horizontalScape: CGFloat = 18;
	}

	// MARK: - Init

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		setupViewAppearance()
		setupViewLayout()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

	// MARK: - ConfigureCell

extension ImageLoaderCell {
	func setupImage(image: UIImage) {
		self.mainImageView.image = image
	}

	func configure(image: UIImage) {
			setupImage(image: image)
	}
}

	// MARK: - Appearance

private extension ImageLoaderCell {
	func setupViewAppearance() {
		setupMainImageViewAppearance()
	}

	func setupMainImageViewAppearance() {
		mainImageView.contentMode = .scaleAspectFit
	}
}

	// MARK: - Layout

private extension ImageLoaderCell {
	func setupViewLayout() {
		setupMainImageViewLayout()
	}

	func setupMainImageViewLayout() {
		contentView.addSubview(mainImageView)
		mainImageView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			mainImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.verticalSpace),
			mainImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.verticalSpace),
			mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
												   constant: Constants.horizontalScape),
			mainImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
													constant: -Constants.horizontalScape),
		])
	}
}


