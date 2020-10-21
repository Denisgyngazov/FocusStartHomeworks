//
//  Model.swift
//  homework 1
//
//  Created by Денис Гынгазов on 17.10.2020.
//

import Foundation

enum Body: Int, CaseIterable {
	case sedan = 1
	case statoonWagon = 2
	case coupe = 3

	var name: String {
		switch self {
			case .sedan: return "Седан"
			case .statoonWagon: return "Универсал"
			case .coupe: return "Купе"
		}
	}
}

struct Car {
	let manufacturer: String
	let model: String
	let body: Body
	let yearsOfIssue: Int?
	let carNumber: String?
	
	init(manufacturer: String,
		 model: String,
		 body: Body,
		 yearsOfIssue: Int?,
		 carNumber: String?) {
		self.manufacturer = manufacturer
		self.model = model
		self.body = body
		self.yearsOfIssue = yearsOfIssue
		self.carNumber = carNumber
	}
}


