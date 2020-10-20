//
//  Model.swift
//  homework 1
//
//  Created by Денис Гынгазов on 17.10.2020.
//

import Foundation

enum Body: String {
	case Седан = "1"
	case Универсал = "2"
	case Купе = "3"
	
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


