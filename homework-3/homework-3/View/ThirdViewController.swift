//
//  ThirdViewController.swift
//  homework-3
//
//  Created by Денис Гынгазов on 30.10.2020.
//

import UIKit

class ThirdViewController: UIViewController {

// MARK: - Property

	private var enterButtonLayoutConstraint: NSLayoutConstraint?

// MARK: - View

	private let loginTexField = UITextField()
	private let passwordTextField = UITextField()
	private let enterButton = UIButton()
	private let scrollView = UIScrollView()

// MARK: - Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()

		setupViewApperance()
		setupViewLayout()
		setupNotificationKeyboard()
		initializeHideKeyboard()
		setupTextFieldShouldReturn()
	}
}

// MARK: - Apperance

private extension ThirdViewController {

	func setupViewApperance() {
		setupTabBarItemApperance()
		setupLoginTextFieldApperance()
		setupPasswordTextFieldAppearance()
		setupEnterButtonApperance()
	}

	func setupTabBarItemApperance() {
		var tabBarItem = UITabBarItem()
		view.backgroundColor = .systemBlue
		self.navigationItem.title = NavigationItems.thirdScreen.rawValue
		tabBarItem = UITabBarItem(title: TabBarItems.thirdScreen.rawValue,
								  image: .checkmark, tag: 2)
		self.tabBarItem = tabBarItem
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

extension ThirdViewController: UITextFieldDelegate {
	func setupTextFieldShouldReturn() {
		loginTexField.delegate = self
		passwordTextField.delegate = self

		loginTexField.tag = 1
		passwordTextField.tag = 2
	}

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if let nextField = self.view.viewWithTag(textField.tag + 1) as? UITextField {
			nextField.becomeFirstResponder()
		} else {
			textField.resignFirstResponder()
		}
		return false
	}
}

// MARK: -  Keyboard

private extension ThirdViewController {
	func initializeHideKeyboard() {
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissMyKeyboard))
		view.addGestureRecognizer(tap)
	}

	@objc func dismissMyKeyboard() {
		view.endEditing(true)
	}
}

private extension ThirdViewController {
	func setupNotificationKeyboard() {
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)

		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
	}

	@objc func keyboardWillShow(notification: NSNotification) {
		guard let userInfo = notification.userInfo,
			  let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

		if enterButtonLayoutConstraint?.constant == -10 {
			let keyboard = view.safeAreaInsets.bottom - keyboardSize.cgRectValue.height
			enterButtonLayoutConstraint?.constant = keyboard - 10
			UIView.animate(withDuration: 0.5, delay: 0, animations: {self.view.layoutIfNeeded()})
		}
	}

	@objc func keyboardWillHide(notification: NSNotification) {
		if enterButtonLayoutConstraint?.constant != -10 {
			enterButtonLayoutConstraint?.constant = -10
			UIView.animate(withDuration: 0.5, delay: 0, animations: {self.view.layoutIfNeeded()})
		}
	}
}

// MARK: - Layout

private extension ThirdViewController {
	
	func setupViewLayout() {
		setupLoginTextFieldLayout()
		setupPasswordTextFieldLayout()
		setupEnterButtonLayout()
	}

	func setupLoginTextFieldLayout() {
		view.addSubview(loginTexField)
		loginTexField.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			loginTexField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
			loginTexField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
			loginTexField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15)
		])
	}

	func setupPasswordTextFieldLayout() {
		view.addSubview(passwordTextField)
		passwordTextField.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
			passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
			passwordTextField.topAnchor.constraint(equalTo: loginTexField.bottomAnchor , constant: 15)
		])
	}

	func setupEnterButtonLayout() {
		view.addSubview(enterButton)
		enterButton.translatesAutoresizingMaskIntoConstraints = false

		enterButtonLayoutConstraint = enterButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
		enterButtonLayoutConstraint?.isActive = true

		NSLayoutConstraint.activate([
			enterButton.widthAnchor.constraint(equalToConstant: 160),
			enterButton.heightAnchor.constraint(equalToConstant: 60),
			enterButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
			enterButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
}
