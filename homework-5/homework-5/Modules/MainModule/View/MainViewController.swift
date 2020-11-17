//
//  ViewController.swift
//  homework-5
//
//  Created by Денис Гынгазов on 12.11.2020.
//

import UIKit

protocol MainViewProtocol: AnyObject {
	func succes()
	func failure(error: Error)
}

final class MainViewController: UIViewController {

// MARK: - View

	@IBOutlet weak var tableView: UITableView!
	var presenter: MainViewPresenterProtocol?

// MARK: - Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
	}
}

// MARK: - Data Source

extension MainViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return presenter?.comments?.count ?? 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		let comment = presenter?.comments?[indexPath.row]
		cell.textLabel?.text = comment?.body
		return cell
	}
}

// MARK: - Delegate

extension MainViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let comment = presenter?.comments?[indexPath.row]
		let detailViewController = AssemblyDetailBuilder.createDetailModule(comment: comment)
		navigationController?.pushViewController(detailViewController, animated: true)
	}
}

// MARK: - Succes && Failure Allert

extension MainViewController: MainViewProtocol {
	func succes() {
		tableView.reloadData()
	}

	func failure(error: Error) {
		let alertController = UIAlertController(title: "Failure", message: "Unsuccessful download", preferredStyle: .alert)
		let action = UIAlertAction(title: "Ok", style: .default) { (action) in
		}
		alertController.addAction(action)
		self.present(alertController, animated: true, completion: nil)
	}
}



