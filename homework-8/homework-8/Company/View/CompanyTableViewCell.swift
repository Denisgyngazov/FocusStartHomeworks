//
//  CompanyTableViewCell.swift
//  homework-8
//
//  Created by Денис Гынгазов on 07.12.2020.
//

import UIKit

final class CompanyTableViewCell: UITableViewCell {

//MARK: - Identifaer

	static let identifaer = String(describing: self)

//MARK: - Init

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

//MARK: - Configure Cell

extension CompanyTableViewCell {
	func configure(company: Company) {
		self.textLabel?.text = company.nameCompany
	}
}


