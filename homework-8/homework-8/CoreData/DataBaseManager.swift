//
//  DataBaseManager.swift
//  homework-8
//
//  Created by Денис Гынгазов on 08.12.2020.
//

import UIKit
import CoreData

struct DataBaseManager {
	
	static var shared = DataBaseManager()
	private var data = [Company]()

	private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

	func addCompany(_ name: String) -> Company? {
		guard let entityDescription = NSEntityDescription.entity(forEntityName: "Company", in: context)
		else { return nil }
		let company = NSManagedObject(entity: entityDescription, insertInto: context) as! Company

		company.nameCompany = name

		do {
			try context.save()
			return company
		} catch {
			self.context.rollback()
			return nil
		}
	}

	mutating func removeCompany(index: Int) {
		let deleteData = data.remove(at: index)
		context.delete(deleteData)

		do {
			try context.save()

		} catch  {
			self.context.rollback()
		}

	}

	func fetchCompany() -> [Company] {
		var companys = [Company]()
		let fetchRequest: NSFetchRequest<Company> = Company.fetchRequest()

		do {
			companys = try context.fetch(fetchRequest)
		} catch {
			self.context.rollback()
		}

		return companys
	}

	func addEmployee(company: Company,
					 name: String,
					 age: Int,
					 experience: Int,
					 education: String,
					 position: String) {

		guard let entityDescription = NSEntityDescription.entity(forEntityName: "Employee", in: context)
		else { return }
		let employeeEntity = NSManagedObject(entity: entityDescription, insertInto: context) as! Employee

		employeeEntity.name = name
		employeeEntity.age = Int16(age)
		employeeEntity.experience = Int16(experience)
		employeeEntity.education = education
		employeeEntity.position = position
		employeeEntity.company = company

		do {
			try context.save()

		} catch {
			context.rollback()
		}
	}

	func saveEmployee(employee: Employee,
					  name: String,
					  age: Int,
					  experience: Int,
					  education: String,
					  position: String) {

		employee.name = name
		employee.age = Int16(age)
		employee.experience = Int16(experience)
		employee.education = education
		employee.position = position

		do {
			try context.save()
		} catch {
			context.rollback()
		} 
	}

	func fetchEmployee(company: Company) -> [Employee] {
		var employees = [Employee]()

		let fetchRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
		fetchRequest.predicate = NSPredicate(format: "company == %@", company)

		do {
			employees = try context.fetch(fetchRequest)
		} catch {
			context.rollback()
		}

		return employees
	}
}
