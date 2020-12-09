//
//  Company+CoreDataProperties.swift
//  homework-8
//
//  Created by Денис Гынгазов on 07.12.2020.
//
//

import Foundation
import CoreData


extension Company {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Company> {
        return NSFetchRequest<Company>(entityName: "Company")
    }

    @NSManaged public var nameCompany: String?
    @NSManaged public var employee: NSSet? // Employee?

}

extension Company {
	@objc(addEmployeeObject:)
	@NSManaged public func addEmployee(_ value: Employee)

	@objc(removeEmployeeObject:)
	@NSManaged public func removeEmployee(_ value: Employee)

	@objc(addEmployee:)
	@NSManaged public func addEmployee(_ value: NSSet)

	@objc(removeEmployee:)
	@NSManaged public func removeEmployee(_ value: NSSet)
}

extension Company : Identifiable {

}
