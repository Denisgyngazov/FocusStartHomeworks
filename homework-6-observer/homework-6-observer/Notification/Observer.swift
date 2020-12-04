//
//  Observer.swift
//  homework-6-observer
//
//  Created by Денис Гынгазов on 18.11.2020.
//

import Foundation

protocol Observer: AnyObject {
	func update(subject: NotificationCenters)
}

final class NotificationCenters {
	var state: Int = {
		return Int(arc4random_uniform(15))
	}()

	private var observers = [Observer]()

	func subscribe(_ observer: Observer) {
		observers.append(observer)
	}

	func unsubscribe(_ observer: Observer) {
		if let index = observers.firstIndex(where: {$0 === observer}) {
			observers.remove(at: index)
		}
	}

	func notify() {
		observers.forEach({$0.update(subject: self)})
	}

	func someBusinessLogic() {
		state = Int(arc4random_uniform(15))
		notify()
	}
}

final class MainObserver: Observer {
	func update(subject: NotificationCenters) {
		print("MainObserver: \(subject.state)")
	}
}
