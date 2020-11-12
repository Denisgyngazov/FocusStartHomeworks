//
//  NetworksProtocol.swift
//  homework-5
//
//  Created by Денис Гынгазов on 12.11.2020.
//

import Foundation

protocol NetworksProtocol {
	func getComments(completion: @escaping (Result<[Comments]?, Error>) -> ())
}
