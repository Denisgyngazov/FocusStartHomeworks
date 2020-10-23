//
//  main.swift
//  homework 1
//
//  Created by Денис Гынгазов on 17.10.2020.
//

import Foundation

var cars = Array<Car>()

func newCar() {
	print("----------------------")
	print("Введите марку:")
	let manufacturer = readString()
	print("----------------------")
	print("Введите модель:")
	let model = readString()
	print("----------------------")
	printMenuBodyType()
	let body = readString()
	guard let selectedBodyNumber = Int(body),
		  let selectedBodyNumberInt = Body(rawValue: selectedBodyNumber) else { return }
	print("----------------------")
	print("Введите год автомобиля:")
	let yearsOfIssue = Int(readLine() ?? "")
	print("----------------------")
	print("Введите государественный знак автомобиля:")
	let carNumber = readLine()
	let addCar = Car(manufacturer: manufacturer,
					 model: model,
					 body: selectedBodyNumberInt,
					 yearsOfIssue: yearsOfIssue,
					 carNumber: carNumber)
	cars.append(addCar)
}

func printCar(_ car: Car) {
	let manufacturer = car.manufacturer
	let model = car.model
	let body = car.body.name
	let yearsOfIssue = car.yearsOfIssue?.description ?? "-"
	let carNumber = car.carNumber ?? ""
	print("--------------------------------",
		  "\nПроизводитель: ", manufacturer,
		  "\nМодель: ", model,
		  "\nТип кузова: ", body,
		  "\nГод выпуска: ", yearsOfIssue,
		  "\nГос номер: ", carNumber,
		  "\n--------------------------------")
}

func printMenu() {
	print("-------------------------------------------------",
		  "\nДоброго времени суток, чтобы вы хотели выполнить?",
		  "\n1 - Добавить новый автомобиль",
		  "\n2 - Вывести все автомобили",
		  "\n3 - Вывести по фильтру: тип кузова автомобиля",
		  "\n0 - Выход",
		  "\n-------------------------------------------------")
	print("\nВведите пункт меню:")
	print("\n----------------------")
}

func printMenuBodyType() {
	for body in Body.allCases {
		print("\(body.rawValue) - \(body.name)")
	}
	print("Выберите тип кузова:")
	print("----------------------")
}

func readString(errorMesage: String = "Введено неверное значение, повторите попытку") -> String {
	var value = readLine() ?? ""
	while value.isEmpty {
		print(errorMesage)
		value = readLine() ?? ""
	}
	return value
}

func filterCarBodyType() {
	guard let selectedBodyNumberString = readLine(),
		  let selectedBodyNumber = Int(selectedBodyNumberString),
		  let selectedBody = Body(rawValue: selectedBodyNumber) else {
		return
	}
	let filteredCars = cars.filter { $0.body == selectedBody }
	for car in filteredCars {
		printCar(car)
	}
}

while true {
	printMenu()
	let switchMenu = readLine()
	switch switchMenu {
	case "1":
		newCar()
	case "2":
		if cars.isEmpty == false {
			for car in cars {
				printCar(car)
			}
		} else {
			print("\nСписок автомобилей пуст, добавьте сначала автомобиль")
		}
	case "3":
		printMenuBodyType()
		if cars.isEmpty == false {
			filterCarBodyType()
		} else {
			print("\nCписок автомобилей пуст, добавьте сначала автомобиль\n")
		}
	case "0":
		exit(0)
	default:
		break
	}
}




