//
//  ThirdView.swift
//  homework-3
//
//  Created by Денис Гынгазов on 14.11.2020.
//

import UIKit

final class ThirdView: UIView {

// MARK: - Property

	private var enterButtonLayoutConstraint: NSLayoutConstraint?
	
// MARK: - Constants
	private enum Constants {
		static let cornerRadius: CGFloat = 15
		static let borderWidth: CGFloat = 1
		static let loginTag: Int = 1
		static let passwordTag: Int = 2
		static let enterButtonLayoutConstraint: CGFloat = 10
		static let leadingAnchor: CGFloat = 10
		static let trailingAnchor: CGFloat = 10
		static let topAnchor: CGFloat = 15
		static let bottomAnchor: CGFloat = 10
		static let enterButtonWidthAnchor: CGFloat = 160
		static let enterButtonHeightAnchor: CGFloat = 60
	}
// MARK: - View

	private let loginTexField = UITextField()
	private let passwordTextField = UITextField()
	private let enterButton = UIButton()
	private let scrollView = UIScrollView()

// MARK: - Life Cycle

	override init(frame: CGRect) {
		super.init(frame: frame)

		self.backgroundColor = .systemBlue

		setupViewApperance()
		setupViewLayout()
		setupNotificationKeyboard()
		initializeHideKeyboard()
		setupTextFieldShouldReturn()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Apperance

private extension ThirdView {

	func setupViewApperance() {
		setupLoginTextFieldApperance()
		setupPasswordTextFieldAppearance()
		setupEnterButtonApperance()
	}

	func setupLoginTextFieldApperance() {
		loginTexField.placeholder = TextFields.loginPlaceholder.rawValue
		loginTexField.borderStyle = .roundedRect
		loginTexField.becomeFirstResponder()

	}

	func setupPasswordTextFieldAppearance() {
		passwordTextField.placeholder = TextFields.passwordPlaceholder.rawValue
		passwordTextField.borderStyle = .roundedRect
		passwordTextField.isSecureTextEntry = true
	}

	func setupEnterButtonApperance() {
		enterButton.setTitle(Buttons.enter.rawValue, for: .normal)
		enterButton.layer.cornerRadius = Constants.cornerRadius
		enterButton.layer.borderWidth = Constants.borderWidth
	}
}

// MARK: - Extension TextFieldDelegate

extension ThirdView: UITextFieldDelegate {
	func setupTextFieldShouldReturn() {
		loginTexField.delegate = self
		passwordTextField.delegate = self

		loginTexField.tag = Constants.loginTag
		passwordTextField.tag = Constants.passwordTag
	}

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if let nextField = self.viewWithTag(textField.tag + 1) as? UITextField {
			nextField.becomeFirstResponder()
		} else {
			textField.resignFirstResponder()
		}
		return false
	}
}

// MARK: -  Keyboard

private extension ThirdView {
	func initializeHideKeyboard() {
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissMyKeyboard))
		self.addGestureRecognizer(tap)
	}

	@objc func dismissMyKeyboard() {
		self.endEditing(true)
	}
}

private extension ThirdView {
	func setupNotificationKeyboard() {
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)

		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
	}

	@objc func keyboardWillShow(notification: NSNotification) {
		guard let userInfo = notification.userInfo,
			  let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

		if enterButtonLayoutConstraint?.constant == -Constants.enterButtonLayoutConstraint {
			let keyboard = self.safeAreaInsets.bottom - keyboardSize.cgRectValue.height
			enterButtonLayoutConstraint?.constant = keyboard - Constants.enterButtonLayoutConstraint
			UIView.animate(withDuration: 0.5, delay: 0, animations: {self.layoutIfNeeded()})
		}
	}

	@objc func keyboardWillHide(notification: NSNotification) {
		if enterButtonLayoutConstraint?.constant != -Constants.enterButtonLayoutConstraint {
			enterButtonLayoutConstraint?.constant = -Constants.enterButtonLayoutConstraint
			UIView.animate(withDuration: 0.5, delay: 0, animations: {self.layoutIfNeeded()})
		}
	}
}

// MARK: - Layout

private extension ThirdView {

	func setupViewLayout() {
		setupLoginTextFieldLayout()
		setupPasswordTextFieldLayout()
		setupEnterButtonLayout()
	}

	func setupLoginTextFieldLayout() {
		self.addSubview(loginTexField)
		loginTexField.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			loginTexField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
												   constant: Constants.leadingAnchor),
			loginTexField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
													constant: -Constants.trailingAnchor),
			loginTexField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
											   constant: Constants.topAnchor)
		])
	}

	func setupPasswordTextFieldLayout() {
		self.addSubview(passwordTextField)
		passwordTextField.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			passwordTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
													   constant: Constants.leadingAnchor),
			passwordTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
														constant: -Constants.trailingAnchor),
			passwordTextField.topAnchor.constraint(equalTo: loginTexField.bottomAnchor,
												   constant: Constants.topAnchor)
		])
	}

	func setupEnterButtonLayout() {
		self.addSubview(enterButton)
		enterButton.translatesAutoresizingMaskIntoConstraints = false
		enterButtonLayoutConstraint = enterButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
																		  constant: Constants.bottomAnchor)
		enterButtonLayoutConstraint?.isActive = true

		NSLayoutConstraint.activate([
			enterButton.widthAnchor.constraint(equalToConstant: Constants.enterButtonWidthAnchor),
			enterButton.heightAnchor.constraint(equalToConstant: Constants.enterButtonHeightAnchor),
			enterButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
			enterButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
		])
	}
}
