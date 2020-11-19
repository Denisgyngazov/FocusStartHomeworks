//
//  FirstObserver.swift
//  homework-6-observer
//
//  Created by Денис Гынгазов on 19.11.2020.
//

import Foundation

final class FirstObserver: Observer {
	func update(subject: NotificationCenters) {
		print("FirstObserver: \(subject.state)")
	}
}
