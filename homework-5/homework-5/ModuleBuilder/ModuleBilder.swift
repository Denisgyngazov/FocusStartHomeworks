//
//  ModuleBilder.swift
//  homework-5
//
//  Created by Денис Гынгазов on 12.11.2020.
//

import UIKit

class ModuleBuilder: Builder {
	static func createMainModule() -> UIViewController {
		let view = MainViewController()
		let networks = Networks()
		let presenter = MainPresenter(view: view, networks: networks)
		view.presenter = presenter
		return view
	}

	static func createDetailModule(comment: Comments?) -> UIViewController {
		let view = DetailViewController()
		let networks = Networks()
		let presenter = DetailPresenter(view: view, networks: networks, comment: comment)
		view.presenter = presenter
		return view
	}
}

