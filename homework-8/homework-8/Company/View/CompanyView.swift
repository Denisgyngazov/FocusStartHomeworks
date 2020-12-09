//
//  CompanyView.swift
//  homework-8
//
//  Created by Денис Гынгазов on 07.12.2020.
//

import UIKit

final class CompanyView: UIView {

	//MARK: - Property

	private var company = [Company]()
	weak var delegate: SomeViewDelegate?

	private enum Constants {
		static let titleSaveButton: String = "Сохранить"
		static let titleCancelButton: String = "Отменить"

		static let titleAllertController: String = "Новая компания"
		static let bodyAllertController: String = "Введите название компании"

		static let titleEmployeeViewController = "Сотрудники"
	}

	//MARK: - View

	private let tableView = UITableView()

	//MARK: - Init

	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .systemBackground
		self.company = DataBaseManager.shared.fetchCompany()
		self.tableView.register(CompanyTableViewCell.self, forCellReuseIdentifier: CompanyTableViewCell.identifaer)

		setupViewLayout()

		self.tableView.delegate = self
		self.tableView.dataSource = self
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Allert Constroller

extension CompanyView {
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

		findViewController()?.present(alertController, animated: true)
	}

	@objc func addNewCompany() {
		self.showAlert(title: Constants.titleAllertController, body: Constants.bodyAllertController)
	}
}

//MARK: - Delegate

extension CompanyView: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		delegate?.openSomeController(title: Constants.titleEmployeeViewController)
	}
}

//MARK: - DataSource

extension CompanyView: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.company.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: CompanyTableViewCell.identifaer, for: indexPath) as? CompanyTableViewCell else { return UITableViewCell() }
		cell.configure(company: company[indexPath.row])

		return cell
	}

	//	func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
	//		//let compant = company[indexPath.row]
	//
	//		let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { _, _, complete in
	//
	//			//DataBaseManager.shared.removeCompany(at: 0)
	//			self.tableView.deleteRows(at: [indexPath], with: .automatic)
	//			complete(true)
	//
	//		}
	//
	//		let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
	//		configuration.performsFirstActionWithFullSwipe = true
	//		self.tableView.reloadData()
	//		return configuration
	//	}

	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		true
	}

	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

		if editingStyle == .delete {
			DataBaseManager.shared.removeCompany(index: indexPath.row)
		}
		tableView.deleteRows(at: [indexPath], with: .automatic)
		tableView.reloadData()
		
	}
}

//MARK: - Layout

private extension CompanyView {
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

