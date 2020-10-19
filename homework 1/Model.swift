//
//  Model.swift
//  homework 1
//
//  Created by Денис Гынгазов on 17.10.2020.
//

import Foundation

enum Body: String {
	case sedan = "Седан"
	case stationWagon = "Универсал"
	case coupe = "Купе"
	case notCorrect = "Некоректный тип"
	}

struct Car{
	let manufacturer : String
	let model : String
	let body : Body
	let yearsOfIssue: Int?
	let carNumber : String?

	init(manufacturer: String, model: String, body: String, yearsOfIssue: Int?, carNumber: String?) {
		self.manufacturer = manufacturer
		self.model = model
		self.body = Body(rawValue: body) ?? Body.notCorrect
		self.yearsOfIssue = yearsOfIssue
		self.carNumber = carNumber
	}
}


