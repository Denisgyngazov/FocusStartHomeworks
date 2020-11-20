//
//  FirstView.swift
//  homework-6-builder
//
//  Created by Денис Гынгазов on 20.11.2020.
//

import UIKit

final class FirstView: UIView {

// MARK: - View

	let firstButton = UIButton(type: .roundedRect)

// MARK: - Init

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = .white
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
		setupButtonApperance()
	}

	func setupButtonApperance() {
		firstButton.setTitle("Show", for: .normal)
	}
}

// MARK: - Layout

private extension FirstView {
	func setupViewLayout() {
		setupButtonLayout()
	}

	func setupButtonLayout() {
		self.addSubview(firstButton)
		firstButton.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			firstButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
			firstButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
		])
	}
}


