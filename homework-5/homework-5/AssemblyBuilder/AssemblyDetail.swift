//
//  AssemblyDetail.swift
//  homework-5
//
//  Created by Денис Гынгазов on 17.11.2020.
//

import UIKit

enum AssemblyDetailBuilder {
	static func createDetailModule(comment: Comments?) -> UIViewController {
		let view = DetailViewController()
		let networks = Networks()
		let presenter = DetailPresenter(view: view, networks: networks, comment: comment)
		view.presenter = presenter
		return view
	}
}
