//
//  MasterTableViewCell.swift
//  homework-4
//
//  Created by Денис Гынгазов on 06.11.2020.
//

import UIKit

final class MasterTableViewCell: UITableViewCell {

// MARK: - View

	private let titleLabel = UILabel()
	private let descriptionLabel = UILabel()
	private let timeLabel = UILabel()

// MARK: - Property

	static let identifaer = String(describing: MasterTableViewCell.self)

	private enum Fonts {
		static let descriptionFont = UIFont.italicSystemFont(ofSize: 15)
		static let titleFont = UIFont.systemFont(ofSize: 20, weight: .semibold)
	}

	private enum Constants {
		static let topAnchor: CGFloat = 10
		static let leadingAnchor: CGFloat = 10
		static let trailingAnchor: CGFloat = 10
		static let bottomAnchor: CGFloat = 10
		static let imageWidthAnchor: CGFloat = 300
		static let imageHeightAnchor: CGFloat = 300
		static let numberOfLines: Int = 0
	}

// MARK: - Configure cell

	func configure(title: String, description: String, time: String) {
		titleLabel.text = title
		descriptionLabel.text = description
		timeLabel.text = time
		setupViewApperance()
		setupViewLayout()
	}
}

// MARK: - Apperance

private extension MasterTableViewCell {
	func setupViewApperance() {
		setupTitleLabel()
		setupDescriptionLabel()
		setupTimeLabel()
	}

	func setupTitleLabel() {
		titleLabel.font = Fonts.titleFont
		titleLabel.numberOfLines = Constants.numberOfLines
	}

	func setupDescriptionLabel() {
		descriptionLabel.font = Fonts.descriptionFont
		descriptionLabel.numberOfLines = Constants.numberOfLines
	}

	func setupTimeLabel() {
		timeLabel.font = Fonts.descriptionFont
		timeLabel.textAlignment = .right
	}
}

// MARK: - Layout

private extension MasterTableViewCell {
	func setupViewLayout() {
		setupTitleLabelLayout()
		setupDescriptionLayout()
		setupTimeLabelLayout()
	}

	func setupTitleLabelLayout() {
		contentView.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
												constant: Constants.leadingAnchor),
			titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
												 constant: -Constants.trailingAnchor),
			titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
											constant: Constants.topAnchor)
		])
	}

	func setupDescriptionLayout() {
		contentView.addSubview(descriptionLabel)
		descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
												  constant: Constants.topAnchor),
			descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
													  constant: Constants.leadingAnchor),
			descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
													 constant: -Constants.bottomAnchor)
		])
	}

	func setupTimeLabelLayout() {
		contentView.addSubview(timeLabel)
		timeLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
		timeLabel.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
			timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
												constant: -Constants.trailingAnchor),
			timeLabel.leadingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor,
											   constant: Constants.leadingAnchor)
		])
	}
}
