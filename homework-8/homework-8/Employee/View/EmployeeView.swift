//
//  EmployeeView.swift
//  homework-8
//
//  Created by Денис Гынгазов on 09.12.2020.
//

import UIKit

final class EmployeeView: UIView {

//MARK: - Property

	private var employee = [Employee]()
	private var company: Company?
	weak var delegate: EmployeeViewDelegate?

//MARK: - View

	private let tableView = UITableView()

//MARK: - Init

	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .systemBackground
		//self.employee = DataBaseManager.shared.fetchEmployee(company: company!)
		self.tableView.register(EmployeeTableViewCell.self, forCellReuseIdentifier: EmployeeTableViewCell.identifaer)

		setupViewLayout()

		self.tableView.delegate = self
		self.tableView.dataSource = self
		tableView.reloadData()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

//MARK: - Delegate

extension EmployeeView: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.tableView.deselectRow(at: indexPath, animated: true)
		delegate?.openSomeController()
	}
}

//MARK: - Data Source

extension EmployeeView: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return employee.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.identifaer, for: indexPath) as? EmployeeTableViewCell else { return UITableViewCell() }
		cell.configure(employee: employee[indexPath.row])

		return cell
	}
}

//MARK: - Layout

private extension EmployeeView {
	func setupViewLayout() {
		setupTableViewLayout()
	}

	func setupTableViewLayout() {
		self.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
			tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
		])
	}
}
