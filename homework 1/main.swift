//
//  main.swift
//  homework 1
//
//  Created by Денис Гынгазов on 17.10.2020.
//

import Foundation

var cars = Array<Car>()
func newCar(){

	print("Введите марку:")
	var manufacturer = readLine()!
	while(manufacturer == ""){
		print("Поле пустое, введите производителя")
		manufacturer = readLine()!
	}
	print("Введите модель:")
	var model = readLine()!
	while(model == ""){
		print("Поле пустое, введите модель")
		model = readLine()!
	}
	print("Введите тип кузова:")
	var body = readLine()!
	while(body == ""){
		print("Поле пустое, введите тип кузова")
		body = readLine()!
	}
	print("Введите год автомобиля:")
	let yearsOfIssue = readLine()!
	print("Введите государественный знак автомобиля:")
	let carNumber = readLine()!
	let addCar = Car(manufacturer: manufacturer, model: model, body: body,yearsOfIssue: Int(yearsOfIssue), carNumber: carNumber)
	cars.append(addCar)
}

func printCar(car:Car){
	print("--------------------------------",
		  "\nПроизводитель: ", car.manufacturer,
		  "\nМодель: ", car.model,
		  "\nТип кузова: ", car.body.rawValue,
		  "\nГод выпуска: ", car.yearsOfIssue == nil ? "-": car.yearsOfIssue! as Any,
		  "\nГос номер: ", car.carNumber == nil ? "": car.carNumber! as Any,
		  "\n--------------------------------")
}

func printMenu(){
	print("Доброго времени суток, чтобы вы хотели выполнить?",
		  "\n1 - Добавить новый автомобиль",
		  "\n2 - Вывести все автомобили",
		  "\n3 - Вывести по фильтру: тип кузова автомобиля",
		  "\n0 - Выход")
	print("\nВведите пункт меню:")
}
func printMenuBodyType(){
	print("\nВыберите тип кузова",
		  "\n1 - Седан",
		  "\n2 - Универсал",
		  "\n3 - Купе")
	print("\nВыберите тип кузова:")
}

func filterCar(car: Car,filterId: String) -> Bool{
	return car.body == Body(rawValue: filterId) ? true : false
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




