//
//  ImageLoaderCell.swift
//  homework-7
//
//  Created by Денис Гынгазов on 02.12.2020.
//

import UIKit
import Alamofire
import AlamofireImage

final class ImageLoaderCell: UITableViewCell {
	
	// MARK: - View

	private let mainImageView = UIImageView()
	private var ulr: URL?


	// MARK: - Property

	static let identifaer = String(describing: ImageLoaderCell.self)

	private enum Constants {
		static let verticalSpace: CGFloat = 10;
		static let horizontalScape: CGFloat = 18;

	}

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		setupViewAppearance()
		setupViewLayout()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func configure(url: URL?) {
		self.ulr = url
		//loadImage()
	}

	func loadImage() {
		guard let url = ulr else {return}
		AF.request(url.absoluteString).responseImage { [weak self] response in
			if case .success(let image) = response.result {
				self?.mainImageView.image = image
				//print("Картинка загружена: \(image)")
			}
		}
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


