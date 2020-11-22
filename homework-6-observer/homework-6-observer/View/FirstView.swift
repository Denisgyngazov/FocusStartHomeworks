//
//  FirstView.swift
//  homework-6-observer
//
//  Created by Денис Гынгазов on 18.11.2020.
//

import UIKit

final class FirstView: UIView {

// MARK: - View

	private let firstLabel = UILabel()
	private let firstButton = UIButton(type: .roundedRect)
	private let firstSwitch = UISwitch()
	private let secondLabel = UILabel()

	private let notificationCenter = NotificationCenters()
	private let firstObserver = MainObserver()

// MARK: - Property

	private enum ConstantsLayout {
		static let topAnchorLayout: CGFloat = 50
		static let widthAnchorButtonLayout: CGFloat = 100
		static let heightAnchorButtonLayout: CGFloat = 100
		static let switchTopAnchorLayout: CGFloat = 10
	}

	private enum ConstantText {
		static var firstLabeText: String = "Out"
		static let firstButtonTitle: String = "Update"
		static let secondLabelText: String = "in Subscribe"
	}

// MARK: - Life Cycle

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = .white
		setupViewApperance()
		setupViewLayout()
		firstButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
		firstSwitch.addTarget(self, action: #selector(test), for: .touchUpInside)

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Extension

extension FirstView: Observer {
	func update(subject: NotificationCenters) {
		firstLabel.text = "Subject: \(subject.state)"
	}

	@objc private func buttonClicked() {
		notificationCenter.someBusinessLogic()
	}

	@objc private func test() {
		if firstSwitch.isOn {
			notificationCenter.subscribe(self)
			notificationCenter.subscribe(firstObserver)
		} else {
			notificationCenter.unsubscribe(self)
			notificationCenter.unsubscribe(firstObserver)
		}
	}
}

// MARK: - Apperance

extension FirstView {
	func setupViewApperance() {
		setupFirstLabelApperance()
		setupFirstButtonApperance()
		setupSecondLabelApperance()
	}

	func setupFirstLabelApperance() {
		firstLabel.text = ConstantText.firstLabeText
		firstLabel.textAlignment = .center
	}

	func setupFirstButtonApperance() {
		firstButton.setTitle(ConstantText.firstButtonTitle, for: .normal)
	}

	func setupSecondLabelApperance() {
		secondLabel.text = ConstantText.secondLabelText
		secondLabel.textAlignment = .center
	}
}
// MARK: - Layout

extension FirstView {
	func setupViewLayout() {
		setupFirstLabelLayout()
		setupFirstButtonLayout()
		setupFirstSwitchLayout()
		setupSecondLabelLayout()
	}

	func setupFirstLabelLayout() {
		self.addSubview(firstLabel)
		firstLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			firstLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
											constant: ConstantsLayout.topAnchorLayout),
			firstLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			firstLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
		])
	}

	func setupFirstButtonLayout() {
		self.addSubview(firstButton)
		firstButton.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			firstButton.topAnchor.constraint(equalTo: firstLabel.bottomAnchor,
											 constant: ConstantsLayout.topAnchorLayout),
			firstButton.centerXAnchor.constraint(equalTo: firstLabel.centerXAnchor),
			firstButton.widthAnchor.constraint(equalToConstant: ConstantsLayout.widthAnchorButtonLayout),
			firstButton.heightAnchor.constraint(equalToConstant: ConstantsLayout.heightAnchorButtonLayout)
		])
	}

	func setupFirstSwitchLayout() {
		self.addSubview(firstSwitch)
		firstSwitch.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			firstSwitch.topAnchor.constraint(equalTo: firstButton.bottomAnchor,
											 constant: ConstantsLayout.topAnchorLayout),
			firstSwitch.centerXAnchor.constraint(equalTo: firstButton.centerXAnchor)
		])
	}

	func setupSecondLabelLayout() {
		self.addSubview(secondLabel)
		secondLabel.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			secondLabel.topAnchor.constraint(equalTo: firstSwitch.bottomAnchor,
											 constant: ConstantsLayout.switchTopAnchorLayout),
			secondLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			secondLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
		])
	}
}
