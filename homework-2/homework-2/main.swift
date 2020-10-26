//
//  main.swift
//  homework-2
//
//  Created by Денис Гынгазов on 23.10.2020.
//

import Foundation

var safeArray = ThreadSafeArray<Any>()

let group = DispatchGroup()
group.enter()
DispatchQueue.global(qos: .default).async {
	for number in 0...1000 {
		safeArray.append(number)
	}
	group.leave()
}

group.enter()
DispatchQueue.global(qos: .default).async {
	for number in 0...1000 {
		safeArray.append(number)
	}
	group.leave()
}
group.wait()
print(safeArray.count)
