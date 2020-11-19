//
//  Observer.swift
//  homework-6-observer
//
//  Created by Денис Гынгазов on 19.11.2020.
//

import Foundation

protocol Observer: AnyObject {
	func update(subject: NotificationCenters)
}

final class NotificationCenters {
	var state: Int = {
		return Int(arc4random_uniform(15))
	}()

	private lazy var observers = [Observer]()

}

extension NotificationCenters {
	func subscribe(_ observer: Observer) {
		print("Произошла подписка")
		observers.append(observer)
	}

	func unsubscribe(_ observer: Observer) {
		if let index = observers.firstIndex(where: {$0 === observer}) {
			observers.remove(at: index)
			print("Произошла отписка")
		}
	}

	func notify() {
		print("Нотифай")
		observers.forEach({$0.update(subject: self)})
	}

	func businessLogic() {
		print("Бизнес логика")
		state = Int(arc4random_uniform(15))
		notify()
	}
}
