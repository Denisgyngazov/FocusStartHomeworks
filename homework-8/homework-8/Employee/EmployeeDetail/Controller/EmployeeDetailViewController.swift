//
//  EmployeeDetailViewController.swift
//  homework-8
//
//  Created by Денис Гынгазов on 09.12.2020.
//

import UIKit

final class EmployeeDetailViewController: UIViewController {
	
	//MARK: - Property
	
	var employee: Employee?
	var company: Company?
	private let employeeDetailView = EmployeeDetailView()
	
	private enum Constants {
		static let titleBarButton: String = "Сохранить"
		static let titleAllertController: String = "Внимание"
		static let bodyAllertController: String = "Введите имя, возраст, образование"
		static let acceptButtonAllertController: String = "Продолжить"
	}
	
	//MARK: - Life Cycle
	
	override func loadView() {
		super.loadView()
		self.view = employeeDetailView
		setupNavigationController()
		setupEmployee()
	}
}

// MARK: - Setup Navigation

private extension EmployeeDetailViewController {
	func setupNavigationController() {
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: Constants.titleBarButton, style: .plain, target: self, action: #selector(saveEmployee))
	}
}

//MARK: - Setup employee

extension EmployeeDetailViewController {
	func setupEmployee() {
		if let employee = employee {
			employeeDetailView.nameTextField.text = employee.name
			employeeDetailView.ageTextField.text = String(employee.age)
			employeeDetailView.experienceTextField.text = String(employee.experience)
			employeeDetailView.educationTextField.text = employee.education
			employeeDetailView.positionTextField.text = employee.position
		}
	}
}

//MARK: - Save emloyee

extension EmployeeDetailViewController {
	@objc func saveEmployee() {
		if  employeeDetailView.nameTextField.text == "" ||
				employeeDetailView.ageTextField.text == "" ||
				employeeDetailView.positionTextField.text == "" {
			self.showAlert(title: Constants.titleAllertController, body: Constants.bodyAllertController)
		}
		
		guard let company = company else { return }
		let name = employeeDetailView.nameTextField.text ?? ""
		guard let age = Int(employeeDetailView.ageTextField.text ?? "0") else { return  }
		guard let experience = Int(employeeDetailView.experienceTextField.text ?? "0") else { return }
		let education = employeeDetailView.educationTextField.text ?? ""
		let position = employeeDetailView.positionTextField.text ?? ""
		
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
		self.navigationController?.popViewController(animated: true)
	}
}

//MARK: - Alert Controller

private extension EmployeeDetailViewController {
	func showAlert(title: String, body: String) {
		let alertController = UIAlertController(title: title, message: body, preferredStyle: .alert)
		let acceptButton = UIAlertAction(title: Constants.acceptButtonAllertController, style: .default)
		
		alertController.addAction(acceptButton)
		
		present(alertController, animated: true)
	}
}
