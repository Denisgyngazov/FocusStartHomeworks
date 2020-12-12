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
	private var company = [Company]()


	private enum Constants {
		static let titleCompanyViewController: String = "Компании"

		static let titleSaveButton: String = "Сохранить"
		static let titleCancelButton: String = "Отменить"

		static let titleAllertController: String = "Новая компания"
		static let bodyAllertController: String = "Введите название компании"

		static let titleEmployeeViewController = "Сотрудники"
	}

	//MARK: - View

	private let tableView = UITableView()

	//MARK: - Life Cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		
		self.company = DataBaseManager.shared.fetchCompany()
		setupViewLayout()
		self.tableView.register(CompanyTableViewCell.self, forCellReuseIdentifier: CompanyTableViewCell.identifaer)

		self.tableView.delegate = self
		self.tableView.dataSource = self

		setupNavigationController()
	}
}

// MARK: - Push EmployeeViewController

// MARK: - Setup Navigation

private extension CompanyViewController {
	func setupNavigationController() {
		self.title = Constants.titleCompanyViewController
		self.navigationController?.navigationBar.prefersLargeTitles = true
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(addNewCompany))
	}
}


// MARK: - Allert Constroller

extension CompanyViewController {
	func showAlert(title: String, body: String) {
		let alertController = UIAlertController(title: title, message: body, preferredStyle: .alert)
		let saveButton = UIAlertAction(title: Constants.titleSaveButton, style: .default) { _ in
			guard let newValue = alertController.textFields?.first?.text else { return }
			guard !newValue.isEmpty else { return }

			if let newCompany = DataBaseManager.shared.addCompany(newValue) {
				self.company.append(newCompany)
				self.tableView.reloadData()
			}
		}
		let cancelButton = UIAlertAction(title: Constants.titleCancelButton, style: .cancel) {_ in
			if let indexPath = self.tableView.indexPathForSelectedRow {
				self.tableView.deselectRow(at: indexPath, animated: true)
			}
		}

		alertController.addTextField(configurationHandler: nil)
		alertController.addAction(saveButton)
		alertController.addAction(cancelButton)

		present(alertController, animated: true)
	}

	@objc func addNewCompany() {
		self.showAlert(title: Constants.titleAllertController, body: Constants.bodyAllertController)
	}
}

//MARK: - Delegate

extension CompanyViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.tableView.deselectRow(at: indexPath, animated: true)
		let employeeViewController = EmployeeViewController()
		employeeViewController.company = self.company[indexPath.row]
		navigationController?.pushViewController(employeeViewController, animated: true)
	}
}

//MARK: - DataSource

extension CompanyViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.company.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: CompanyTableViewCell.identifaer, for: indexPath) as? CompanyTableViewCell else { return UITableViewCell() }
		cell.configure(company: company[indexPath.row])

		return cell
	}

	// MARK: - Delete row

	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		true
	}

	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		tableView.deleteRows(at: [indexPath], with: .automatic)
		if editingStyle == .delete {
			DataBaseManager.shared.removeCompany(index: indexPath.row)
		}
		tableView.reloadData()
	}
}

//MARK: - Layout

private extension CompanyViewController {
	func setupViewLayout() {
		setupTableViewLayout()
	}
	
	func setupTableViewLayout() {
		view.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
		])
	}
}

