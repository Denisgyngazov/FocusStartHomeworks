//
//  DetailBuilder.swift
//  homework-6-builder
//
//  Created by Денис Гынгазов on 20.11.2020.
//

import UIKit

protocol ModuleBuilder {
	func build() -> UIViewController
}

final class DetailBuilder: ModuleBuilder {
	var title: String?

	func setTitle(_ title: String) -> DetailBuilder {
		self.title = title
		return self
	}

	func build() -> UIViewController {
		guard let title = title  else {fatalError("Добавь title")}
		let presenter = MainPresenter()
		let interactor = MainInteractor(presenter: presenter)
		let controller = DetailViewController(title: title, interactor: interactor)
		presenter.viewController = controller
		return controller
	}
}
