//
//  EmployeeTableViewCell.swift
//  homework-8
//
//  Created by Денис Гынгазов on 09.12.2020.
//

import UIKit

final class EmployeeTableViewCell: UITableViewCell {

//MARK: Identifaer

	static let identifaer = String(describing: self)

//MARK: Init

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Configure Cell

extension EmployeeTableViewCell {
	func configure(employee: Employee) {
		self.textLabel?.text = employee.name
	}
}
