//
//  EmployeeViewController.swift
//  homework-8
//
//  Created by Денис Гынгазов on 07.12.2020.
//

import UIKit

final class EmployeeViewController: UIViewController {
	
	//MARK: - Property
	
	private var employee = [Employee]()
	var company: Company?
	
	//MARK: - View
	
	private let tableView = UITableView()
	
	//MARK: - Life Cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		self.tableView.register(EmployeeTableViewCell.self, forCellReuseIdentifier: EmployeeTableViewCell.identifaer)
		
		setupViewLayout()
		setupNavigationController()
		
		self.tableView.delegate = self
		self.tableView.dataSource = self
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.employee = DataBaseManager.shared.fetchEmployee(company: company!)
		self.tableView.reloadData()
	}
}

// MARK: - Push EmployeeDetailViewController

extension EmployeeViewController{
	func openEmployeeDetailViewController(employee: Employee? = nil) {
		let employeeDetailViewController = EmployeeDetailViewController()
		if let employee = employee {
			employeeDetailViewController.employee = employee
		}
		
		if let company = company {
			employeeDetailViewController.company = company
		}
		navigationController?.pushViewController(employeeDetailViewController, animated: true)
	}
	
	@objc func pushEmployeeDetail() {
		self.openEmployeeDetailViewController()
	}
}


//MARK: - Data Source

extension EmployeeViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return employee.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifaer, for: indexPath) as? EmployeeTableViewCell else { return UITableViewCell() }
		cell.configure(employee: employee[indexPath.row])
		
		return cell
	}
}

//MARK: - Delegate

extension EmployeeViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.tableView.deselectRow(at: indexPath, animated: true)
		self.openEmployeeDetailViewController(employee: employee[indexPath.row])
	}
}


// MARK: - Setup Navigation

private extension EmployeeViewController {
	func setupNavigationController() {
		self.title = "Работники"
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .done, target: self , action: #selector(pushEmployeeDetail))
		
	}
}

//MARK: - Layout

private extension EmployeeViewController {
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
