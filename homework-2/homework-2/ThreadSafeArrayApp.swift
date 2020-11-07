//
//  ThreadSafeArrayApp.swift
//  homework-2
//
//  Created by Денис Гынгазов on 26.10.2020.
//
import Foundation

final class ThreadSafeArray<Element> {
	private var threadSafeArray = Array<Element>()
	private let isolationQueue = DispatchQueue(label: "com.homework-2.isolation", attributes: .concurrent)

	func append(_ item: Element) {
		self.isolationQueue.async(flags: .barrier) {
			self.threadSafeArray.append(item)

		}
	}

	func remove(at index: Int) {
		self.isolationQueue.async(flags: .barrier) {
			self.threadSafeArray.remove(at: index)
		}
	}

	subscript(index: Int) -> Element? {
		self.isolationQueue.sync {
			return self.threadSafeArray[index]
		}
	}

	 var count: Int {
		self.isolationQueue.sync {
			return self.threadSafeArray.count
		}
	}

	 var isEmpty: Bool {
		self.isolationQueue.sync {
			return self.threadSafeArray.isEmpty
		}
	}
}

extension ThreadSafeArray where Element: Equatable {
	func contains (_ element: Element) -> Bool {
		var value = isEmpty
		self.isolationQueue.sync {
			value = threadSafeArray.contains(element)
		}
		return value
	}
}



