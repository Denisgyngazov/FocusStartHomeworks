//
//  MainViewProtocol.swift
//  homework-5
//
//  Created by Денис Гынгазов on 12.11.2020.
//

import Foundation

protocol MainViewProtocol: AnyObject {
	func succes()
	func failure(error: Error)
}
