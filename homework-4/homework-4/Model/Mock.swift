//
//  Mock.swift
//  homework-4
//
//  Created by Денис Гынгазов on 06.11.2020.
//

import Foundation

struct Mock {
	 let title: String
	 let description: String
	 let time: String

	static func mockData() -> [Self] {
		return [
			Mock(title: "Заголовок1", description: "Desciption,Desciption", time: "15:24"),
			Mock(title: "Заголовок2", description: "Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption", time: "15:24"),
			Mock(title: "Заголовок3", description: "Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption", time: ""),
			Mock(title: "Заголовок4", description: "Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption,Desciption",time: "15:24"),
			Mock(title: "Заголовок5", description: "",time: "")
		]
	}
}


