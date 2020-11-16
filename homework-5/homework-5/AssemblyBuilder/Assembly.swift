//
//  ModuleBilder.swift
//  homework-5
//
//  Created by Денис Гынгазов on 12.11.2020.
//

import UIKit

final class AssemblyBuilder: Assembly {
	func createMainModule(router: RouterProtocol) -> UIViewController {
		let view = MainViewController()
		let networks = Networks()
		let presenter = MainPresenter(view: view, networks: networks, router: router)
		view.presenter = presenter
		return view
	}

	func createDetailModule(comment: Comments?, router: RouterProtocol) -> UIViewController {
		let view = DetailViewController()
		let networks = Networks()
		let presenter = DetailPresenter(view: view, networks: networks, router: router, comment: comment)
		view.presenter = presenter
		return view
	}
}


