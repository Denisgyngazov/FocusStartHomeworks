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
	
// MARK: - View

	private let loginTexField = UITextField()
	private let passwordTextField = UITextField()
	private let enterButton = UIButton()
	private let scrollView = UIScrollView()

// MARK: - Life Cycle

	override init(frame: CGRect) {
		super.init(frame: frame)

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
		enterButton.layer.cornerRadius = 15
		enterButton.layer.borderWidth = 1
	}
}

// MARK: - Extension TextFieldDelegate

extension ThirdView: UITextFieldDelegate {
	func setupTextFieldShouldReturn() {
		loginTexField.delegate = self
		passwordTextField.delegate = self

		loginTexField.tag = 1
		passwordTextField.tag = 2
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

		if enterButtonLayoutConstraint?.constant == -10 {
			let keyboard = self.safeAreaInsets.bottom - keyboardSize.cgRectValue.height
			enterButtonLayoutConstraint?.constant = keyboard - 10
			UIView.animate(withDuration: 0.5, delay: 0, animations: {self.layoutIfNeeded()})
		}
	}

	@objc func keyboardWillHide(notification: NSNotification) {
		if enterButtonLayoutConstraint?.constant != -10 {
			enterButtonLayoutConstraint?.constant = -10
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
			loginTexField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
			loginTexField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
			loginTexField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15)
		])
	}

	func setupPasswordTextFieldLayout() {
		self.addSubview(passwordTextField)
		passwordTextField.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			passwordTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
			passwordTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
			passwordTextField.topAnchor.constraint(equalTo: loginTexField.bottomAnchor , constant: 15)
		])
	}

	func setupEnterButtonLayout() {
		self.addSubview(enterButton)
		enterButton.translatesAutoresizingMaskIntoConstraints = false

		enterButtonLayoutConstraint = enterButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10)
		enterButtonLayoutConstraint?.isActive = true

		NSLayoutConstraint.activate([
			enterButton.widthAnchor.constraint(equalToConstant: 160),
			enterButton.heightAnchor.constraint(equalToConstant: 60),
			enterButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
			enterButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
		])
	}
}
