//
//  EmployeeViewController.swift
//  homework-8
//
//  Created by Денис Гынгазов on 07.12.2020.
//

import UIKit

protocol EmployeeViewDelegate: AnyObject {
	func openSomeController()
}

final class EmployeeViewController: UIViewController {

//MARK: - Property

	private let employeeView = EmployeeView()

//MARK: - Life Cycle

	override func loadView() {
		super.loadView()
		self.view = employeeView
		employeeView.delegate = self
		setupNavigationController()
	}
}

// MARK: - Push EmployeeViewController

extension EmployeeViewController: EmployeeViewDelegate {
	@objc func openSomeController() {
		let employeeDetailViewController = EmployeeDetailViewController()
		navigationController?.pushViewController(employeeDetailViewController, animated: true)
	}
}

// MARK: - Setup Navigation

private extension EmployeeViewController {
	func setupNavigationController() {
	self.navigationController?.navigationBar.prefersLargeTitles = true
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .done, target: self , action: #selector(openSomeController))
	}
}

