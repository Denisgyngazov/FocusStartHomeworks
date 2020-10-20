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
	guard var manufacturer = readLine() else { return }
	while (manufacturer.isEmpty){
		print(readString())
		manufacturer = readLine() ?? ""
	}
	print("----------------------")
	print("Введите модель:")
	guard var model = readLine() else { return }
	while(model.isEmpty){
		print(readString())
		model = readLine() ?? ""
	}
	print("----------------------")
	printMenuBodyType()
	guard var body = readLine() else { return }
	while(body.isEmpty){
		print(readString())
		body = readLine() ?? ""
	}
	print("----------------------")
	print("Введите год автомобиля:")
	guard let yearsOfIssue = readLine() else { return }
	print("----------------------")
	print("Введите государественный знак автомобиля:")
	guard let carNumber = readLine() else { return }
	let addCar = Car(manufacturer: manufacturer,
					 model: model,
					 body: Body(rawValue: body)!,
					 yearsOfIssue: Int(yearsOfIssue),
					 carNumber: carNumber)
	cars.append(addCar)
}

func printCar(car:Car) {
	print("--------------------------------",
		  "\nПроизводитель: ", car.manufacturer,
		  "\nМодель: ", car.model,
		  "\nТип кузова: ", car.body,
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
	print("----------------------",
		  "\nВыберите тип кузова",
		  "\n1 - Седан",
		  "\n2 - Универсал",
		  "\n3 - Купе",
		  "\n----------------------")
	print("\nВыберите тип кузова:")
	print("----------------------")
}

func filterCar(car: Car,filterId: String) -> Bool {
	return car.body == Body(rawValue: filterId) ? true : false
}

func readString(errorMesage: String = "Введено неверное значение, повторите попытку") -> String {
	return errorMesage
}

while(true){
	printMenu()
	let swithcMenu = readLine()
	switch swithcMenu {
	case "1":
		newCar()
	case "2":
		if (cars.isEmpty == false){
			for i in cars{
				printCar(car: i)
			}
		} else {
			print("\nСписок автомобилей пуст, добавьте сначала автомобиль")
		}
	case "3":
		printMenuBodyType()
		let menuBody = readLine()
		if (cars.isEmpty == false){
			if (menuBody == "1"){
				for i in cars{
					if filterCar(car: i, filterId: "Седан"){
						printCar(car: i)
					} else {
						print("\nАвто с данным типом кузова отсутвуют\n")
					}
				}
			}else if (menuBody == "2"){
				for i in cars{
					if filterCar(car: i, filterId: "Универсал"){
						printCar(car: i)
					} else {
						print("\nАвто с данным типом кузова отсутвуют\n")
					}
				}
			} else if (menuBody == "3"){
				for i in cars{
					if filterCar(car: i, filterId: "Купе"){
						printCar(car: i)
					} else {
						print("\nАвто с данным типом кузова отсутвуют\n")
					}
				}
			}
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




