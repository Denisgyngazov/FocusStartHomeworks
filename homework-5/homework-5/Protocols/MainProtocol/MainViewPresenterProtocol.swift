//
//  MainViewPresenterProtocol.swift
//  homework-5
//
//  Created by Денис Гынгазов on 12.11.2020.
//

import Foundation

protocol MainViewPresenterProtocol: AnyObject {
	func getComments()
	var comments: [Comments]? { get set }
	func tapOnTheComment(comment: Comments?)
}
