//
//  Employee+CoreDataProperties.swift
//  homework-8
//
//  Created by Денис Гынгазов on 07.12.2020.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var age: Int16
    @NSManaged public var education: String?
    @NSManaged public var experience: Int16
    @NSManaged public var name: String?
    @NSManaged public var position: String?
    @NSManaged public var company: Company?

}

extension Employee : Identifiable {

}
