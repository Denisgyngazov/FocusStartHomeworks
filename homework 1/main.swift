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
	print("----------------------")
	print("Введите год автомобиля:")
	guard let yearsOfIssue = readLine() else { return }
	print("----------------------")
	print("Введите государественный знак автомобиля:")
	guard let carNumber = readLine() else { return }
	let addCar = Car(manufacturer: manufacturer,
					 model: model,
					 body: Body(rawValue: Int(body)!)!,
					 yearsOfIssue: Int(yearsOfIssue),
					 carNumber: carNumber)
	cars.append(addCar)
}

func printCar(car:Car) {
	print("--------------------------------",
		  "\nПроизводитель: ", car.manufacturer,
		  "\nМодель: ", car.model,
		  "\nТип кузова: ", car.body.name,
		  "\nГод выпуска: ", car.yearsOfIssue == nil ? "-": car.yearsOfIssue! as Any,
		  "\nГос номер: ", car.carNumber == nil ? "": car.carNumber! as Any,
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
	guard var value = readLine() else { return errorMesage }
	while (value.isEmpty){
		print(errorMesage)
		value = readLine() ?? ""
	}
	return value
}

func filterCarBodyType() {
	guard let menu = readLine() else { return }
	let selectedBody: Body = Body(rawValue: Int(menu)!)!
	let filteredCars = cars.filter { $0.body == selectedBody }
	for i in filteredCars {
		printCar(car: i)
	}
}

while true {
	printMenu()
	let swithcMenu = readLine()
	switch swithcMenu {
	case "1":
		newCar()
	case "2":
		if (cars.isEmpty == false){
			for i in cars {
				printCar(car: i)
			}
		} else {
			print("\nСписок автомобилей пуст, добавьте сначала автомобиль")
		}
	case "3":
		printMenuBodyType()
		if (cars.isEmpty == false) {
			filterCarBodyType()
		} else {
			print("\nCписок автомобилей пуст, добавьте сначала автомобиль\n")
		}
	default:
		break
	}
	if (swithcMenu == "0"){
		break
	}
}




