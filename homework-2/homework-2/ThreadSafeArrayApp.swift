//
//  ThreadSafeArrayApp.swift
//  homework-2
//
//  Created by Денис Гынгазов on 26.10.2020.
//
import Foundation

final class ThreadSafeArray<Element> {
	private var threadSafeArray = Array<Element>()
	let isolationQueue = DispatchQueue(label: "com.homework-2.isolation", attributes: .concurrent)

	func append(_ item: Element) {
		isolationQueue.async(flags: .barrier) {
			self.threadSafeArray.append(item)
		}
	}

	func remove(at index: Int) {
		isolationQueue.async(flags: .barrier) {
			self.threadSafeArray.remove(at: index)
		}
	}

	subscript(index: Int) -> Element {
		return threadSafeArray[index]
	}

	func contains(_ element: Element) -> Bool {
		if self.threadSafeArray.isEmpty {
			return false
		}
		else {
			return true
		}
	}

	var count: Int {
		return self.threadSafeArray.count
	}

	var isEmpty: Bool {
		if self.threadSafeArray.isEmpty {
			return true
		}
		return self.threadSafeArray.isEmpty
	}
}
