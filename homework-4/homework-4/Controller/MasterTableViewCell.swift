//
//  MasterTableViewCell.swift
//  homework-4
//
//  Created by Денис Гынгазов on 06.11.2020.
//

import UIKit

class MasterTableViewCell: UITableViewCell {

// MARK: - View

	private let titleLabel = UILabel()
	private let descriptionLabel = UILabel()
	private let timeLabel = UILabel()

// MARK: - Property

	static let identifaer = String(describing: MasterTableViewCell.self)

// MARK: - Fonst

	private enum Fonts {
		static let descriptionFont = UIFont.italicSystemFont(ofSize: 15)
		static let titleFont = UIFont.systemFont(ofSize: 20, weight: .semibold)
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
		titleLabel.numberOfLines = 0
	}

	func setupDescriptionLabel() {
		descriptionLabel.font = Fonts.descriptionFont
		descriptionLabel.numberOfLines = 0
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
			titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
		])
	}

	func setupDescriptionLayout() {
		contentView.addSubview(descriptionLabel)
		descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([

			descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
			descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
		])
	}

	func setupTimeLabelLayout() {
		contentView.addSubview(timeLabel)
		timeLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
		timeLabel.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
		timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
		timeLabel.leadingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor, constant: 10)
		])
	}

}
