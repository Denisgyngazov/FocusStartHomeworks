//
//  MockData.swift
//  homework-5
//
//  Created by Денис Гынгазов on 12.11.2020.
//

import Foundation

struct Comments: Decodable {
	var postId: Int
	var id: Int
	var name: String
	var email: String
	var body: String
}
