//
//  ViewController.swift
//  homework-8
//
//  Created by Денис Гынгазов on 07.12.2020.
//

import UIKit

protocol SomeViewDelegate: AnyObject {
	func openSomeController(title: String)
}

final class CompanyViewController: UIViewController {

//MARK: - Property

	private let companyView = CompanyView()

	private enum Constants {
		static let titleCompanyViewController: String = "Компании"
	}

//MARK: - Life Cycle
	
	override func loadView() {
		super.loadView()
		self.view = companyView
		companyView.delegate = self
		setupNavigationController()
	}
}

// MARK: - Push EmployeeViewController

extension CompanyViewController: SomeViewDelegate {
	func openSomeController(title: String) {
		let employeeViewController = EmployeeViewController()
		employeeViewController.title = title
		navigationController?.pushViewController(employeeViewController, animated: true)
	}
}
// MARK: - Setup Navigation

private extension CompanyViewController {
	func setupNavigationController() {
	self.title = Constants.titleCompanyViewController
	self.navigationController?.navigationBar.prefersLargeTitles = true
	self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .plain, target: companyView, action: #selector(companyView.addNewCompany))
	}
}
