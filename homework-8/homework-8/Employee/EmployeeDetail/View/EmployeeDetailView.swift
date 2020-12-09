//
//  EmployeeDetailView.swift
//  homework-8
//
//  Created by Денис Гынгазов on 09.12.2020.
//

import UIKit

final class EmployeeDetailView: UIView {

	//MARK: - View

	private var nameTextField = UITextField()
	private var ageTextField = UITextField()
	private var experienceTextField = UITextField()
	private var educationTextField = UITextField()
	private var positionTextField = UITextField()

//MARK: - Property

	private var employee: Employee?
	private var company: Company?

	private enum Constants {
		static let leadingAnchor: CGFloat = 10
		static let trailingAnchor: CGFloat = 10
		static let topAnchor: CGFloat = 15

		static let namePlaceholder: String = "Введите имя"
		static let agePlaceholder: String = "Введите возраст"
		static let experiencePlaceholder: String = "Введите опыт"
		static let educationPlaceholder: String = "Введите образование"
		static let positionPlaceholder: String = "Введите должность"
	}
	

//MARK: - Init

	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .systemBackground

		setupViewApperance()
		setupViewLayout()
		setupEmployee()

	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

//MARK: - Setup employee

extension EmployeeDetailView {
	func setupEmployee() {
		if let employee = employee {
			nameTextField.text = employee.name
			ageTextField.text = String(employee.age)
			experienceTextField.text = String(employee.experience)
			educationTextField.text = employee.education
			positionTextField.text = employee.position
		}
	}
}

//MARK: - Save emloyee

extension EmployeeDetailView {
	@objc func saveEmployee() {
		if  nameTextField.text == "" ||
				ageTextField.text == "" ||
				positionTextField.text == "" {
			self.showAlert(title: "Внимание", body: "Введите имя, возраст, образование")
		}


		guard let company = company else { return }
		let name = nameTextField.text ?? ""
		guard let age = Int(ageTextField.text ?? "0") else { return  }
		guard let experience = Int(experienceTextField.text ?? "0") else { return }
		let education = educationTextField.text ?? ""
		let position = positionTextField.text ?? ""

		if employee == nil {

			DataBaseManager.shared.addEmployee(company: company,
											   name: name,
											   age: age ,
											   experience: experience,
											   education: education,
											   position: position)
		} else {
			guard let employee = employee else { return }

			DataBaseManager.shared.saveEmployee(employee: employee,
												name: name,
												age: age,
												experience: experience,
												education: education,
												position: position)
		}
	}
}

//MARK: - Alert Controller

private extension EmployeeDetailView {
	func showAlert(title: String, body: String) {
		let alertController = UIAlertController(title: title, message: body, preferredStyle: .alert)
		let acceptButton = UIAlertAction(title: "Продолжить", style: .default)

		alertController.addAction(acceptButton)

		findViewController()?.present(alertController, animated: true)
	}
}

// MARK: - Apperance

private extension EmployeeDetailView {
	func setupViewApperance() {
		setupNameTextFieldApperance()
		setupAgeTextFieldApperance()
		setupExperienceTextFieldApperance()
		setupEducationTextFieldApperance()
		setupPositionTextFieldApperance()

	}

	func setupNameTextFieldApperance() {
		nameTextField.placeholder = Constants.namePlaceholder
		nameTextField.borderStyle = .bezel
	}

	func setupAgeTextFieldApperance() {
		ageTextField.placeholder = Constants.agePlaceholder
		ageTextField.borderStyle = .bezel
	}

	func setupExperienceTextFieldApperance() {
		experienceTextField.placeholder = Constants.experiencePlaceholder
		experienceTextField.borderStyle = .bezel
	}

	func setupEducationTextFieldApperance() {
		educationTextField.placeholder = Constants.educationPlaceholder
		educationTextField.borderStyle = .bezel
	}

	func setupPositionTextFieldApperance() {
		positionTextField.placeholder = Constants.positionPlaceholder
		positionTextField.borderStyle = .bezel

	}
}

// MARK: - Layout

private extension EmployeeDetailView {
	func setupViewLayout() {
		setupNameTextFieldLayout()
		setupAgeTextFieldLayout()
		setupExperienceTextFieldLayout()
		setupEducationTextFieldLayout()
		setupPositionTextFieldLayout()
	}

	func setupNameTextFieldLayout() {
		self.addSubview(nameTextField)
		nameTextField.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			nameTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
												   constant: Constants.leadingAnchor),
			nameTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
													constant: -Constants.trailingAnchor),
			nameTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
											   constant: Constants.topAnchor)
		])
	}

	func setupAgeTextFieldLayout() {
		self.addSubview(ageTextField)
		ageTextField.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			ageTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
												  constant: Constants.leadingAnchor),
			ageTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
												   constant: -Constants.trailingAnchor),
			ageTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor,
											  constant: Constants.topAnchor)
		])
	}

	func setupExperienceTextFieldLayout() {
		self.addSubview(experienceTextField)
		experienceTextField.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			experienceTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
														 constant: Constants.leadingAnchor),
			experienceTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
														  constant: -Constants.trailingAnchor),
			experienceTextField.topAnchor.constraint(equalTo: ageTextField.bottomAnchor,
													 constant: Constants.topAnchor)
		])
	}

	func setupEducationTextFieldLayout() {
		self.addSubview(educationTextField)
		educationTextField.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			educationTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
														constant: Constants.leadingAnchor),
			educationTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
														 constant: -Constants.trailingAnchor),
			educationTextField.topAnchor.constraint(equalTo: experienceTextField.bottomAnchor,
													constant: Constants.topAnchor)
		])
	}

	func setupPositionTextFieldLayout() {
		self.addSubview(positionTextField)
		positionTextField.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			positionTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
													   constant: Constants.leadingAnchor),
			positionTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
														constant: -Constants.trailingAnchor),
			positionTextField.topAnchor.constraint(equalTo: educationTextField.bottomAnchor,
												   constant: Constants.topAnchor)
		])
	}
}
