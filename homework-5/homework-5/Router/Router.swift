//
//  Router.swift
//  homework-5
//
//  Created by Денис Гынгазов on 16.11.2020.
//

import UIKit

final class Router: RouterProtocol {
	var navigationController: UINavigationController?
	var assembly: Assembly?

	init(navigationController: UINavigationController, assembly: Assembly?) {
		self.navigationController = navigationController
		self.assembly = assembly
	}

	func initialViewController() {
		if let navigationController = navigationController {
			guard let mainViewController = assembly?.createMainModule(router: self) else { return }
			navigationController.viewControllers = [mainViewController]
		}
	}

	func showDetail(comment: Comments?) {
		if let navigationController = navigationController {
			guard let detailViewController = assembly?.createDetailModule(comment: comment, router: self) else { return }
			navigationController.pushViewController(detailViewController, animated: true)
		}
	}

	func popToRoot() {
		if let navigationController = navigationController {
			navigationController.popToRootViewController(animated: true)
		}
	}
}
