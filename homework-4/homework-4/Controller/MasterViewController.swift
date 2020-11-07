//
//  MasterViewController.swift
//  homework-4
//
//  Created by Денис Гынгазов on 06.11.2020.
//

import UIKit

class MasterViewController: UITableViewController {
	let mockData: [Mock] = Mock.mockData()
    override func viewDidLoad() {

        super.viewDidLoad()
		setupMasterController()
    }

}

 // MARK: - Data Source

extension MasterViewController {
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return mockData.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let masterCell = tableView.dequeueReusableCell(
				withIdentifier: MasterTableViewCell.identifaer, for: indexPath) as? MasterTableViewCell
		else { return UITableViewCell() }
		masterCell.configure(title: mockData[indexPath.row].title, description: mockData[indexPath.row].description, time: mockData[indexPath.row].time)

		return masterCell
	}
}

// MARK: - Delegate

extension MasterViewController {
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		let detailViewController = DetailViewController()
		detailViewController.title = mockData[indexPath.row].title
		detailViewController.configure(text: mockData[indexPath.row].description)
		let navigationController = UINavigationController(rootViewController: detailViewController)
		self.splitViewController?.showDetailViewController(navigationController, sender: nil)

	}
}

private extension MasterViewController {
	func setupMasterController() {
		
		tableView.register(MasterTableViewCell.self, forCellReuseIdentifier: MasterTableViewCell.identifaer)
		tableView.rowHeight = UITableView.automaticDimension
		self.navigationItem.title = "ДЗ №4"
		self.navigationController?.navigationBar.prefersLargeTitles = true
	}
}

