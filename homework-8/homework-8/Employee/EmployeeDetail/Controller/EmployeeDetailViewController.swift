//
//  EmployeeDetailViewController.swift
//  homework-8
//
//  Created by Денис Гынгазов on 09.12.2020.
//

import UIKit

final class EmployeeDetailViewController: UIViewController {

//MARK: - Property

	private let employeeDetailView = EmployeeDetailView()

//MARK: - Life Cycle

	override func loadView() {
		super.loadView()
		self.view = employeeDetailView

		setupNavigationController()
	}
}

// MARK: - Setup Navigation

private extension EmployeeDetailViewController {
	func setupNavigationController() {
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: employeeDetailView, action: #selector(employeeDetailView.saveEmployee))
	}
}
